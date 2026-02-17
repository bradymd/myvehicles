import 'dart:io';

import 'package:syncfusion_flutter_pdf/pdf.dart';

/// Extracted data from a document, keyed by field name.
typedef ExtractedData = Map<String, String>;

/// Service that extracts text from PDF files and parses it
/// to find relevant vehicle/insurance/MOT information.
class DocumentParserService {
  /// Extract all text from a PDF file.
  static String? extractTextFromPdf(String filePath) {
    try {
      final file = File(filePath);
      if (!file.existsSync()) return null;

      final bytes = file.readAsBytesSync();
      final document = PdfDocument(inputBytes: bytes);
      final extractor = PdfTextExtractor(document);
      final text = extractor.extractText();
      document.dispose();
      return text;
    } catch (_) {
      return null;
    }
  }

  static final _monthNames = {
    'january': '01', 'february': '02', 'march': '03', 'april': '04',
    'may': '05', 'june': '06', 'july': '07', 'august': '08',
    'september': '09', 'october': '10', 'november': '11', 'december': '12',
    'jan': '01', 'feb': '02', 'mar': '03', 'apr': '04',
    'jun': '06', 'jul': '07', 'aug': '08',
    'sep': '09', 'oct': '10', 'nov': '11', 'dec': '12',
  };

