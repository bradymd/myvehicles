import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Service to set iOS-specific file attributes.
/// On iOS, this ensures directories are included in backups and persist through app updates.
class FileAttributesService {
  static const _channel = MethodChannel('com.myvehicles/file_attributes');

  /// Sets the backup attribute for a file or directory on iOS.
  /// [shouldBackup] = true means the file WILL be backed up and should persist through updates.
  /// On non-iOS platforms, this is a no-op.
  static Future<void> setBackupAttribute(String path, {required bool shouldBackup}) async {
    if (!Platform.isIOS) {
      return; // Only relevant on iOS
    }

    try {
      await _channel.invokeMethod('setBackupAttribute', {
        'path': path,
        'shouldBackup': shouldBackup,
      });
      debugPrint('FileAttributes: Set backup=$shouldBackup for $path');
    } catch (e) {
      debugPrint('FileAttributes: Failed to set backup attribute: $e');
      // Don't throw - file operations should continue even if attribute setting fails
    }
  }

  /// Ensures a directory is marked for backup on iOS (so it persists through updates).
  static Future<void> markDirectoryForBackup(String dirPath) async {
    await setBackupAttribute(dirPath, shouldBackup: true);
  }
}
