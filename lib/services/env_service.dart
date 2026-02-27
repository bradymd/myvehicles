import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// Simple .env loader that reads key=value pairs.
/// Tries Flutter asset first, then file system fallback for development.
class EnvService {
  static final Map<String, String> _env = {};

  static Map<String, String> get env => _env;

  static Future<void> init() async {
    // Try loading from Flutter assets first
    try {
      final content = await rootBundle.loadString('.env');
      _parse(content);
      return;
    } catch (_) {
      // Not in assets — try file system
    }

    // Fallback: read from project root (works for local dev on desktop)
    try {
      final file = File('.env');
      if (file.existsSync()) {
        _parse(file.readAsStringSync());
      }
    } catch (e) {
      debugPrint('No .env found: $e');
    }
  }

  static void _parse(String content) {
    for (final line in content.split('\n')) {
      final trimmed = line.trim();
      if (trimmed.isEmpty || trimmed.startsWith('#')) continue;
      final idx = trimmed.indexOf('=');
      if (idx < 0) continue;
      final key = trimmed.substring(0, idx).trim();
      final value = trimmed.substring(idx + 1).trim();
      _env[key] = value;
    }
  }
}