  /// Try to parse insurance-related fields from extracted text.
  static ExtractedData parseInsuranceData(String text) {
    final data = <String, String>{};
    final lower = text.toLowerCase();

    // Insurer / company name — common UK insurers
    final insurers = [
      'Admiral', 'Aviva', 'Direct Line', 'Churchill', 'LV=',
      'Hastings Direct', 'Hastings', 'More Than', 'Zurich',
      'AXA', 'Allianz', 'NFU Mutual', 'RSA', 'Esure',
      'Saga', 'Privilege', 'RAC', 'AA Insurance',
      'Covea', 'Ageas', 'ERS', 'Markerstudy',
      'Tesco Bank', 'Sainsbury', 'Co-op', 'John Lewis',
      'Liverpool Victoria', 'Swinton', 'Cornmarket',
      'One Call', 'Budget', 'Quote Me Happy',
    ];
    for (final insurer in insurers) {
      if (lower.contains(insurer.toLowerCase())) {
        // Normalise LV variants
        if (insurer == 'Liverpool Victoria') {
          data['insurer'] = 'LV=';
        } else {
          data['insurer'] = insurer;
        }
        break;
      }
    }

    // Policy number patterns
    final policyPatterns = [
      RegExp(r'policy\s*(?:no|number|ref)[.:\s]*([A-Z0-9/-]{5,20})', caseSensitive: false),
      RegExp(r'certificate\s*(?:no|number)[.:\s]*([A-Z0-9/-]{5,20})', caseSensitive: false),
    ];
    for (final pattern in policyPatterns) {
      final match = pattern.firstMatch(text);
      if (match != null) {
        data['policyNumber'] = match.group(1)!.trim();
        break;
      }
    }

    // Insurance type
    if (lower.contains('comprehensive')) {
      data['insuranceType'] = 'comprehensive';
    } else if (lower.contains('third party') && lower.contains('fire')) {
      data['insuranceType'] = 'thirdPartyFireTheft';
    } else if (lower.contains('third party')) {
      data['insuranceType'] = 'thirdParty';
    }

    // Renewal/expiry date — try "to DD Month YYYY" pattern first (common in insurance docs)
    // e.g. "to 21 March 2026" or "until 21 March 2026"
    final toDateNamedPattern = RegExp(
      r'(?:to|until)\s+(\d{1,2})\s+(january|february|march|april|may|june|july|august|september|october|november|december)\s+(\d{4})',
      caseSensitive: false,
    );
    final toDateNamedMatch = toDateNamedPattern.firstMatch(text);
    if (toDateNamedMatch != null) {
      final parsed = _parseDateNamed(
        toDateNamedMatch.group(1)!,
        toDateNamedMatch.group(2)!,
        toDateNamedMatch.group(3)!,
      );
      if (parsed != null) data['renewalDate'] = parsed;
    }

    // Also try numeric date patterns for renewal
    if (!data.containsKey('renewalDate')) {
      final datePatterns = [
        RegExp(r'(?:renewal|expiry|expires?|end)\s*(?:date)?[:\s]*(\d{1,2}[/.-]\d{1,2}[/.-]\d{2,4})', caseSensitive: false),
        RegExp(r'(?:to|until)\s*(\d{1,2}[/.-]\d{1,2}[/.-]\d{2,4})', caseSensitive: false),
      ];
      for (final pattern in datePatterns) {
        final match = pattern.firstMatch(text);
        if (match != null) {
          final parsed = _parseDate(match.group(1)!);
          if (parsed != null) {
            data['renewalDate'] = parsed;
            break;
          }
        }
      }
    }

    // Start / effective date — try "DD Month YYYY" named pattern
    // Look for patterns like "24 June 2025\nto" or "from 24 June 2025"
    final startDateNamedPatterns = [
      RegExp(
        r'(?:from|commenc|start|effective|between)\s*(\d{1,2})\s+(january|february|march|april|may|june|july|august|september|october|november|december)\s+(\d{4})',
        caseSensitive: false,
      ),
      // Covered between DD Month YYYY and ...
      RegExp(
        r'covered\s+between\s*(\d{1,2})\s+(january|february|march|april|may|june|july|august|september|october|november|december)\s+(\d{4})',
        caseSensitive: false,
      ),
    ];
    for (final pattern in startDateNamedPatterns) {
      final match = pattern.firstMatch(text);
      if (match != null) {
        final parsed = _parseDateNamed(
          match.group(1)!,
          match.group(2)!,
          match.group(3)!,
        );
        if (parsed != null) {
          data['startDate'] = parsed;
          break;
        }
      }
    }

    // Also try numeric date patterns for start
    if (!data.containsKey('startDate')) {
      final startPatterns = [
        RegExp(r'(?:start|effective|from|commenc)\s*(?:date)?[:\s]*(\d{1,2}[/.-]\d{1,2}[/.-]\d{2,4})', caseSensitive: false),
      ];
      for (final pattern in startPatterns) {
        final match = pattern.firstMatch(text);
        if (match != null) {
          final parsed = _parseDate(match.group(1)!);
          if (parsed != null) {
            data['startDate'] = parsed;
            break;
          }
        }
      }
    }

    // Annual cost / price — look for £ amounts
    // Patterns like "Full year's price*Price...£ 535.87" or "Total price:\n£91.29"
    final costPatterns = [
      // "full year's price" followed by £ amount
      RegExp(r"full\s*year'?s?\s*price[^£]*£\s*([0-9,]+\.?\d*)", caseSensitive: false),
      // "total price" followed by £ amount
      RegExp(r'total\s*price[:\s]*£\s*([0-9,]+\.?\d*)', caseSensitive: false),
      // "annual premium" followed by £ amount
      RegExp(r'annual\s*(?:premium|cost)[:\s]*£\s*([0-9,]+\.?\d*)', caseSensitive: false),
    ];
    for (final pattern in costPatterns) {
      final match = pattern.firstMatch(text);
      if (match != null) {
        final amount = match.group(1)!.replaceAll(',', '').trim();
        final parsed = double.tryParse(amount);
        if (parsed != null && parsed > 0) {
          data['annualCost'] = parsed.toStringAsFixed(2);
          break;
        }
      }
    }

    // Insured drivers — look for named drivers
    // Pattern: "Name - DD Month YYYY" (date of birth line in driver listings)
    // or lines like "Christianne Ribeiro" and "Mark Brady" from driver sections
    final driverPattern = RegExp(
      r'([A-Z][a-z]+(?:\s+[A-Z][a-z]+)+)\s*-\s*\d{1,2}\s+(?:january|february|march|april|may|june|july|august|september|october|november|december)\s+\d{4}',
      caseSensitive: false,
    );
    final driverMatches = driverPattern.allMatches(text).toList();
    if (driverMatches.isNotEmpty) {
      final names = driverMatches
          .map((m) => m.group(1)!.trim())
          .toSet()
          .toList();
      data['insuredDrivers'] = names.join(', ');
    }

    return data;
  }

