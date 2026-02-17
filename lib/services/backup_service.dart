import 'dart:io';
import 'package:archive/archive.dart';
import 'package:intl/intl.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';

class AutoBackupInfo {
  final DateTime timestamp;
  final int sizeBytes;

  const AutoBackupInfo({required this.timestamp, required this.sizeBytes});
}

class BackupService {
  static const _dbFilename = 'my_vehicles.sqlite';
  static const _docsFolder = 'my_vehicles_docs';
  static const _autoBackupFilename = 'my_vehicles_autobackup.zip';

  /// Creates a backup ZIP and returns the temp file path.
  static Future<String> createBackup() async {
    final appDir = await getApplicationDocumentsDirectory();
    final archive = await _buildArchive(appDir.path);

    final zipData = ZipEncoder().encode(archive);

    final timestamp = DateFormat('yyyy-MM-dd-HH-mm-ss').format(DateTime.now());
    final tempDir = await getTemporaryDirectory();
    final zipPath =
        p.join(tempDir.path, 'backup-myvehicles-$timestamp.zip');
    await File(zipPath).writeAsBytes(zipData);
    return zipPath;
  }

  /// Creates/overwrites the rolling auto-backup. Silently skips if no DB.
  static Future<void> createAutoBackup() async {
    final appDir = await getApplicationDocumentsDirectory();
    final dbFile = File(p.join(appDir.path, _dbFilename));

    // Nothing to back up on first launch
    if (!await dbFile.exists()) return;

    final archive = await _buildArchive(appDir.path);
    final zipData = ZipEncoder().encode(archive);

    final zipPath = p.join(appDir.path, _autoBackupFilename);
    await File(zipPath).writeAsBytes(zipData);
  }

  /// Returns info about the auto-backup, or null if none exists.
  static Future<AutoBackupInfo?> getAutoBackupInfo() async {
    final appDir = await getApplicationDocumentsDirectory();
    final file = File(p.join(appDir.path, _autoBackupFilename));

    if (!await file.exists()) return null;

    final stat = await file.stat();
    return AutoBackupInfo(timestamp: stat.modified, sizeBytes: stat.size);
  }

  /// Returns the auto-backup file path, or null.
  static Future<String?> getAutoBackupPath() async {
    final appDir = await getApplicationDocumentsDirectory();
    final file = File(p.join(appDir.path, _autoBackupFilename));
    if (await file.exists()) return file.path;
    return null;
  }

  /// Restores data from a backup ZIP. Returns true on success.
  static Future<bool> restoreFromBackup(String zipPath) async {
    final zipFile = File(zipPath);
    if (!await zipFile.exists()) return false;

    final bytes = await zipFile.readAsBytes();
    final archive = ZipDecoder().decodeBytes(bytes);

    // Basic validation — must contain the database file
    final hasDb = archive.any((f) => f.name == _dbFilename);
    if (!hasDb) return false;

    final appDir = await getApplicationDocumentsDirectory();

    // Remove existing docs folder before extracting
    final docsDir = Directory(p.join(appDir.path, _docsFolder));
    if (await docsDir.exists()) {
      await docsDir.delete(recursive: true);
    }

    // Extract all files
    for (final entry in archive) {
      final outPath = p.join(appDir.path, entry.name);
      if (entry.isFile) {
        final outFile = File(outPath);
        await outFile.parent.create(recursive: true);
        await outFile.writeAsBytes(entry.content as List<int>);
      } else {
        await Directory(outPath).create(recursive: true);
      }
    }

    return true;
  }

  // --- Private helpers ---

  static Future<Archive> _buildArchive(String appDirPath) async {
    final archive = Archive();

    // Add database file
    final dbFile = File(p.join(appDirPath, _dbFilename));
    if (await dbFile.exists()) {
      final bytes = await dbFile.readAsBytes();
      archive.addFile(ArchiveFile(_dbFilename, bytes.length, bytes));
    }

    // Add documents folder tree
    final docsDir = Directory(p.join(appDirPath, _docsFolder));
    if (await docsDir.exists()) {
      await for (final entity in docsDir.list(recursive: true)) {
        if (entity is File) {
          final relativePath = p.join(
            _docsFolder,
            p.relative(entity.path, from: docsDir.path),
          );
          final bytes = await entity.readAsBytes();
          archive.addFile(ArchiveFile(relativePath, bytes.length, bytes));
        }
      }
    }

    return archive;
  }
}
