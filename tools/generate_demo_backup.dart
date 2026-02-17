// Generates a demo backup ZIP file for the MyVehicles app.
//
// Run from the project root:
//   dart run tools/generate_demo_backup.dart
//
// Requires the `sqlite3` and `archive` packages (already in pubspec.yaml).

// ignore_for_file: avoid_print

import 'dart:io';
import 'package:sqlite3/sqlite3.dart';
import 'package:archive/archive.dart';

void main() {
  // Locate project root (script lives in tools/)
  final scriptDir = File(Platform.script.toFilePath()).parent;
  final projectRoot = scriptDir.parent;

  // --- Create temporary SQLite database ---
  final dbPath = '${Directory.systemTemp.path}/demo_backup.db';
  final db = sqlite3.open(dbPath);

  _createTables(db);
  _insertDriverProfiles(db);
  _insertVehicles(db);
  _insertServiceEntries(db);
  _insertMOTRecords(db);
  _insertAppSettings(db);

  db.dispose();

  // --- Package into ZIP ---
  final dbBytes = File(dbPath).readAsBytesSync();
  final archive = Archive();
  archive.addFile(ArchiveFile('app_database.db', dbBytes.length, dbBytes));

  final zipData = ZipEncoder().encode(archive);
  final outPath = '${projectRoot.path}/assets/demo_backup.zip';
  File(outPath).writeAsBytesSync(zipData);

  // Cleanup temp DB
  File(dbPath).deleteSync();

  print('Demo backup created at assets/demo_backup.zip');
  print('  Database size: ${dbBytes.length} bytes');
  print('  ZIP size:      ${zipData.length} bytes');
}

// ---------------------------------------------------------------------------
// IDs — fixed v4-style UUIDs so the script is deterministic
// ---------------------------------------------------------------------------

// Driver profile IDs
const _jamesId = 'a1b2c3d4-e5f6-4a7b-8c9d-0e1f2a3b4c5d';
const _sarahId = 'b2c3d4e5-f6a7-4b8c-9d0e-1f2a3b4c5d6e';
const _emilyId = 'c3d4e5f6-a7b8-4c9d-0e1f-2a3b4c5d6e7f';

// Vehicle IDs
const _golfId = 'd4e5f6a7-b8c9-4d0e-1f2a-3b4c5d6e7f80';
const _yarisId = 'e5f6a7b8-c9d0-4e1f-2a3b-4c5d6e7f8091';
const _fiestaId = 'f6a7b8c9-d0e1-4f2a-3b4c-5d6e7f8091a2';

// Service entry IDs
const _svcGolf1 = '11111111-1111-4111-8111-111111111111';
const _svcGolf2 = '22222222-2222-4222-8222-222222222222';
const _svcGolf3 = '33333333-3333-4333-8333-333333333333';
const _svcYaris1 = '44444444-4444-4444-8444-444444444444';
const _svcYaris2 = '55555555-5555-4555-8555-555555555555';
const _svcFiesta1 = '66666666-6666-4666-8666-666666666666';
const _svcFiesta2 = '77777777-7777-4777-8777-777777777777';

// MOT record IDs
const _motGolf1 = '88888888-8888-4888-8888-888888888888';
const _motGolf2 = '99999999-9999-4999-8999-999999999999';
const _motYaris1 = 'aaaaaaaa-aaaa-4aaa-8aaa-aaaaaaaaaaaa';

// ---------------------------------------------------------------------------
// Schema
// ---------------------------------------------------------------------------

