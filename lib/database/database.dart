import 'package:drift/drift.dart';
import 'package:my_vehicles/models/vehicle.dart' as models;
import 'package:my_vehicles/models/service_entry.dart' as models;
import 'package:my_vehicles/models/mot_record.dart' as models;
import 'package:my_vehicles/models/document_ref.dart' as models;
import 'package:my_vehicles/models/driver_profile.dart' as models;
import 'package:my_vehicles/database/connection.dart';

part 'database.g.dart';

// --- Tables ---

@DataClassName('VehicleRow')
class Vehicles extends Table {
  TextColumn get id => text()();
  TextColumn get registration => text().withDefault(const Constant(''))();
  TextColumn get make => text().withDefault(const Constant(''))();
  TextColumn get model => text().withDefault(const Constant(''))();
  TextColumn get year => text().withDefault(const Constant(''))();
  TextColumn get colour => text().withDefault(const Constant(''))();
  TextColumn get fuelType => text().withDefault(const Constant('petrol'))();
  TextColumn get transmission => text().withDefault(const Constant(''))();
  TextColumn get vin => text().withDefault(const Constant(''))();
  TextColumn get variant => text().withDefault(const Constant(''))();
  TextColumn get bodyType => text().withDefault(const Constant(''))();
  TextColumn get engineCC => text().withDefault(const Constant(''))();
  TextColumn get engineNumber => text().withDefault(const Constant(''))();
  TextColumn get keyNumber => text().withDefault(const Constant(''))();
  TextColumn get chassisNumber => text().withDefault(const Constant(''))();
  TextColumn get radioCode => text().withDefault(const Constant(''))();
  TextColumn get description => text().withDefault(const Constant(''))();
  TextColumn get purchaseDate => text().withDefault(const Constant(''))();
  RealColumn get purchasePrice => real().withDefault(const Constant(0))();
  TextColumn get purchasedFrom => text().withDefault(const Constant(''))();
  TextColumn get ownership => text().withDefault(const Constant(''))();
  TextColumn get financeCompany => text().withDefault(const Constant(''))();
  TextColumn get agreementNumber => text().withDefault(const Constant(''))();
  RealColumn get deposit => real().withDefault(const Constant(0))();
  RealColumn get monthlyPayment => real().withDefault(const Constant(0))();
  TextColumn get financeStartDate => text().withDefault(const Constant(''))();
  TextColumn get financeEndDate => text().withDefault(const Constant(''))();
  RealColumn get balloonPayment => real().withDefault(const Constant(0))();
  IntColumn get annualMileageAllowance => integer().withDefault(const Constant(0))();
  IntColumn get numberOfPayments => integer().withDefault(const Constant(0))();
  TextColumn get lessor => text().withDefault(const Constant(''))();
  TextColumn get agreementHolder => text().withDefault(const Constant(''))();
  TextColumn get ownershipNotes => text().withDefault(const Constant(''))();
  TextColumn get insurer => text().withDefault(const Constant(''))();
  TextColumn get insurancePolicyNumber =>
      text().withDefault(const Constant(''))();
  TextColumn get insuranceRenewalDate =>
      text().withDefault(const Constant(''))();
  TextColumn get insuranceType => text().withDefault(const Constant(''))();
  TextColumn get insuredDrivers => text().withDefault(const Constant(''))();
  RealColumn get insuranceAnnualCost =>
      real().withDefault(const Constant(0))();
  TextColumn get breakdownProvider =>
      text().withDefault(const Constant(''))();
  TextColumn get breakdownMembershipNumber =>
      text().withDefault(const Constant(''))();
  TextColumn get breakdownContact => text().withDefault(const Constant(''))();
  TextColumn get breakdownNotes => text().withDefault(const Constant(''))();
  TextColumn get recoveryProvider => text().withDefault(const Constant(''))();
  TextColumn get recoveryArrangedVia => text().withDefault(const Constant(''))();
  TextColumn get recoveryReference => text().withDefault(const Constant(''))();
  TextColumn get recoveryContact => text().withDefault(const Constant(''))();
  TextColumn get recoveryNotes => text().withDefault(const Constant(''))();
  TextColumn get motDueDate => text().withDefault(const Constant(''))();
  TextColumn get taxDueDate => text().withDefault(const Constant(''))();
  IntColumn get currentMileage => integer().withDefault(const Constant(0))();
  TextColumn get notes => text().withDefault(const Constant(''))();
  BoolColumn get dvlaVerified => boolean().withDefault(const Constant(false))();
  TextColumn get taxStatus => text().withDefault(const Constant(''))();
  TextColumn get motStatus => text().withDefault(const Constant(''))();
  TextColumn get photoPath => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('ServiceEntryRow')
class ServiceEntries extends Table {
  TextColumn get id => text()();
  TextColumn get vehicleId => text().references(Vehicles, #id)();
  TextColumn get date => text().withDefault(const Constant(''))();
  TextColumn get type => text().withDefault(const Constant('service'))();
  TextColumn get description => text().withDefault(const Constant(''))();
  RealColumn get cost => real().withDefault(const Constant(0))();
  TextColumn get garage => text().withDefault(const Constant(''))();
  IntColumn get mileage => integer().withDefault(const Constant(0))();
  TextColumn get nextServiceDate => text().withDefault(const Constant(''))();
  IntColumn get nextServiceMileage =>
      integer().withDefault(const Constant(0))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('MOTRecordRow')
class MOTRecords extends Table {
  TextColumn get id => text()();
  TextColumn get vehicleId => text().references(Vehicles, #id)();
  TextColumn get testDate => text().withDefault(const Constant(''))();
  TextColumn get expiryDate => text().withDefault(const Constant(''))();
  TextColumn get testCentre => text().withDefault(const Constant(''))();
  IntColumn get mileage => integer().withDefault(const Constant(0))();
  TextColumn get result => text().withDefault(const Constant('pass'))();
  TextColumn get advisories => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DocumentRefRow')
class DocumentRefs extends Table {
  TextColumn get id => text()();
  TextColumn get parentType =>
      text().withDefault(const Constant('vehicle'))();
  TextColumn get parentId => text().withDefault(const Constant(''))();
  TextColumn get filename => text().withDefault(const Constant(''))();
  TextColumn get localPath => text().withDefault(const Constant(''))();
  TextColumn get fileType => text().withDefault(const Constant(''))();
  TextColumn get addedDate => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('DriverProfileRow')
class DriverProfiles extends Table {
  TextColumn get id => text()();
  TextColumn get name => text().withDefault(const Constant(''))();
  TextColumn get licenceNumber => text().withDefault(const Constant(''))();
  TextColumn get licenceExpiry => text().withDefault(const Constant(''))();
  TextColumn get licenceCategories =>
      text().withDefault(const Constant(''))();
  TextColumn get address => text().withDefault(const Constant(''))();
  TextColumn get emergencyContactName =>
      text().withDefault(const Constant(''))();
  TextColumn get emergencyContactPhone =>
      text().withDefault(const Constant(''))();
  TextColumn get bloodType => text().withDefault(const Constant(''))();
  TextColumn get photoPath => text().withDefault(const Constant(''))();
  TextColumn get licencePhotoFront => text().withDefault(const Constant(''))();
  TextColumn get licencePhotoBack => text().withDefault(const Constant(''))();
  TextColumn get notes => text().withDefault(const Constant(''))();

  @override
  Set<Column> get primaryKey => {id};
}

@DataClassName('AppSettingRow')
class AppSettings extends Table {
  TextColumn get key => text()();
  TextColumn get value => text()();

  @override
  Set<Column> get primaryKey => {key};
}

@DriftDatabase(tables: [
  Vehicles,
  ServiceEntries,
  MOTRecords,
  DocumentRefs,
  DriverProfiles,
  AppSettings,
])
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(openConnection());

  @override
  int get schemaVersion => 13;

  @override
  MigrationStrategy get migration => MigrationStrategy(
        onUpgrade: (migrator, from, to) async {
          if (from < 2) {
            await migrator.addColumn(vehicles, vehicles.photoPath);
          }
          if (from < 3) {
            await migrator.addColumn(vehicles, vehicles.transmission);
            await migrator.addColumn(vehicles, vehicles.vin);
          }
          if (from < 4) {
            await migrator.addColumn(vehicles, vehicles.variant);
            await migrator.addColumn(vehicles, vehicles.bodyType);
            await migrator.addColumn(vehicles, vehicles.engineCC);
            await migrator.addColumn(vehicles, vehicles.engineNumber);
            await migrator.addColumn(vehicles, vehicles.keyNumber);
            await migrator.addColumn(vehicles, vehicles.chassisNumber);
            await migrator.addColumn(vehicles, vehicles.radioCode);
            await migrator.addColumn(vehicles, vehicles.lessor);
          }
          if (from < 5) {
            await migrator.addColumn(vehicles, vehicles.description);
          }
          if (from < 6) {
            await migrator.addColumn(vehicles, vehicles.breakdownNotes);
          }
          if (from < 7) {
            await migrator.addColumn(vehicles, vehicles.recoveryProvider);
            await migrator.addColumn(vehicles, vehicles.recoveryArrangedVia);
            await migrator.addColumn(vehicles, vehicles.recoveryReference);
            await migrator.addColumn(vehicles, vehicles.recoveryNotes);
          }
          if (from < 8) {
            await migrator.addColumn(vehicles, vehicles.financeCompany);
            await migrator.addColumn(vehicles, vehicles.agreementNumber);
            await migrator.addColumn(vehicles, vehicles.deposit);
            await migrator.addColumn(vehicles, vehicles.balloonPayment);
            await migrator.addColumn(vehicles, vehicles.annualMileageAllowance);
            await migrator.addColumn(vehicles, vehicles.financeStartDate);
          }
          if (from < 9) {
            await migrator.addColumn(vehicles, vehicles.numberOfPayments);
            await migrator.addColumn(vehicles, vehicles.ownershipNotes);
          }
          if (from < 10) {
            await migrator.addColumn(vehicles, vehicles.agreementHolder);
          }
          if (from < 11) {
            await migrator.addColumn(driverProfiles, driverProfiles.licencePhotoFront);
            await migrator.addColumn(driverProfiles, driverProfiles.licencePhotoBack);
          }
          if (from < 12) {
            // Convert absolute document paths to relative (my_vehicles_docs/..., vehicle_photos/...)
            // This fixes iOS app container relocation issues during TestFlight updates
            await _convertPathsToRelative(
              'document_refs',
              'local_path',
              ['my_vehicles_docs'],
            );
            await _convertPathsToRelative(
              'vehicles',
              'photo_path',
              ['vehicle_photos'],
            );
            await _convertPathsToRelative(
              'driver_profiles',
              'photo_path',
              ['vehicle_photos'],
            );
            await _convertPathsToRelative(
              'driver_profiles',
              'licence_photo_front',
              ['my_vehicles_docs'],
            );
            await _convertPathsToRelative(
              'driver_profiles',
              'licence_photo_back',
              ['my_vehicles_docs'],
            );
          }
          if (from < 13) {
            await migrator.addColumn(vehicles, vehicles.dvlaVerified);
            await migrator.addColumn(vehicles, vehicles.taxStatus);
            await migrator.addColumn(vehicles, vehicles.motStatus);
          }
        },
      );

  /// Helper to convert absolute paths to relative paths during migration.
  Future<void> _convertPathsToRelative(
    String table,
    String column,
    List<String> knownFolders,
  ) async {
    final rows = await customSelect(
      "SELECT id, $column FROM $table WHERE $column != ''",
    ).get();

    for (final row in rows) {
      final id = row.read<String>('id');
      final oldPath = row.read<String>(column);

      // Already relative — skip
      if (!oldPath.contains('/')) continue;
      if (!oldPath.startsWith('/')) continue;

      // Find which known folder this path belongs to
      String? relativePath;
      for (final folder in knownFolders) {
        final idx = oldPath.indexOf('$folder/');
        if (idx >= 0) {
          // Extract everything from the folder name onwards
          relativePath = oldPath.substring(idx);
          break;
        }
      }

      // If we found a relative path and it's different from the old one, update it
      if (relativePath != null && relativePath != oldPath) {
        await customStatement(
          'UPDATE $table SET $column = ? WHERE id = ?',
          [relativePath, id],
        );
      }
    }
  }

  // --- Vehicle operations ---

  Future<List<models.Vehicle>> getAllVehicles() async {
    final rows = await select(vehicles).get();
    return rows.map(_vehicleFromRow).toList();
  }

  Future<models.Vehicle?> getVehicle(String id) async {
    final row = await (select(vehicles)..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    return _vehicleFromRow(row);
  }

  Future<void> upsertVehicle(models.Vehicle v) async {
    await into(vehicles).insertOnConflictUpdate(
      VehiclesCompanion.insert(
        id: v.id,
        registration: Value(v.registration),
        make: Value(v.make),
        model: Value(v.model),
        year: Value(v.year),
        colour: Value(v.colour),
        fuelType: Value(v.fuelType),
        transmission: Value(v.transmission),
        vin: Value(v.vin),
        variant: Value(v.variant),
        bodyType: Value(v.bodyType),
        engineCC: Value(v.engineCC),
        engineNumber: Value(v.engineNumber),
        keyNumber: Value(v.keyNumber),
        chassisNumber: Value(v.chassisNumber),
        radioCode: Value(v.radioCode),
        description: Value(v.description),
        purchaseDate: Value(v.purchaseDate),
        purchasePrice: Value(v.purchasePrice),
        purchasedFrom: Value(v.purchasedFrom),
        ownership: Value(v.ownership),
        financeCompany: Value(v.financeCompany),
        agreementNumber: Value(v.agreementNumber),
        deposit: Value(v.deposit),
        monthlyPayment: Value(v.monthlyPayment),
        financeStartDate: Value(v.financeStartDate),
        financeEndDate: Value(v.financeEndDate),
        balloonPayment: Value(v.balloonPayment),
        annualMileageAllowance: Value(v.annualMileageAllowance),
        numberOfPayments: Value(v.numberOfPayments),
        lessor: Value(v.lessor),
        agreementHolder: Value(v.agreementHolder),
        ownershipNotes: Value(v.ownershipNotes),
        insurer: Value(v.insurer),
        insurancePolicyNumber: Value(v.insurancePolicyNumber),
        insuranceRenewalDate: Value(v.insuranceRenewalDate),
        insuranceType: Value(v.insuranceType),
        insuredDrivers: Value(v.insuredDrivers),
        insuranceAnnualCost: Value(v.insuranceAnnualCost),
        breakdownProvider: Value(v.breakdownProvider),
        breakdownMembershipNumber: Value(v.breakdownMembershipNumber),
        breakdownContact: Value(v.breakdownContact),
        breakdownNotes: Value(v.breakdownNotes),
        recoveryProvider: Value(v.recoveryProvider),
        recoveryArrangedVia: Value(v.recoveryArrangedVia),
        recoveryReference: Value(v.recoveryReference),
        recoveryContact: Value(v.recoveryContact),
        recoveryNotes: Value(v.recoveryNotes),
        motDueDate: Value(v.motDueDate),
        taxDueDate: Value(v.taxDueDate),
        currentMileage: Value(v.currentMileage),
        notes: Value(v.notes),
        dvlaVerified: Value(v.dvlaVerified),
        taxStatus: Value(v.taxStatus),
        motStatus: Value(v.motStatus),
        photoPath: Value(v.photoPath),
      ),
    );
  }

  Future<void> deleteVehicle(String id) async {
    await (delete(serviceEntries)..where((t) => t.vehicleId.equals(id))).go();
    await (delete(mOTRecords)..where((t) => t.vehicleId.equals(id))).go();
    await (delete(documentRefs)..where((t) => t.parentId.equals(id))).go();
    await (delete(vehicles)..where((t) => t.id.equals(id))).go();
  }

  // --- Service entry operations ---

  Future<List<models.ServiceEntry>> getServiceEntries(
      String vehicleId) async {
    final rows = await (select(serviceEntries)
          ..where((t) => t.vehicleId.equals(vehicleId))
          ..orderBy([(t) => OrderingTerm.desc(t.date)]))
        .get();
    return rows.map(_serviceFromRow).toList();
  }

  Future<void> upsertServiceEntry(models.ServiceEntry s) async {
    await into(serviceEntries).insertOnConflictUpdate(
      ServiceEntriesCompanion.insert(
        id: s.id,
        vehicleId: s.vehicleId,
        date: Value(s.date),
        type: Value(s.type),
        description: Value(s.description),
        cost: Value(s.cost),
        garage: Value(s.garage),
        mileage: Value(s.mileage),
        nextServiceDate: Value(s.nextServiceDate),
        nextServiceMileage: Value(s.nextServiceMileage),
      ),
    );
  }

  Future<void> deleteServiceEntry(String id) async {
    await (delete(serviceEntries)..where((t) => t.id.equals(id))).go();
  }

  // --- MOT record operations ---

  Future<List<models.MOTRecord>> getMOTRecords(String vehicleId) async {
    final rows = await (select(mOTRecords)
          ..where((t) => t.vehicleId.equals(vehicleId))
          ..orderBy([(t) => OrderingTerm.desc(t.testDate)]))
        .get();
    return rows.map(_motFromRow).toList();
  }

  Future<void> upsertMOTRecord(models.MOTRecord m) async {
    await into(mOTRecords).insertOnConflictUpdate(
      MOTRecordsCompanion.insert(
        id: m.id,
        vehicleId: m.vehicleId,
        testDate: Value(m.testDate),
        expiryDate: Value(m.expiryDate),
        testCentre: Value(m.testCentre),
        mileage: Value(m.mileage),
        result: Value(m.result),
        advisories: Value(m.advisories),
      ),
    );
  }

  Future<void> deleteMOTRecord(String id) async {
    await (delete(mOTRecords)..where((t) => t.id.equals(id))).go();
  }

  // --- Document operations ---

  Future<List<models.DocumentRef>> getDocuments({
    String? parentType,
    String? parentId,
  }) async {
    var query = select(documentRefs);
    if (parentType != null) {
      query = query..where((t) => t.parentType.equals(parentType));
    }
    if (parentId != null) {
      query = query..where((t) => t.parentId.equals(parentId));
    }
    final rows = await query.get();
    return rows.map(_documentFromRow).toList();
  }

  Future<List<models.DocumentRef>> getDocumentsByParentIds(
      List<String> parentIds) async {
    final query = select(documentRefs)
      ..where((t) => t.parentId.isIn(parentIds));
    final rows = await query.get();
    return rows.map(_documentFromRow).toList();
  }

  Future<void> upsertDocument(models.DocumentRef d) async {
    await into(documentRefs).insertOnConflictUpdate(
      DocumentRefsCompanion.insert(
        id: d.id,
        parentType: Value(d.parentType),
        parentId: Value(d.parentId),
        filename: Value(d.filename),
        localPath: Value(d.localPath),
        fileType: Value(d.fileType),
        addedDate: Value(d.addedDate),
      ),
    );
  }

  Future<void> deleteDocument(String id) async {
    await (delete(documentRefs)..where((t) => t.id.equals(id))).go();
  }

  // --- Driver profile operations ---

  Future<models.DriverProfile?> getProfile() async {
    final rows = await select(driverProfiles).get();
    if (rows.isEmpty) return null;
    return _profileFromRow(rows.first);
  }

  Future<List<models.DriverProfile>> getAllProfiles() async {
    final rows = await (select(driverProfiles)
          ..orderBy([(t) => OrderingTerm.asc(t.name)]))
        .get();
    return rows.map(_profileFromRow).toList();
  }

  Future<models.DriverProfile?> getProfileById(String id) async {
    final row = await (select(driverProfiles)
          ..where((t) => t.id.equals(id)))
        .getSingleOrNull();
    if (row == null) return null;
    return _profileFromRow(row);
  }

  Future<void> deleteProfile(String id) async {
    await (delete(driverProfiles)..where((t) => t.id.equals(id))).go();
  }

  Future<void> upsertProfile(models.DriverProfile p) async {
    await into(driverProfiles).insertOnConflictUpdate(
      DriverProfilesCompanion.insert(
        id: p.id,
        name: Value(p.name),
        licenceNumber: Value(p.licenceNumber),
        licenceExpiry: Value(p.licenceExpiry),
        licenceCategories: Value(p.licenceCategories),
        address: Value(p.address),
        emergencyContactName: Value(p.emergencyContactName),
        emergencyContactPhone: Value(p.emergencyContactPhone),
        bloodType: Value(p.bloodType),
        photoPath: Value(p.photoPath),
        licencePhotoFront: Value(p.licencePhotoFront),
        licencePhotoBack: Value(p.licencePhotoBack),
        notes: Value(p.notes),
      ),
    );
  }

  // --- Settings ---

  Future<String?> getSetting(String key) async {
    final row = await (select(appSettings)
          ..where((t) => t.key.equals(key)))
        .getSingleOrNull();
    return row?.value;
  }

  Future<void> setSetting(String key, String value) async {
    await into(appSettings).insertOnConflictUpdate(
      AppSettingsCompanion.insert(key: key, value: value),
    );
  }

  // --- Row converters ---

  models.Vehicle _vehicleFromRow(VehicleRow r) => models.Vehicle(
        id: r.id,
        registration: r.registration,
        make: r.make,
        model: r.model,
        year: r.year,
        colour: r.colour,
        fuelType: r.fuelType,
        transmission: r.transmission,
        vin: r.vin,
        variant: r.variant,
        bodyType: r.bodyType,
        engineCC: r.engineCC,
        engineNumber: r.engineNumber,
        keyNumber: r.keyNumber,
        chassisNumber: r.chassisNumber,
        radioCode: r.radioCode,
        description: r.description,
        purchaseDate: r.purchaseDate,
        purchasePrice: r.purchasePrice,
        purchasedFrom: r.purchasedFrom,
        ownership: r.ownership,
        financeCompany: r.financeCompany,
        agreementNumber: r.agreementNumber,
        deposit: r.deposit,
        monthlyPayment: r.monthlyPayment,
        financeStartDate: r.financeStartDate,
        financeEndDate: r.financeEndDate,
        balloonPayment: r.balloonPayment,
        annualMileageAllowance: r.annualMileageAllowance,
        numberOfPayments: r.numberOfPayments,
        lessor: r.lessor,
        agreementHolder: r.agreementHolder,
        ownershipNotes: r.ownershipNotes,
        insurer: r.insurer,
        insurancePolicyNumber: r.insurancePolicyNumber,
        insuranceRenewalDate: r.insuranceRenewalDate,
        insuranceType: r.insuranceType,
        insuredDrivers: r.insuredDrivers,
        insuranceAnnualCost: r.insuranceAnnualCost,
        breakdownProvider: r.breakdownProvider,
        breakdownMembershipNumber: r.breakdownMembershipNumber,
        breakdownContact: r.breakdownContact,
        breakdownNotes: r.breakdownNotes,
        recoveryProvider: r.recoveryProvider,
        recoveryArrangedVia: r.recoveryArrangedVia,
        recoveryReference: r.recoveryReference,
        recoveryContact: r.recoveryContact,
        recoveryNotes: r.recoveryNotes,
        motDueDate: r.motDueDate,
        taxDueDate: r.taxDueDate,
        currentMileage: r.currentMileage,
        notes: r.notes,
        dvlaVerified: r.dvlaVerified,
        taxStatus: r.taxStatus,
        motStatus: r.motStatus,
        photoPath: r.photoPath,
      );

  models.ServiceEntry _serviceFromRow(ServiceEntryRow r) =>
      models.ServiceEntry(
        id: r.id,
        vehicleId: r.vehicleId,
        date: r.date,
        type: r.type,
        description: r.description,
        cost: r.cost,
        garage: r.garage,
        mileage: r.mileage,
        nextServiceDate: r.nextServiceDate,
        nextServiceMileage: r.nextServiceMileage,
      );

  models.MOTRecord _motFromRow(MOTRecordRow r) => models.MOTRecord(
        id: r.id,
        vehicleId: r.vehicleId,
        testDate: r.testDate,
        expiryDate: r.expiryDate,
        testCentre: r.testCentre,
        mileage: r.mileage,
        result: r.result,
        advisories: r.advisories,
      );

  models.DocumentRef _documentFromRow(DocumentRefRow r) => models.DocumentRef(
        id: r.id,
        parentType: r.parentType,
        parentId: r.parentId,
        filename: r.filename,
        localPath: r.localPath,
        fileType: r.fileType,
        addedDate: r.addedDate,
      );

  models.DriverProfile _profileFromRow(DriverProfileRow r) =>
      models.DriverProfile(
        id: r.id,
        name: r.name,
        licenceNumber: r.licenceNumber,
        licenceExpiry: r.licenceExpiry,
        licenceCategories: r.licenceCategories,
        address: r.address,
        emergencyContactName: r.emergencyContactName,
        emergencyContactPhone: r.emergencyContactPhone,
        bloodType: r.bloodType,
        photoPath: r.photoPath,
        licencePhotoFront: r.licencePhotoFront,
        licencePhotoBack: r.licencePhotoBack,
        notes: r.notes,
      );
}

