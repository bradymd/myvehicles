import 'package:flutter_test/flutter_test.dart';
import 'package:my_vehicles/providers/alerts_provider.dart';
import 'package:my_vehicles/utils/date_helpers.dart';

void main() {
  group('alertLevelFromDays', () {
    test('past dates are expired', () {
      expect(alertLevelFromDays(-1), AlertLevel.expired);
      expect(alertLevelFromDays(-100), AlertLevel.expired);
    });

    test('0..7 days is urgent', () {
      expect(alertLevelFromDays(0), AlertLevel.urgent);
      expect(alertLevelFromDays(7), AlertLevel.urgent);
    });

    test('8..30 days is a warning', () {
      expect(alertLevelFromDays(8), AlertLevel.warning);
      expect(alertLevelFromDays(30), AlertLevel.warning);
    });

    test('beyond 30 days is ok', () {
      expect(alertLevelFromDays(31), AlertLevel.ok);
      expect(alertLevelFromDays(365), AlertLevel.ok);
    });
  });

  // Regression guard for the false "Tax expired" popup: a vehicle DVLA
  // confirms as "Taxed" must not raise a tax alert even when its stored
  // tax due date has passed. The alerts provider gates the tax alert on
  // !isTaxConfirmed(taxStatus); these assert the rule it depends on.
  group('tax alert suppression rule', () {
    test('confirmed-taxed suppresses the alert regardless of due date', () {
      const taxStatus = 'Taxed';
      final pastDays = -7; // would otherwise be AlertLevel.expired
      expect(alertLevelFromDays(pastDays), AlertLevel.expired);
      final shouldAlert = !isTaxConfirmed(taxStatus);
      expect(shouldAlert, isFalse);
    });

    test('untaxed with a past due date still alerts', () {
      const taxStatus = 'Untaxed';
      final shouldAlert = !isTaxConfirmed(taxStatus);
      expect(shouldAlert, isTrue);
    });
  });
}
