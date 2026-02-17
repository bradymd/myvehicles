import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/models/driver_profile.dart';
import 'package:my_vehicles/providers/database_provider.dart';
import 'package:my_vehicles/utils/id_generator.dart';

// --- Multi-profile list provider ---

final profilesProvider =
    AsyncNotifierProvider<ProfilesNotifier, List<DriverProfile>>(
        ProfilesNotifier.new);

class ProfilesNotifier extends AsyncNotifier<List<DriverProfile>> {
  @override
  Future<List<DriverProfile>> build() async {
    final db = ref.watch(databaseProvider);
    return db.getAllProfiles();
  }

  Future<void> saveProfile(DriverProfile profile) async {
    final db = ref.read(databaseProvider);
    final id = profile.id.isEmpty ? generateId() : profile.id;
    await db.upsertProfile(profile.copyWith(id: id));
    ref.invalidateSelf();
  }

  Future<void> deleteProfile(String id) async {
    final db = ref.read(databaseProvider);
    await db.deleteProfile(id);
    ref.invalidateSelf();
  }
}

// --- Single-profile provider (derived) for emergency screens ---

final profileProvider = Provider<AsyncValue<DriverProfile?>>((ref) {
  final profiles = ref.watch(profilesProvider);
  return profiles.whenData((list) => list.isEmpty ? null : list.first);
});
