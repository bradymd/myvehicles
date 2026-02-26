import 'dart:io';
import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:my_vehicles/models/driver_profile.dart';
import 'package:my_vehicles/providers/profile_provider.dart';
import 'package:my_vehicles/services/document_service.dart';
import 'package:my_vehicles/theme/app_colors.dart';
import 'package:my_vehicles/theme/app_text_styles.dart';
import 'package:my_vehicles/utils/date_helpers.dart';
import 'package:my_vehicles/widgets/app_scaffold.dart';

class ProfileDetailScreen extends ConsumerWidget {
  const ProfileDetailScreen({super.key, required this.profileId});
  final String profileId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final profilesAsync = ref.watch(profilesProvider);

    return profilesAsync.when(
      loading: () => const AppScaffold(
        title: '',
        showBackButton: true,
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (e, _) => AppScaffold(
        title: '',
        showBackButton: true,
        body: Center(child: Text('Error: $e')),
      ),
      data: (profiles) {
        final profile = profiles.where((p) => p.id == profileId).firstOrNull;

        if (profile == null) {
          return const AppScaffold(
            title: '',
            showBackButton: true,
            body: Center(child: Text('Profile not found')),
          );
        }

        return AppScaffold(
          title: profile.name.isNotEmpty ? profile.name : 'Driver Profile',
          useOverlayNav: true,
          showBackButton: true,
          overlayFabIcon: Icons.edit_rounded,
          overlayFabOnPressed: () => context.push('/edit-profile/${profile.id}'),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                _LicenceCard(profile: profile),

                if (profile.address.isNotEmpty)
                  _SectionCard(
                    title: 'Address',
                    icon: Icons.home_rounded,
                    children: [
                      Text(profile.address, style: AppTextStyles.body),
                    ],
                  ),

                if (profile.emergencyContactName.isNotEmpty ||
                    profile.emergencyContactPhone.isNotEmpty)
                  _SectionCard(
                    title: 'Emergency Contact',
                    icon: Icons.emergency_rounded,
                    children: [
                      _InfoRow('Name', profile.emergencyContactName),
                      _InfoRow('Phone', profile.emergencyContactPhone),
                    ],
                  ),

                if (profile.bloodType.isNotEmpty)
                  _SectionCard(
                    title: 'Medical',
                    icon: Icons.medical_information_rounded,
                    children: [
                      _InfoRow('Blood Type', profile.bloodType),
                    ],
                  ),

                if (profile.notes.isNotEmpty)
                  _SectionCard(
                    title: 'Notes',
                    icon: Icons.note_rounded,
                    children: [
                      Text(profile.notes, style: AppTextStyles.body),
                    ],
                  ),

                Center(
                  child: TextButton.icon(
                    onPressed: () => _confirmDelete(context, ref, profile),
                    icon: const Icon(Icons.delete_outline_rounded,
                        color: AppColors.danger),
                    label: const Text('Delete Profile',
                        style: TextStyle(color: AppColors.danger)),
                  ),
                ),
                const SizedBox(height: 32),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> _confirmDelete(
      BuildContext context, WidgetRef ref, DriverProfile profile) async {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (ctx) => AlertDialog(
        title: const Text('Delete Profile'),
        content: Text(
          'Delete ${profile.name.isNotEmpty ? profile.name : "this profile"}? This cannot be undone.',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            style: TextButton.styleFrom(foregroundColor: AppColors.danger),
            child: const Text('Delete'),
          ),
        ],
      ),
    );

    if (confirmed == true) {
      await ref.read(profilesProvider.notifier).deleteProfile(profile.id);
      if (context.mounted) context.pop();
    }
  }
}

// ---------------------------------------------------------------------------
// Flippable licence card
// ---------------------------------------------------------------------------

class _LicenceCard extends StatefulWidget {
  const _LicenceCard({required this.profile});
  final DriverProfile profile;

  @override
  State<_LicenceCard> createState() => _LicenceCardState();
}

class _LicenceCardState extends State<_LicenceCard>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  bool _showingFront = true;

  bool get _hasFront =>
      widget.profile.licencePhotoFront.isNotEmpty &&
      File(widget.profile.licencePhotoFront).existsSync();
  bool get _hasBack =>
      widget.profile.licencePhotoBack.isNotEmpty &&
      File(widget.profile.licencePhotoBack).existsSync();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );
    _animation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _flip() {
    if (!_hasFront || !_hasBack) return;
    if (_showingFront) {
      _controller.forward();
    } else {
      _controller.reverse();
    }
    setState(() => _showingFront = !_showingFront);
  }