void _createTables(Database db) {
  db.execute('''
    CREATE TABLE vehicles (
      id TEXT PRIMARY KEY,
      registration TEXT,
      make TEXT,
      model TEXT,
      year TEXT,
      colour TEXT,
      fuel_type TEXT,
      transmission TEXT,
      vin TEXT,
      variant TEXT,
      body_type TEXT,
      engine_c_c TEXT,
      engine_number TEXT,
      key_number TEXT,
      chassis_number TEXT,
      radio_code TEXT,
      description TEXT,
      purchase_date TEXT,
      purchase_price REAL,
      purchased_from TEXT,
      ownership TEXT,
      finance_company TEXT,
      agreement_number TEXT,
      deposit REAL,
      monthly_payment REAL,
      finance_start_date TEXT,
      finance_end_date TEXT,
      balloon_payment REAL,
      annual_mileage_allowance INTEGER,
      number_of_payments INTEGER,
      lessor TEXT,
      agreement_holder TEXT,
      ownership_notes TEXT,
      insurer TEXT,
      insurance_policy_number TEXT,
      insurance_renewal_date TEXT,
      insurance_type TEXT,
      insured_drivers TEXT,
      insurance_annual_cost REAL,
      breakdown_provider TEXT,
      breakdown_membership_number TEXT,
      breakdown_contact TEXT,
      breakdown_notes TEXT,
      recovery_provider TEXT,
      recovery_arranged_via TEXT,
      recovery_reference TEXT,
      recovery_contact TEXT,
      recovery_notes TEXT,
      mot_due_date TEXT,
      tax_due_date TEXT,
      current_mileage INTEGER,
      notes TEXT,
      photo_path TEXT
    );
  ''');

  db.execute('''
    CREATE TABLE service_entries (
      id TEXT PRIMARY KEY,
      vehicle_id TEXT,
      date TEXT,
      type TEXT,
      description TEXT,
      cost REAL,
      garage TEXT,
      mileage INTEGER,
      next_service_date TEXT,
      next_service_mileage INTEGER
    );
  ''');

  db.execute('''
    CREATE TABLE m_o_t_records (
      id TEXT PRIMARY KEY,
      vehicle_id TEXT,
      test_date TEXT,
      expiry_date TEXT,
      test_centre TEXT,
      mileage INTEGER,
      result TEXT,
      advisories TEXT
    );
  ''');

  db.execute('''
    CREATE TABLE document_refs (
      id TEXT PRIMARY KEY,
      parent_type TEXT,
      parent_id TEXT,
      filename TEXT,
      local_path TEXT,
      file_type TEXT,
      added_date TEXT
    );
  ''');

  db.execute('''
    CREATE TABLE driver_profiles (
      id TEXT PRIMARY KEY,
      name TEXT,
      licence_number TEXT,
      licence_expiry TEXT,
      licence_categories TEXT,
      address TEXT,
      emergency_contact_name TEXT,
      emergency_contact_phone TEXT,
      blood_type TEXT,
      photo_path TEXT,
      licence_photo_front TEXT,
      licence_photo_back TEXT,
      notes TEXT
    );
  ''');

  db.execute('''
    CREATE TABLE app_settings (
      key TEXT PRIMARY KEY,
      value TEXT
    );
  ''');
}

// ---------------------------------------------------------------------------
// Driver Profiles
// ---------------------------------------------------------------------------

void _insertDriverProfiles(Database db) {
  db.execute('''
    INSERT INTO driver_profiles
      (id, name, licence_number, licence_expiry, licence_categories,
       address, emergency_contact_name, emergency_contact_phone,
       blood_type, photo_path, licence_photo_front, licence_photo_back, notes)
    VALUES
      ('$_jamesId', 'James Bradshaw', 'BRAND710156JB9AB', '2028-03-15', 'B',
       '', 'Sarah Bradshaw', '07700 900001',
       'O+', '', '', '', ''),
      ('$_sarahId', 'Sarah Bradshaw', 'BRAND810287SB4CD', '2027-11-20', 'B',
       '', 'James Bradshaw', '07700 900002',
       'A+', '', '', '', ''),
      ('$_emilyId', 'Emily Bradshaw', 'BRAND040512EB2EF', '2029-06-01', 'B',
       '', 'James Bradshaw', '07700 900002',
       'O+', '', '', '', '');
  ''');
}

// ---------------------------------------------------------------------------
// Vehicles
// ---------------------------------------------------------------------------

