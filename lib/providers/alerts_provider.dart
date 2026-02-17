import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/providers/profile_provider.dart';
import 'package:my_vehicles/providers/vehicle_provider.dart';
import 'package:my_vehicles/utils/date_helpers.dart';

class DateAlert {
  final String vehicleId;
  final String vehicleReg;
  final String label;
  final String date;
  final int daysRemaining;
  final AlertLevel level;

  const DateAlert({
    required this.vehicleId,
    required this.vehicleReg,
    required this.label,
    required this.date,
    required this.daysRemaining,
    required this.level,
  });
}

enum AlertLevel { expired, urgent, warning, ok }

final alertsProvider = Provider<AsyncValue<List<DateAlert>>>((ref) {
  final vehiclesAsync = ref.watch(vehiclesProvider);
  final profileAsync = ref.watch(profileProvider);

  return vehiclesAsync.whenData((vehicles) {
    final alerts = <DateAlert>[];

    for (final v in vehicles) {
      _addAlert(alerts, v, 'MOT', v.motDueDate);
      _addAlert(alerts, v, 'Insurance', v.insuranceRenewalDate);
      _addAlert(alerts, v, 'Tax', v.taxDueDate);
    }

    // Licence expiry from profile
    final profile = profileAsync.valueOrNull;
    if (profile != null && profile.licenceExpiry.isNotEmpty) {
      final days = daysUntil(profile.licenceExpiry);
      final level = _levelFromDays(days);
      alerts.add(DateAlert(
        vehicleId: '',
        vehicleReg: 'Driver',
        label: 'Licence',
        date: profile.licenceExpiry,
        daysRemaining: days,
        level: level,
      ));
    }

    alerts.sort((a, b) => a.daysRemaining.compareTo(b.daysRemaining));
    return alerts;
  });
});

void _addAlert(
    List<DateAlert> alerts, Vehicle v, String label, String dateStr) {
  if (dateStr.isEmpty) return;
  final days = daysUntil(dateStr);
  final level = _levelFromDays(days);
  alerts.add(DateAlert(
    vehicleId: v.id,
    vehicleReg: v.registration.isNotEmpty ? v.registration : v.make,
    label: label,
    date: dateStr,
    daysRemaining: days,
    level: level,
  ));
}

AlertLevel _levelFromDays(int days) {
  if (days < 0) return AlertLevel.expired;
  if (days <= 7) return AlertLevel.urgent;
  if (days <= 30) return AlertLevel.warning;
  return AlertLevel.ok;
}