  @override
  Widget build(BuildContext context) {
    final p = widget.profile;
    final driverName = p.name;

    // Expiry colour: only highlight if within ~120 days (4 months)
    Color? expiryColor;
    String expiryText = '';
    if (p.licenceExpiry.isNotEmpty) {
      final days = daysUntil(p.licenceExpiry);
      final dateFormatted = formatDateUK(p.licenceExpiry);
      final relative = formatDateRelative(p.licenceExpiry);
      expiryText = '$dateFormatted ($relative)';
      if (days < 0) {
        expiryColor = AppColors.danger;
      } else if (days <= 120) {
        expiryColor = AppColors.warning;
      }
    }

    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Header
            Row(
              children: [
                const Icon(Icons.credit_card_rounded,
                    size: 20, color: AppColors.primary),
                const SizedBox(width: 8),
                Text('Driving Licence', style: AppTextStyles.subheading),
              ],
            ),
            const SizedBox(height: 12),

            // Flippable photo with driver name overlay
            if (_hasFront || _hasBack)
              GestureDetector(
                onTap: _flip,
                child: AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    final angle = _animation.value * math.pi;
                    final showBack = angle > math.pi / 2;
                    return Transform(
                      alignment: Alignment.center,
                      transform: Matrix4.identity()
                        ..setEntry(3, 2, 0.001)
                        ..rotateY(angle),
                      child: showBack
                          ? Transform(
                              alignment: Alignment.center,
                              transform: Matrix4.identity()..rotateY(math.pi),
                              child: _buildPhotoSide(
                                _hasBack
                                    ? widget.profile.licencePhotoBack
                                    : widget.profile.licencePhotoFront,
                                'Back',
                                driverName,
                              ),
                            )
                          : _buildPhotoSide(
                              _hasFront
                                  ? widget.profile.licencePhotoFront
                                  : widget.profile.licencePhotoBack,
                              'Front',
                              driverName,
                            ),
                    );
                  },
                ),
              ),
            if (!_hasFront && !_hasBack && driverName.isNotEmpty)
              _driverNameBar(driverName),
            if (_hasFront && _hasBack) ...[
              const SizedBox(height: 6),
              Center(
                child: Text(
                  'Tap to flip',
                  style: AppTextStyles.caption.copyWith(fontSize: 11),
                ),
              ),
            ],
            const SizedBox(height: 12),

            // Text details
            if (p.licenceNumber.isNotEmpty)
              _detailRow('Licence No.', p.licenceNumber),
            if (p.licenceCategories.isNotEmpty)
              _detailRow('Categories', p.licenceCategories),
            if (expiryText.isNotEmpty)
              _detailRow('Expiry', expiryText, valueColor: expiryColor),
          ],
        ),
      ),
    );
  }

  Widget _driverNameBar(String name) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.textPrimary,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        children: [
          Text('Driver',
              style: TextStyle(
                color: Colors.white.withValues(alpha: 0.6),
                fontSize: 13,
                fontWeight: FontWeight.w500,
              )),
          const SizedBox(width: 16),
          Expanded(
            child: Text(name,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                )),
          ),
        ],
      ),
    );
  }

  Widget _buildPhotoSide(String path, String label, String driverName) {
    // UK driving licence is credit-card shaped: 85.6 x 54 mm ~ 1.585:1
    return AspectRatio(
      aspectRatio: 1.585,
      child: Container(
        width: double.infinity,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.file(
              File(DocumentService.resolvePathSync(path)),
              fit: BoxFit.cover,
            ),
            // Side label (Front / Back)
            Positioned(
              top: 8,
              right: 8,
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                decoration: BoxDecoration(
                  color: Colors.black54,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: Text(label,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 11,
                        fontWeight: FontWeight.w600)),
              ),
            ),
            // Driver name overlay
            if (driverName.isNotEmpty)
              Positioned(
                bottom: 0,
                left: 0,
                right: 0,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.bottomCenter,
                      end: Alignment.topCenter,
                      colors: [
                        Colors.black.withValues(alpha: 0.7),
                        Colors.transparent,
                      ],
                    ),
                  ),
                  child: Row(
                    children: [
                      Text('Driver',
                          style: TextStyle(
                            color: Colors.white.withValues(alpha: 0.7),
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          )),
                      const SizedBox(width: 16),
                      Expanded(
                        child: Text(driverName,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w700,
                            )),
                      ),
                    ],
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _detailRow(String label, String value, {Color? valueColor}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: AppTextStyles.caption),
          ),
          Expanded(
            child: Text(
              value,
              style: AppTextStyles.bodyBold.copyWith(
                color: valueColor,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// ---------------------------------------------------------------------------
// Generic helpers
// ---------------------------------------------------------------------------

class _SectionCard extends StatelessWidget {
  const _SectionCard({
    required this.title,
    required this.icon,
    required this.children,
  });

  final String title;
  final IconData icon;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, size: 20, color: AppColors.primary),
                const SizedBox(width: 8),
                Text(title, style: AppTextStyles.subheading),
              ],
            ),
            const SizedBox(height: 12),
            ...children,
          ],
        ),
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  const _InfoRow(this.label, this.value);
  final String label;
  final String value;

  @override
  Widget build(BuildContext context) {
    if (value.isEmpty) return const SizedBox.shrink();
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 100,
            child: Text(label, style: AppTextStyles.caption),
          ),
          Expanded(child: Text(value, style: AppTextStyles.bodyBold)),
        ],
      ),
    );
  }
}