void _insertVehicles(Database db) {
  // 1. VW Golf — owned outright
  db.execute('''
    INSERT INTO vehicles (
      id, registration, make, model, year, colour, fuel_type, transmission,
      vin, variant, body_type, engine_c_c, engine_number, key_number,
      chassis_number, radio_code, description,
      purchase_date, purchase_price, purchased_from, ownership,
      finance_company, agreement_number, deposit, monthly_payment,
      finance_start_date, finance_end_date, balloon_payment,
      annual_mileage_allowance, number_of_payments, lessor, agreement_holder,
      ownership_notes,
      insurer, insurance_policy_number, insurance_renewal_date,
      insurance_type, insured_drivers, insurance_annual_cost,
      breakdown_provider, breakdown_membership_number, breakdown_contact,
      breakdown_notes,
      recovery_provider, recovery_arranged_via, recovery_reference,
      recovery_contact, recovery_notes,
      mot_due_date, tax_due_date, current_mileage, notes, photo_path
    ) VALUES (
      '$_golfId', 'WR21 BDK', 'Volkswagen', 'Golf', '2021', 'White',
      'Petrol', 'Manual',
      '', '', '', '', '', '', '', '', '',
      '', 0.0, '', 'owned',
      '', '', 0.0, 0.0,
      '', '', 0.0,
      0, 0, '', '',
      '',
      'Admiral', 'ADM-VG-2024-001', '2026-06-15',
      'Comprehensive', 'James & Sarah', 485.00,
      'AA', 'AA-12345678', '0800 887766',
      '',
      '', '', '', '', '',
      '2026-09-21', '2026-03-01', 34521, '', ''
    );
  ''');

  // 2. Toyota Yaris — PCP finance
  db.execute('''
    INSERT INTO vehicles (
      id, registration, make, model, year, colour, fuel_type, transmission,
      vin, variant, body_type, engine_c_c, engine_number, key_number,
      chassis_number, radio_code, description,
      purchase_date, purchase_price, purchased_from, ownership,
      finance_company, agreement_number, deposit, monthly_payment,
      finance_start_date, finance_end_date, balloon_payment,
      annual_mileage_allowance, number_of_payments, lessor, agreement_holder,
      ownership_notes,
      insurer, insurance_policy_number, insurance_renewal_date,
      insurance_type, insured_drivers, insurance_annual_cost,
      breakdown_provider, breakdown_membership_number, breakdown_contact,
      breakdown_notes,
      recovery_provider, recovery_arranged_via, recovery_reference,
      recovery_contact, recovery_notes,
      mot_due_date, tax_due_date, current_mileage, notes, photo_path
    ) VALUES (
      '$_yarisId', 'KA22 SMB', 'Toyota', 'Yaris', '2022', 'Silver',
      'Hybrid', 'Automatic',
      '', '', '', '', '', '', '', '', '',
      '', 0.0, '', 'PCP',
      'Toyota Financial Services', 'TFS-YA-2022-789', 2500.00, 245.00,
      '2022-04-01', '2026-04-01', 6500.00,
      10000, 48, '', '',
      '',
      'Direct Line', 'DL-TY-2024-456', '2026-08-01',
      'Comprehensive', 'Sarah', 520.00,
      'RAC', 'RAC-87654321', '0800 828282',
      '',
      '', '', '', '', '',
      '2026-11-15', '2026-04-01', 18234, '', ''
    );
  ''');

  // 3. Ford Fiesta — owned outright
  db.execute('''
    INSERT INTO vehicles (
      id, registration, make, model, year, colour, fuel_type, transmission,
      vin, variant, body_type, engine_c_c, engine_number, key_number,
      chassis_number, radio_code, description,
      purchase_date, purchase_price, purchased_from, ownership,
      finance_company, agreement_number, deposit, monthly_payment,
      finance_start_date, finance_end_date, balloon_payment,
      annual_mileage_allowance, number_of_payments, lessor, agreement_holder,
      ownership_notes,
      insurer, insurance_policy_number, insurance_renewal_date,
      insurance_type, insured_drivers, insurance_annual_cost,
      breakdown_provider, breakdown_membership_number, breakdown_contact,
      breakdown_notes,
      recovery_provider, recovery_arranged_via, recovery_reference,
      recovery_contact, recovery_notes,
      mot_due_date, tax_due_date, current_mileage, notes, photo_path
    ) VALUES (
      '$_fiestaId', 'LT24 EBR', 'Ford', 'Fiesta', '2024', 'Red',
      'Petrol', 'Manual',
      '', '', '', '', '', '', '', '', '',
      '', 0.0, '', 'owned',
      '', '', 0.0, 0.0,
      '', '', 0.0,
      0, 0, '', '',
      '',
      'Aviva', 'AV-FF-2025-321', '2027-01-10',
      'Comprehensive', 'Emily', 890.00,
      'Green Flag', 'GF-11223344', '0800 400600',
      '',
      '', '', '', '', '',
      '2027-03-24', '2026-09-01', 5120, '', ''
    );
  ''');
}

