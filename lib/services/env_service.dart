import 'dart:io';

import 'package:flutter/foundation.dart';

/// Provides environment config from compile-time --dart-define values,
/// with .env file fallback for local desktop development.
///
/// Build with: flutter build appbundle --dart-define=DVLA_API_KEY=xxx
/// Or for Codemagic: add --dart-define=DVLA_API_KEY=xxx to build arguments
class EnvService {
  static const _compileDvlaKey =
      String.fromEnvironment('DVLA_API_KEY', defaultValue: '');

  static final Map<String, String> _env = {};

  static Map<String, String> get env => _env;

  static Future<void> init() async {
    // Compile-time keys take priority (works on all platforms)
    if (_compileDvlaKey.isNotEmpty) {
      _env['DVLA_API_KEY'] = _compileDvlaKey;
      return;
    }

    // Fallback: read .env from project root (local desktop dev only)
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
