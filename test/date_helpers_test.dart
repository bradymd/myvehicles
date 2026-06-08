import 'package:flutter_test/flutter_test.dart';
import 'package:my_vehicles/utils/date_helpers.dart';

/// Builds a YYYY-MM-DD string offset from today by [days].
String dateOffset(int days) {
  final d = DateTime.now().add(Duration(days: days));
  return '${d.year}-${d.month.toString().padLeft(2, '0')}-'
      '${d.day.toString().padLeft(2, '0')}';
}

void main() {
  group('isTaxConfirmed', () {
    test('true only for the DVLA "Taxed" status, case/space-insensitive', () {
      expect(isTaxConfirmed('Taxed'), isTrue);
      expect(isTaxConfirmed('taxed'), isTrue);
      expect(isTaxConfirmed('  TAXED  '), isTrue);
    });

    test('false for every other status', () {
      expect(isTaxConfirmed('Untaxed'), isFalse);
      expect(isTaxConfirmed('SORN'), isFalse);
      expect(isTaxConfirmed('Not Taxed for on Road Use'), isFalse);
      expect(isTaxConfirmed(''), isFalse);
      expect(isTaxConfirmed(null), isFalse);
    });
  });

  group('daysUntil', () {
    test('returns -1 for empty, null or unparseable input', () {
      expect(daysUntil(null), -1);
      expect(daysUntil(''), -1);
      expect(daysUntil('not-a-date'), -1);
    });

    test('is negative for past dates and positive for future dates', () {
      expect(daysUntil(dateOffset(-30)), lessThan(0));
      expect(daysUntil(dateOffset(30)), greaterThan(0));
    });
  });

  group('isPastDate', () {
    test('true for past, false for future / empty / null', () {
      expect(isPastDate(dateOffset(-1)), isTrue);
      expect(isPastDate(dateOffset(30)), isFalse);
      expect(isPastDate(''), isFalse);
      expect(isPastDate(null), isFalse);
    });
  });

  group('isDueSoon', () {
    test('true within the window, false outside it or in the past', () {
      expect(isDueSoon(dateOffset(10)), isTrue);
      expect(isDueSoon(dateOffset(100)), isFalse);
      expect(isDueSoon(dateOffset(-5)), isFalse);
    });
  });

  group('formatDateUK', () {
    test('formats a valid ISO date as dd/MM/yyyy', () {
      expect(formatDateUK('2024-03-09'), '09/03/2024');
    });

    test('handles empty and unparseable input', () {
      expect(formatDateUK(''), 'Not set');
      expect(formatDateUK(null), 'Not set');
      expect(formatDateUK('garbage'), 'garbage');
    });
  });

  group('formatDateRelative', () {
    test('describes past dates as "N days ago"', () {
      expect(formatDateRelative(dateOffset(-5)), endsWith('days ago'));
    });

    test('handles empty input', () {
      expect(formatDateRelative(''), 'Not set');
      expect(formatDateRelative(null), 'Not set');
    });
  });
}