// ---------------------------------------------------------------------------
// Service Entries
// ---------------------------------------------------------------------------

void _insertServiceEntries(Database db) {
  // --- Golf services ---
  db.execute('''
    INSERT INTO service_entries
      (id, vehicle_id, date, type, description, cost, garage,
       mileage, next_service_date, next_service_mileage)
    VALUES
      ('$_svcGolf1', '$_golfId', '2025-03-15', 'service',
       'Annual service', 285.00, 'Halfords Autocentre',
       28450, '', 0),
      ('$_svcGolf2', '$_golfId', '2025-08-20', 'repair',
       'Brake pads replacement', 189.50, 'Kwik Fit',
       31200, '', 0),
      ('$_svcGolf3', '$_golfId', '2024-11-10', 'repair',
       'Tyre replacement x2', 220.00, 'National Tyres',
       25800, '', 0);
  ''');

  // --- Yaris services ---
  db.execute('''
    INSERT INTO service_entries
      (id, vehicle_id, date, type, description, cost, garage,
       mileage, next_service_date, next_service_mileage)
    VALUES
      ('$_svcYaris1', '$_yarisId', '2025-06-01', 'service',
       'Annual service', 195.00, 'Toyota Dealer (Richmond)',
       15200, '', 0),
      ('$_svcYaris2', '$_yarisId', '2025-01-15', 'inspection',
       'Hybrid battery check', 0.00, 'Toyota Dealer (Richmond)',
       12500, '', 0);
  ''');

  // --- Fiesta services ---
  db.execute('''
    INSERT INTO service_entries
      (id, vehicle_id, date, type, description, cost, garage,
       mileage, next_service_date, next_service_mileage)
    VALUES
      ('$_svcFiesta1', '$_fiestaId', '2025-09-10', 'service',
       'First service', 149.00, 'Ford Dealer (Kingston)',
       4800, '', 0),
      ('$_svcFiesta2', '$_fiestaId', '2025-12-01', 'repair',
       'Air filter replacement', 45.00, 'Halfords Autocentre',
       5050, '', 0);
  ''');
}

// ---------------------------------------------------------------------------
// MOT Records
// ---------------------------------------------------------------------------

void _insertMOTRecords(Database db) {
  // Golf — two passes
  db.execute('''
    INSERT INTO m_o_t_records
      (id, vehicle_id, test_date, expiry_date, test_centre,
       mileage, result, advisories)
    VALUES
      ('$_motGolf1', '$_golfId', '2025-09-21', '2026-09-21',
       'Halfords Autocentre', 32100, 'Pass',
       'Front tyres approaching minimum tread depth'),
      ('$_motGolf2', '$_golfId', '2024-09-18', '2025-09-18',
       'Halfords Autocentre', 22300, 'Pass', '');
  ''');

  // Yaris — one pass
  db.execute('''
    INSERT INTO m_o_t_records
      (id, vehicle_id, test_date, expiry_date, test_centre,
       mileage, result, advisories)
    VALUES
      ('$_motYaris1', '$_yarisId', '2025-11-15', '2026-11-15',
       'Toyota Dealer (Richmond)', 17800, 'Pass', '');
  ''');

  // Fiesta (2024) — no MOT records; too new for first MOT.
  // mot_due_date is set to 2027-03-24 on the vehicle row.
}

// ---------------------------------------------------------------------------
// App Settings (leave empty or add demo defaults)
// ---------------------------------------------------------------------------

void _insertAppSettings(Database db) {
  // No specific settings required for demo data.
  // The table is created but left empty.
}
