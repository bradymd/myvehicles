import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/app.dart';
import 'package:my_vehicles/services/backup_service.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // Fire-and-forget auto-backup before the DB is opened (file is consistent)
  BackupService.createAutoBackup().catchError((_) {});

  runApp(
    const ProviderScope(
      child: MyVehiclesApp(),
    ),
  );
}
