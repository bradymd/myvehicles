import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/models/service_entry.dart';
import 'package:my_vehicles/providers/database_provider.dart';
import 'package:my_vehicles/utils/id_generator.dart';

final serviceEntriesProvider = AsyncNotifierProvider.family<
    ServiceEntriesNotifier, List<ServiceEntry>, String>(
  ServiceEntriesNotifier.new,
);

class ServiceEntriesNotifier
    extends FamilyAsyncNotifier<List<ServiceEntry>, String> {
  @override
  Future<List<ServiceEntry>> build(String arg) async {
    final db = ref.watch(databaseProvider);
    return db.getServiceEntries(arg);
  }

  Future<void> addEntry(ServiceEntry entry) async {
    final db = ref.read(databaseProvider);
    final id = entry.id.isEmpty ? generateId() : entry.id;
    await db.upsertServiceEntry(entry.copyWith(id: id));
    ref.invalidateSelf();
  }

  Future<void> updateEntry(ServiceEntry entry) async {
    final db = ref.read(databaseProvider);
    await db.upsertServiceEntry(entry);
    ref.invalidateSelf();
  }

  Future<void> deleteEntry(String id) async {
    final db = ref.read(databaseProvider);
    await db.deleteServiceEntry(id);
    ref.invalidateSelf();
  }
}