  /// Try to parse MOT-related fields from extracted text.
  static ExtractedData parseMOTData(String text) {
    final data = <String, String>{};
    final lower = text.toLowerCase();

    // Test date
    final testDatePatterns = [
      RegExp(r'(?:date\s*(?:of\s*)?test|tested?\s*(?:on|date))[:\s]*(\d{1,2}[/.-]\d{1,2}[/.-]\d{2,4})', caseSensitive: false),
    ];
    for (final pattern in testDatePatterns) {
      final match = pattern.firstMatch(text);
      if (match != null) {
        final parsed = _parseDate(match.group(1)!);
        if (parsed != null) {
          data['testDate'] = parsed;
          break;
        }
      }
    }

    // Expiry date
    final expiryPatterns = [
      RegExp(r'(?:expiry|expires?|valid\s*until)[:\s]*(\d{1,2}[/.-]\d{1,2}[/.-]\d{2,4})', caseSensitive: false),
    ];
    for (final pattern in expiryPatterns) {
      final match = pattern.firstMatch(text);
      if (match != null) {
        final parsed = _parseDate(match.group(1)!);
        if (parsed != null) {
          data['expiryDate'] = parsed;
          break;
        }
      }
    }

    // Result
    if (lower.contains('pass')) {
      data['result'] = 'pass';
    } else if (lower.contains('fail')) {
      data['result'] = 'fail';
    }

    // Mileage
    final mileagePattern = RegExp(r'(?:mileage|odometer)[:\s]*(\d{1,6})', caseSensitive: false);
    final mileageMatch = mileagePattern.firstMatch(text);
    if (mileageMatch != null) {
      data['mileage'] = mileageMatch.group(1)!;
    }

    // Test centre / station
    final centrePattern = RegExp(r'(?:test\s*(?:station|centre)|testing\s*station)[:\s]*([^\n]{3,40})', caseSensitive: false);
    final centreMatch = centrePattern.firstMatch(text);
    if (centreMatch != null) {
      data['testCentre'] = centreMatch.group(1)!.trim();
    }

    // Registration from MOT
    final regPattern = RegExp(r'(?:registration|reg\s*(?:no|number|mark))[:\s]*([A-Z]{2}\d{2}\s*[A-Z]{3})', caseSensitive: false);
    final regMatch = regPattern.firstMatch(text);
    if (regMatch != null) {
      data['registration'] = regMatch.group(1)!.trim().toUpperCase();
    }

    return data;
  }

  /// Try to parse vehicle-related fields from any document.
  static ExtractedData parseVehicleData(String text) {
    final data = <String, String>{};

    // Registration — UK format
    final regPattern = RegExp(r'\b([A-Z]{2}\d{2}\s*[A-Z]{3})\b');
    final regMatch = regPattern.firstMatch(text);
    if (regMatch != null) {
      data['registration'] = regMatch.group(1)!.replaceAll(' ', '').toUpperCase();
    }

    // Make
    final makes = [
      'CITROEN', 'FORD', 'VAUXHALL', 'BMW', 'AUDI', 'VOLKSWAGEN', 'VW',
      'MERCEDES', 'TOYOTA', 'HONDA', 'NISSAN', 'HYUNDAI', 'KIA',
      'PEUGEOT', 'RENAULT', 'FIAT', 'VOLVO', 'SKODA', 'SEAT',
      'LAND ROVER', 'JAGUAR', 'MINI', 'SUZUKI', 'MAZDA', 'LEXUS',
      'PORSCHE', 'TESLA', 'MG', 'DACIA', 'CUPRA', 'BENTLEY',
      'ROLLS ROYCE', 'ASTON MARTIN', 'MASERATI', 'ALFA ROMEO',
      'MITSUBISHI', 'SUBARU', 'JEEP', 'CHRYSLER', 'DODGE',
      'CHEVROLET', 'SSANGYONG', 'GENESIS', 'BYD', 'POLESTAR',
      'SMART', 'DS', 'LOTUS',
    ];
    final upper = text.toUpperCase();
    for (final make in makes) {
      if (upper.contains(make)) {
        // Title case: "KIA" -> "Kia", "LAND ROVER" -> "Land Rover"
        data['make'] = make.split(' ').map((w) =>
            w[0] + w.substring(1).toLowerCase()).join(' ');
        break;
      }
    }

    return data;
  }

