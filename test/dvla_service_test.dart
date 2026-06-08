import 'package:flutter_test/flutter_test.dart';
import 'package:my_vehicles/services/dvla_service.dart';
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/utils/date_helpers.dart';

void main() {
  group('DvlaService.applyLookupToVehicle', () {
    const base = Vehicle(id: '1');

    test('maps a typical DVLA payload onto the vehicle', () {
      final data = <String, dynamic>{
        'make': 'CITROEN',
        'yearOfManufacture': 2022,
        'colour': 'BLUE',
        'fuelType': 'PETROL',
        'engineCapacity': 1199,
        'motExpiryDate': '2026-06-01',
        'taxDueDate': '2026-07-01',
        'taxStatus': 'Taxed',
        'motStatus': 'Valid',
      };

      final v = DvlaService.applyLookupToVehicle(base, data);

      expect(v.make, 'Citroen'); // title-cased
      expect(v.year, '2022'); // numeric coerced to string
      expect(v.colour, 'Blue');
      expect(v.fuelType, 'petrol');
      expect(v.engineCC, '1199');
      expect(v.motDueDate, '2026-06-01');
      expect(v.taxDueDate, '2026-07-01');
      expect(v.taxStatus, 'Taxed');
      expect(v.motStatus, 'Valid');
      expect(v.dvlaVerified, isTrue);
      // The status the alert system relies on round-trips correctly.
      expect(isTaxConfirmed(v.taxStatus), isTrue);
    });

    test('maps DVLA fuel types to app fuel names', () {
      String fuelFor(String dvla) =>
          DvlaService.applyLookupToVehicle(base, {'fuelType': dvla}).fuelType;
      expect(fuelFor('PETROL'), 'petrol');
      expect(fuelFor('DIESEL'), 'diesel');
      expect(fuelFor('ELECTRICITY'), 'electric');
      expect(fuelFor('HYBRID ELECTRIC'), 'hybrid');
      expect(fuelFor('SOMETHING ELSE'), 'other');
    });

    test('missing taxStatus becomes empty (not confirmed taxed)', () {
      final v = DvlaService.applyLookupToVehicle(base, <String, dynamic>{});
      expect(v.taxStatus, '');
      expect(isTaxConfirmed(v.taxStatus), isFalse);
    });

    test('preserves existing dates when DVLA omits them', () {
      const withDates =
          Vehicle(id: '2', taxDueDate: '2025-01-01', motDueDate: '2025-02-02');
      final v =
          DvlaService.applyLookupToVehicle(withDates, <String, dynamic>{});
      expect(v.taxDueDate, '2025-01-01');
      expect(v.motDueDate, '2025-02-02');
    });
  });
}
