import 'dart:io';

import 'package:my_vehicles/database/database.dart';

class IntegrityIssue {
  final String recordType;
  final String recordLabel;
  final String field;
  final String problem;
  final String path;

  const IntegrityIssue({
    required this.recordType,
    required this.recordLabel,
    required this.field,
    required this.problem,
    required this.path,
  });
}

class IntegrityResult {
  final int totalChecked;
  final List<IntegrityIssue> issues;

  const IntegrityResult({required this.totalChecked, required this.issues});

  bool get hasIssues => issues.isNotEmpty;
}

class IntegrityService {
  static Future<IntegrityResult> runCheck(AppDatabase db) async {
    final issues = <IntegrityIssue>[];
    var totalChecked = 0;

    // Check vehicle photos
    final vehicles = await db.getAllVehicles();
    for (final v in vehicles) {
      if (v.photoPath.isNotEmpty) {
        totalChecked++;
        final issue = _checkFile(
          recordType: 'Vehicle',
          recordLabel: v.registration.isNotEmpty
              ? v.registration
              : '${v.make} ${v.model}'.trim(),
          field: 'Photo',
          path: v.photoPath,
        );
        if (issue != null) issues.add(issue);
      }
    }

    // Check driver profile photos
    final profile = await db.getProfile();
    if (profile != null) {
      final label = profile.name.isNotEmpty ? profile.name : 'Driver Profile';

      if (profile.photoPath.isNotEmpty) {
        totalChecked++;
        final issue = _checkFile(
          recordType: 'Driver Profile',
          recordLabel: label,
          field: 'Photo',
          path: profile.photoPath,
        );
        if (issue != null) issues.add(issue);
      }

      if (profile.licencePhotoFront.isNotEmpty) {
        totalChecked++;
        final issue = _checkFile(
          recordType: 'Driver Profile',
          recordLabel: label,
          field: 'Licence Front',
          path: profile.licencePhotoFront,
        );
        if (issue != null) issues.add(issue);
      }

      if (profile.licencePhotoBack.isNotEmpty) {
        totalChecked++;
        final issue = _checkFile(
          recordType: 'Driver Profile',
          recordLabel: label,
          field: 'Licence Back',
          path: profile.licencePhotoBack,
        );
        if (issue != null) issues.add(issue);
      }
    }

    // Check document refs
    final docs = await db.getDocuments();
    for (final d in docs) {
      if (d.localPath.isNotEmpty) {
        totalChecked++;
        final issue = _checkFile(
          recordType: 'Document',
          recordLabel:
              d.filename.isNotEmpty ? d.filename : d.localPath.split('/').last,
          field: 'File',
          path: d.localPath,
        );
        if (issue != null) issues.add(issue);
      }
    }

    return IntegrityResult(totalChecked: totalChecked, issues: issues);
  }

  static IntegrityIssue? _checkFile({
    required String recordType,
    required String recordLabel,
    required String field,
    required String path,
  }) {
    final file = File(path);
    if (!file.existsSync()) {
      return IntegrityIssue(
        recordType: recordType,
        recordLabel: recordLabel,
        field: field,
        problem: 'File missing',
        path: path,
      );
    }
    if (file.lengthSync() == 0) {
      return IntegrityIssue(
        recordType: recordType,
        recordLabel: recordLabel,
        field: field,
        problem: 'File empty',
        path: path,
      );
    }
    return null;
  }
}
