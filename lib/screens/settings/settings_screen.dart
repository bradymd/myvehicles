import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import 'package:my_vehicles/providers/database_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/providers/profile_provider.dart';
import 'package:my_vehicles/providers/document_provider.dart';
import 'package:my_vehicles/providers/settings_provider.dart';
import 'package:my_vehicles/providers/tip_jar_provider.dart';
import 'package:my_vehicles/services/backup_service.dart';
import 'package:my_vehicles/services/integrity_service.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';
import 'package:my_vehicles/widgets/sparkle_button.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  bool _isBackingUp = false;
  bool _isRestoring = false;
  bool _isChecking = false;
  AutoBackupInfo? _autoBackupInfo;

  @override
  void initState() {
    super.initState();
    _loadAutoBackupInfo();
  }

  Future<void> _loadAutoBackupInfo() async {
    final info = await BackupService.getAutoBackupInfo();
    if (mounted) setState(() => _autoBackupInfo = info);
  }

  // --- Backup ---

  Future<void> _createBackup() async {
    setState(() => _isBackingUp = true);
    try {
      await ref.read(databaseProvider).close();
      final zipPath = await BackupService.createBackup();
      ref.invalidate(databaseProvider);

      if (!mounted) return;

      if (Platform.isAndroid || Platform.isIOS) {
        final box = context.findRenderObject() as RenderBox?;
        await Share.shareXFiles(
          [XFile(zipPath)],
          subject: 'MyVehicles Backup',
          sharePositionOrigin:
              box != null ? box.localToGlobal(Offset.zero) & box.size : Rect.zero,
        );
      } else {
        final downloadsDir = await getDownloadsDirectory();
        final backupName = p.basename(zipPath);
        if (downloadsDir != null) {
          final destPath = p.join(downloadsDir.path, backupName);
          await File(zipPath).copy(destPath);
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('Saved to Downloads/$backupName')),
            );
          }
        } else {
          final savePath = await FilePicker.platform.saveFile(
            dialogTitle: 'Save Backup',
            fileName: backupName,
          );
          if (savePath != null) {
            await File(zipPath).copy(savePath);
            if (mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Backup saved successfully')),
              );
            }
          }
        }
      }
    } catch (e) {
      ref.invalidate(databaseProvider); // ensure DB reopens on error
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Backup failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isBackingUp = false);
    }
  }

  // --- Restore (shared logic) ---

  Future<void> _restoreFrom(String zipPath) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Restore Backup?'),
        content: const Text(
          'This will replace all current data with the backup. '
          'This action cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: const Text('Restore'),
          ),
        ],
      ),
    );

    if (confirmed != true || !mounted) return;

    setState(() => _isRestoring = true);
    try {
      await ref.read(databaseProvider).close();
      final success = await BackupService.restoreFromBackup(zipPath);
      ref.invalidate(databaseProvider);
      ref.invalidate(vehiclesProvider);
      ref.invalidate(profileProvider);
      ref.invalidate(documentsProvider);
      ref.invalidate(settingsProvider);

      if (!mounted) return;

      if (success) {
        // Run integrity check automatically after restore
        final db = ref.read(databaseProvider);
        final integrity = await IntegrityService.runCheck(db);

        if (!mounted) return;

        if (integrity.hasIssues) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(
                'Restored with ${integrity.issues.length} issue${integrity.issues.length == 1 ? '' : 's'} — check results',
              ),
              backgroundColor: Colors.orange,
            ),
          );
          _showIntegrityResult(integrity);
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Backup restored successfully')),
          );
          context.go('/');
        }
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Restore failed — ZIP does not contain a valid backup'),
          ),
        );
      }
    } catch (e) {
      ref.invalidate(databaseProvider);
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Restore failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isRestoring = false);
    }
  }

  Future<void> _restoreFromFile() async {
    final downloadsDir = await getDownloadsDirectory();
    final result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['zip'],
      initialDirectory: downloadsDir?.path,
    );
    if (result == null || result.files.isEmpty) return;
    final filePath = result.files.single.path;
    if (filePath == null) return;
    await _restoreFrom(filePath);
  }

  Future<void> _restoreAutoBackup() async {
    final path = await BackupService.getAutoBackupPath();
    if (path == null) return;
    await _restoreFrom(path);
  }

  // --- Integrity Check ---

  Future<void> _runIntegrityCheck() async {
    setState(() => _isChecking = true);
    try {
      final db = ref.read(databaseProvider);
      final result = await IntegrityService.runCheck(db);
      if (!mounted) return;
      _showIntegrityResult(result);
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Integrity check failed: $e')),
        );
      }
    } finally {
      if (mounted) setState(() => _isChecking = false);
    }
  }

  void _showIntegrityResult(IntegrityResult result) {
    showDialog(
      context: context,
      builder: (ctx) => AlertDialog(
        title: Row(
          children: [
            Icon(
              result.hasIssues
                  ? Icons.warning_amber_rounded
                  : Icons.check_circle_rounded,
              color: result.hasIssues ? Colors.orange : Colors.green,
            ),
            const SizedBox(width: 8),
            Text(result.hasIssues ? 'Issues Found' : 'All Clear'),
          ],
        ),
        content: result.hasIssues
            ? SizedBox(
                width: double.maxFinite,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      '${result.issues.length} problem${result.issues.length == 1 ? '' : 's'} '
                      'found in ${result.totalChecked} file '
                      'reference${result.totalChecked == 1 ? '' : 's'}.',
                      style: AppTextStyles.caption,
                    ),
                    const SizedBox(height: 12),
                    Flexible(
                      child: ListView.separated(
                        shrinkWrap: true,
                        itemCount: result.issues.length,
                        separatorBuilder: (_, _) => const Divider(height: 1),
                        itemBuilder: (_, i) {
                          final issue = result.issues[i];
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${issue.recordType} — ${issue.recordLabel}',
                                  style: AppTextStyles.bodyBold,
                                ),
                                const SizedBox(height: 2),
                                Text(
                                  '${issue.field}: ${issue.problem}',
                                  style: AppTextStyles.caption.copyWith(
                                    color: Colors.orange.shade800,
                                  ),
                                ),
                                Text(
                                  issue.path,
                                  style: AppTextStyles.caption.copyWith(
                                    fontSize: 11,
                                  ),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              )
            : Text(
                'All ${result.totalChecked} file '
                'reference${result.totalChecked == 1 ? '' : 's'} '
                '${result.totalChecked == 1 ? 'is' : 'are'} valid.',
                style: AppTextStyles.body,
              ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }

  // --- Helpers ---

  String _formatDate(DateTime dt) =>
      DateFormat('d MMM yyyy, HH:mm').format(dt);

  String _formatSize(int bytes) {
    if (bytes < 1024) return '$bytes B';
    if (bytes < 1024 * 1024) return '${(bytes / 1024).toStringAsFixed(1)} KB';
    return '${(bytes / (1024 * 1024)).toStringAsFixed(1)} MB';
  }

  // --- Build ---

  @override
  Widget build(BuildContext context) {
    final tipJar = ref.watch(tipJarProvider);

    return AppScaffold(
      title: 'Settings & Tools',
      useOverlayNav: true,
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          // Section header
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text('Backup & Restore',
                style: AppTextStyles.subheading
                    .copyWith(color: AppColors.primary)),
          ),

          // Auto-backup info card
          if (_autoBackupInfo != null)
            Card(
              margin: const EdgeInsets.only(bottom: 8),
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Icon(Icons.autorenew_rounded,
                            color: AppColors.primary, size: 20),
                        const SizedBox(width: 8),
                        Text('Auto-Backup', style: AppTextStyles.bodyBold),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Last: ${_formatDate(_autoBackupInfo!.timestamp)}',
                      style: AppTextStyles.caption,
                    ),
                    Text(
                      'Size: ${_formatSize(_autoBackupInfo!.sizeBytes)}',
                      style: AppTextStyles.caption,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: _isRestoring ? null : _restoreAutoBackup,
                        icon: const Icon(Icons.restore_rounded, size: 18),
                        label: const Text('Restore Auto-Backup'),
                      ),
                    ),
                  ],
                ),
              ),
            ),

          // Create backup
          Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: const Icon(Icons.backup_rounded,
                  color: AppColors.primary),
              title: Text('Create Backup', style: AppTextStyles.bodyBold),
              subtitle: Text('Save all data as a ZIP file',
                  style: AppTextStyles.caption),
              trailing: _isBackingUp
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child:
                          CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.chevron_right_rounded),
              onTap: _isBackingUp ? null : _createBackup,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),

          // Restore from file
          Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading:
                  const Icon(Icons.restore_rounded, color: AppColors.accent),
              title:
                  Text('Restore from File', style: AppTextStyles.bodyBold),
              subtitle: Text('Replace data from a backup ZIP',
                  style: AppTextStyles.caption),
              trailing: _isRestoring
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child:
                          CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.chevron_right_rounded),
              onTap: _isRestoring ? null : _restoreFromFile,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),

          const SizedBox(height: 24),

          // Data Tools section
          Padding(
            padding: const EdgeInsets.only(left: 4, bottom: 8),
            child: Text('Data Tools',
                style: AppTextStyles.subheading
                    .copyWith(color: AppColors.primary)),
          ),

          Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: const Icon(Icons.verified_user_rounded,
                  color: AppColors.primary),
              title: Text('Data Integrity Check',
                  style: AppTextStyles.bodyBold),
              subtitle: Text('Verify all file references are valid',
                  style: AppTextStyles.caption),
              trailing: _isChecking
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child:
                          CircularProgressIndicator(strokeWidth: 2))
                  : const Icon(Icons.chevron_right_rounded),
              onTap: _isChecking ? null : _runIntegrityCheck,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),

          // Support link
          Card(
            margin: const EdgeInsets.only(bottom: 8),
            child: ListTile(
              leading: const Icon(Icons.support_rounded,
                  color: AppColors.primary),
              title: Text('Support Page', style: AppTextStyles.bodyBold),
              subtitle: Text('Help, FAQs & bug reports',
                  style: AppTextStyles.caption),
              trailing: const Icon(Icons.open_in_new_rounded, size: 18),
              onTap: () => launchUrl(
                Uri.parse('https://bradymd.github.io/myvehicles/'),
                mode: LaunchMode.externalApplication,
              ),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16)),
            ),
          ),

          const SizedBox(height: 24),

          // Tip jar
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/images/rescue-character.png',
                      width: 60,
                      height: 60,
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text('Support Development',
                      style: AppTextStyles.bodyBold),
                  const SizedBox(height: 4),
                  Text(
                    'Love MyVehicles? Leave a tip!',
                    style: AppTextStyles.caption,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  tipJar.when(
                    data: (state) {
                      if (state.lastSuccess) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(Icons.favorite_rounded,
                                color: AppColors.success, size: 18),
                            const SizedBox(width: 8),
                            Text('Thank you!',
                                style: AppTextStyles.bodyBold
                                    .copyWith(color: AppColors.success)),
                          ],
                        );
                      }
                      if (state.products.isEmpty) {
                        return Text(
                          'Tip jar available on iOS and Android.',
                          style: AppTextStyles.caption,
                        );
                      }
                      return Row(
                        children: state.products.map((product) {
                          return Expanded(
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 4),
                              child: SparkleButton(
                                label: product.price,
                                icon: Icons.favorite_rounded,
                                isLoading: state.isPurchasing,
                                onPressed: state.isPurchasing
                                    ? null
                                    : () => ref
                                        .read(tipJarProvider.notifier)
                                        .buy(product),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                    loading: () => const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    ),
                    error: (_, _) => Text(
                      'Tip jar available on iOS and Android.',
                      style: AppTextStyles.caption,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
