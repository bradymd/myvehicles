import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/app.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/services/backup_service.dart';
import 'package:my_vehicles/services/document_service.dart';
import 'package:my_vehicles/services/env_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Cache app directory path before UI renders for synchronous path resolution
  await DocumentService.init();

  // Load environment config (API keys etc.) — silent if .env missing
  await EnvService.init();

  runApp(
    const ProviderScope(
      child: _AppLifecycleWrapper(child: MyVehiclesApp()),
    ),
  );
}

/// Watches app lifecycle: triggers auto-backup on close/background (no more
/// than once every 4 hours) and a DVLA tax/MOT refresh on launch and resume
/// (self-throttled to once a fortnight).
class _AppLifecycleWrapper extends ConsumerStatefulWidget {
  const _AppLifecycleWrapper({required this.child});
  final Widget child;

  @override
  ConsumerState<_AppLifecycleWrapper> createState() =>
      _AppLifecycleWrapperState();
}

class _AppLifecycleWrapperState extends ConsumerState<_AppLifecycleWrapper>
    with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    // Refresh DVLA data shortly after launch (off the first frame).
    WidgetsBinding.instance.addPostFrameCallback((_) => _refreshDvla());
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  void _refreshDvla() {
    ref.read(vehiclesProvider.notifier).refreshFromDvlaIfDue();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.paused ||
        state == AppLifecycleState.detached) {
      _backupIfDue();
    } else if (state == AppLifecycleState.resumed) {
      _refreshDvla();
    }
  }

  Future<void> _backupIfDue() async {
    try {
      final info = await BackupService.getAutoBackupInfo();
      if (info != null) {
        final hoursSince =
            DateTime.now().difference(info.timestamp).inHours;
        if (hoursSince < 4) return; // too recent, skip
      }
      await BackupService.createAutoBackup();
    } catch (_) {
      // Backup is best-effort — never crash the app
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}
