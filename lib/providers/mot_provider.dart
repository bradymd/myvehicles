import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:my_vehicles/models/mot_record.dart';
import 'package:my_vehicles/providers/database_provider.dart';
import 'package:my_vehicles/utils/id_generator.dart';

final motRecordsProvider =
    AsyncNotifierProvider.family<MOTRecordsNotifier, List<MOTRecord>, String>(
  MOTRecordsNotifier.new,
);

class MOTRecordsNotifier
    extends FamilyAsyncNotifier<List<MOTRecord>, String> {
  @override
  Future<List<MOTRecord>> build(String arg) async {
    final db = ref.watch(databaseProvider);
    return db.getMOTRecords(arg);
  }

  Future<void> addRecord(MOTRecord record) async {
    final db = ref.read(databaseProvider);
    final id = record.id.isEmpty ? generateId() : record.id;
    await db.upsertMOTRecord(record.copyWith(id: id));
    ref.invalidateSelf();
  }

  Future<void> updateRecord(MOTRecord record) async {
    final db = ref.read(databaseProvider);
    await db.upsertMOTRecord(record);
    ref.invalidateSelf();
  }

  Future<void> deleteRecord(String id) async {
    final db = ref.read(databaseProvider);
    await db.deleteMOTRecord(id);
    ref.invalidateSelf();
  }
}
