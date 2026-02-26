import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:open_file/open_file.dart';
import 'package:path/path.dart' as p;
import 'package:path_provider/path_provider.dart';
import 'package:my_vehicles/services/file_attributes_service.dart';

class DocumentService {
  static const _docsFolder = 'my_vehicles_docs';
  static const _photosFolder = 'vehicle_photos';

  static String? _cachedAppDir;

  /// Warm the cached app directory path. Call once at startup before
  /// any UI renders so that [resolvePathSync] / [fileExistsSync] work
  /// immediately.
  static Future<void> init() async {
    final dir = await getApplicationDocumentsDirectory();
    _cachedAppDir = dir.path;
  }

  static Future<String> get _appDir async {
    if (_cachedAppDir != null) return _cachedAppDir!;
    final dir = await getApplicationDocumentsDirectory();
    _cachedAppDir = dir.path;
    return dir.path;
  }

  static Future<String> get _docsDir async {
    final appDir = await _appDir;
    final docsPath = p.join(appDir, _docsFolder);
    await Directory(docsPath).create(recursive: true);

    // Mark directory for iOS backup to ensure it persists through app updates
    await FileAttributesService.markDirectoryForBackup(docsPath);

    return docsPath;
  }

  /// Saves a file and returns a **relative** path (e.g. `my_vehicles_docs/file.pdf`).
  static Future<String> saveFile(String sourcePath, String filename) async {
    final dir = await _docsDir;
    final ext = p.extension(sourcePath);
    final safeName = filename.isNotEmpty
        ? filename
        : 'doc_${DateTime.now().millisecondsSinceEpoch}$ext';
    final destPath = p.join(dir, safeName);

    final sourceFile = File(sourcePath);
    if (!await sourceFile.exists()) {
      debugPrint('DocumentService: source file not found: $sourcePath');
    } else {
      await sourceFile.copy(destPath);
    }

    // Return relative path for storage
    return p.join(_docsFolder, safeName);
  }

  /// Synchronously resolves a stored path to an absolute path.
  /// Uses the cached app dir (always warm by the time UI renders).
  /// Falls back to the path as-is if the cache isn't ready.
  static String resolvePathSync(String localPath) {
    if (localPath.isEmpty) return localPath;
    if (p.isAbsolute(localPath)) return localPath; // Legacy support
    if (_cachedAppDir != null) return p.join(_cachedAppDir!, localPath);
    return localPath;
  }

  /// Checks whether the file exists on disk.
  static bool fileExistsSync(String localPath) {
    if (localPath.isEmpty) return false;
    return File(resolvePathSync(localPath)).existsSync();
  }

  static Future<bool> deleteFile(String localPath) async {
    final absolutePath = resolvePathSync(localPath);
    final file = File(absolutePath);
    if (await file.exists()) {
      await file.delete();
      return true;
    }
    return false;
  }

  static Future<void> openFile(String localPath) async {
    final absolutePath = resolvePathSync(localPath);
    await OpenFile.open(absolutePath);
  }

  static String getFileType(String path) {
    final ext = p.extension(path).toLowerCase();
    return switch (ext) {
      '.pdf' => 'PDF',
      '.jpg' || '.jpeg' => 'Image',
      '.png' => 'Image',
      '.doc' || '.docx' => 'Document',
      '.xls' || '.xlsx' => 'Spreadsheet',
      _ => 'File',
    };
  }
}