  /// Determine which parser to use based on parent type.
  static ExtractedData parseForType(String text, String parentType) {
    final data = <String, String>{};

    // Always try vehicle data
    data.addAll(parseVehicleData(text));

    switch (parentType) {
      case 'insurance':
        data.addAll(parseInsuranceData(text));
      case 'mot':
        data.addAll(parseMOTData(text));
      default:
        // For other types, try all parsers and merge
        data.addAll(parseInsuranceData(text));
        data.addAll(parseMOTData(text));
    }

    return data;
  }

  /// Parse various date formats into YYYY-MM-DD.
  static String? _parseDate(String raw) {
    final cleaned = raw.trim();

    // Try DD/MM/YYYY or DD-MM-YYYY or DD.MM.YYYY
    final match = RegExp(r'(\d{1,2})[/.-](\d{1,2})[/.-](\d{2,4})').firstMatch(cleaned);
    if (match == null) return null;

    final day = int.tryParse(match.group(1)!) ?? 0;
    final month = int.tryParse(match.group(2)!) ?? 0;
    var year = int.tryParse(match.group(3)!) ?? 0;

    if (year < 100) year += 2000;
    if (day < 1 || day > 31 || month < 1 || month > 12) return null;

    return '${year.toString()}-${month.toString().padLeft(2, '0')}-${day.toString().padLeft(2, '0')}';
  }

  /// Parse "DD Month YYYY" format into YYYY-MM-DD.
  static String? _parseDateNamed(String dayStr, String monthName, String yearStr) {
    final day = int.tryParse(dayStr.trim());
    final year = int.tryParse(yearStr.trim());
    final month = _monthNames[monthName.toLowerCase().trim()];

    if (day == null || year == null || month == null) return null;
    if (day < 1 || day > 31) return null;

    return '$year-$month-${day.toString().padLeft(2, '0')}';
  }

  /// Human-readable field labels for display in confirmation dialog.
  static String fieldLabel(String key) {
    return switch (key) {
      'insurer' => 'Insurer',
      'policyNumber' => 'Policy Number',
      'insuranceType' => 'Insurance Type',
      'renewalDate' => 'Renewal / Expiry Date',
      'startDate' => 'Start Date',
      'annualCost' => 'Annual Cost',
      'insuredDrivers' => 'Insured Drivers',
      'testDate' => 'Test Date',
      'expiryDate' => 'Expiry Date',
      'result' => 'Result',
      'mileage' => 'Mileage',
      'testCentre' => 'Test Centre',
      'registration' => 'Registration',
      'make' => 'Make',
      _ => key,
    };
  }

  /// Human-readable value display (e.g. insurance type enum -> label).
  static String displayValue(String key, String value) {
    if (key == 'insuranceType') {
      return switch (value) {
        'comprehensive' => 'Comprehensive',
        'thirdPartyFireTheft' => 'Third Party Fire & Theft',
        'thirdParty' => 'Third Party Only',
        _ => value,
      };
    }
    if (key == 'result') {
      return value == 'pass' ? 'PASS' : 'FAIL';
    }
    if (key == 'annualCost') {
      return '\u00A3$value';
    }
    return value;
  }
}
