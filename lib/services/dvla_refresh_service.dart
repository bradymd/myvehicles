import 'package:flutter/foundation.dart';
import 'package:my_vehicles/database/database.dart';
import 'package:my_vehicles/services/dvla_service.dart';

/// Periodically refreshes DVLA-sourced tax/MOT status for verified vehicles
/// so the home-screen alerts reflect reality without the user having to tap
/// "Check with DVLA" on each vehicle.
///
/// Best-effort and self-throttling: it runs at most once per [_interval],
/// tracked by a single timestamp in app settings, and any per-vehicle
/// failure is logged and skipped.
class DvlaRefreshService {
  static const _lastRefreshKey = 'dvla_last_refresh';
  static const _interval = Duration(days: 14);

  /// Returns true if the last sweep was longer ago than [_interval].
  static Future<bool> isDue(AppDatabase db) async {
    final last = await db.getSetting(_lastRefreshKey);
    if (last == null) return true;
    final ts = DateTime.tryParse(last);
    if (ts == null) return true;
    return DateTime.now().difference(ts) >= _interval;
  }

  /// Re-fetches DVLA status for every verified vehicle when due. Only the
  /// volatile fields (tax/MOT status and due dates) are updated — user-edited
  /// details like make and colour are left untouched.
  ///
  /// Returns true if any vehicle's stored data actually changed.
  static Future<bool> refreshIfDue(AppDatabase db) async {
    if (!DvlaService.isAvailable) return false;
    if (!await isDue(db)) return false;

    final vehicles = await db.getAllVehicles();
    final verified = vehicles
        .where((v) => v.dvlaVerified && v.registration.isNotEmpty)
        .toList();

    var changed = false;
    var anySuccess = false;
    for (final v in verified) {
      try {
        final data = await DvlaService.lookupRegistration(v.registration);
        if (data == null) continue;
        anySuccess = true;
        final updated = v.copyWith(
          taxDueDate: (data['taxDueDate'] as String?) ?? v.taxDueDate,
          taxStatus: (data['taxStatus'] as String?) ?? v.taxStatus,
          motDueDate: (data['motExpiryDate'] as String?) ?? v.motDueDate,
          motStatus: (data['motStatus'] as String?) ?? v.motStatus,
        );
        if (updated != v) {
          await db.upsertVehicle(updated);
          changed = true;
        }
      } catch (e) {
        debugPrint('DVLA refresh failed for ${v.registration}: $e');
      }
    }

    // Only record the sweep when we actually reached DVLA (or there was
    // nothing to refresh). If every lookup failed — e.g. the device was
    // offline — leave the timestamp untouched so the next launch retries
    // rather than going quiet for the whole interval.
    if (anySuccess || verified.isEmpty) {
      await db.setSetting(_lastRefreshKey, DateTime.now().toIso8601String());
    }
    return changed;
  }
}
