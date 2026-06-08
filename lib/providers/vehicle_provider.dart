import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/providers/database_provider.dart';
import 'package:my_vehicles/services/dvla_refresh_service.dart';
import 'package:my_vehicles/utils/id_generator.dart';

final selectedVehicleIdProvider = StateProvider<String?>((ref) => null);

final vehiclesProvider =
    AsyncNotifierProvider<VehiclesNotifier, List<Vehicle>>(
        VehiclesNotifier.new);

final selectedVehicleProvider = Provider<AsyncValue<Vehicle?>>((ref) {
  final selectedId = ref.watch(selectedVehicleIdProvider);
  final vehiclesAsync = ref.watch(vehiclesProvider);
  return vehiclesAsync.whenData((vehicles) {
    if (selectedId == null && vehicles.isNotEmpty) return vehicles.first;
    return vehicles.where((v) => v.id == selectedId).firstOrNull;
  });
});

class VehiclesNotifier extends AsyncNotifier<List<Vehicle>> {
  @override
  Future<List<Vehicle>> build() async {
    final db = ref.watch(databaseProvider);
    return db.getAllVehicles();
  }

  Future<String> addVehicle(Vehicle vehicle) async {
    final db = ref.read(databaseProvider);
    final id = vehicle.id.isEmpty ? generateId() : vehicle.id;
    final v = vehicle.copyWith(id: id);
    await db.upsertVehicle(v);
    ref.invalidateSelf();
    return id;
  }

  Future<void> updateVehicle(Vehicle vehicle) async {
    final db = ref.read(databaseProvider);
    await db.upsertVehicle(vehicle);
    ref.invalidateSelf();
  }

  Future<void> deleteVehicle(String id) async {
    final db = ref.read(databaseProvider);
    await db.deleteVehicle(id);
    ref.invalidateSelf();
  }

  /// Refreshes DVLA tax/MOT data for verified vehicles when due, then reloads
  /// so alerts reflect the latest status. Best-effort — never throws.
  Future<void> refreshFromDvlaIfDue() async {
    try {
      final db = ref.read(databaseProvider);
      final changed = await DvlaRefreshService.refreshIfDue(db);
      if (changed) ref.invalidateSelf();
    } catch (e) {
      // Background refresh is best-effort; ignore failures.
    }
  }
}
