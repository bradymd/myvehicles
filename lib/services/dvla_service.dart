import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:my_vehicles/models/vehicle.dart';
import 'package:my_vehicles/services/env_service.dart';

class DvlaService {
  static const _endpoint =
      'https://driver-vehicle-licensing.api.gov.uk/vehicle-enquiry/v1/vehicles';

  static String? get apiKey => EnvService.env['DVLA_API_KEY'];

  static bool get isAvailable => (apiKey ?? '').isNotEmpty;

  /// Lookup a registration number. Returns parsed JSON or null on any failure.
  static Future<Map<String, dynamic>?> lookupRegistration(String reg) async {
    final key = apiKey;
    if (key == null || key.isEmpty) return null;

    final cleaned = reg.replaceAll(RegExp(r'\s'), '').toUpperCase();
    if (cleaned.isEmpty) return null;

    try {
      final response = await http
          .post(
            Uri.parse(_endpoint),
            headers: {
              'x-api-key': key,
              'Content-Type': 'application/json',
            },
            body: jsonEncode({'registrationNumber': cleaned}),
          )
          .timeout(const Duration(seconds: 5));

      if (response.statusCode == 200) {
        return jsonDecode(response.body) as Map<String, dynamic>;
      }
      return null;
    } catch (e) {
      debugPrint('DVLA lookup failed: $e');
      return null;
    }
  }

  /// Map DVLA fuel type string to app fuel type enum name.
  static String _mapFuelType(String dvlaFuel) {
    switch (dvlaFuel.toUpperCase()) {
      case 'PETROL':
        return 'petrol';
      case 'DIESEL':
        return 'diesel';
      case 'ELECTRICITY':
        return 'electric';
      case 'HYBRID ELECTRIC':
        return 'hybrid';
      default:
        return 'other';
    }
  }

  /// Title-case a string (e.g. "CITROEN" -> "Citroen").
  static String _titleCase(String s) {
    if (s.isEmpty) return s;
    return s
        .split(' ')
        .map((w) => w.isEmpty
            ? w
            : '${w[0].toUpperCase()}${w.substring(1).toLowerCase()}')
        .join(' ');
  }

  /// Apply DVLA lookup data to a vehicle, returning updated copy.
  static Vehicle applyLookupToVehicle(
      Vehicle v, Map<String, dynamic> data) {
    return v.copyWith(
      make: _titleCase((data['make'] as String?) ?? ''),
      year: (data['yearOfManufacture']?.toString()) ?? v.year,
      colour: _titleCase((data['colour'] as String?) ?? ''),
      fuelType: _mapFuelType((data['fuelType'] as String?) ?? ''),
      engineCC: (data['engineCapacity']?.toString()) ?? v.engineCC,
      motDueDate: (data['motExpiryDate'] as String?) ?? v.motDueDate,
      taxDueDate: (data['taxDueDate'] as String?) ?? v.taxDueDate,
      taxStatus: (data['taxStatus'] as String?) ?? '',
      motStatus: (data['motStatus'] as String?) ?? '',
      dvlaVerified: true,
    );
  }

  /// Formatted diagnostic string for Settings screen.
  static Future<String> diagnosticLookup(String reg) async {
    final key = apiKey;
    if (key == null || key.isEmpty) return 'Error: No API key configured';

    final cleaned = reg.replaceAll(RegExp(r'\s'), '').toUpperCase();
    if (cleaned.isEmpty) return 'Error: Empty registration';

    try {
      final response = await http
          .post(
            Uri.parse(_endpoint),
            headers: {
              'x-api-key': key,
              'Content-Type': 'application/json',
            },
            body: jsonEncode({'registrationNumber': cleaned}),
          )
          .timeout(const Duration(seconds: 10));

      final buf = StringBuffer();
      buf.writeln('Status: ${response.statusCode}');
      buf.writeln('Registration: $cleaned');
      buf.writeln('');

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body) as Map<String, dynamic>;
        for (final entry in data.entries) {
          buf.writeln('${entry.key}: ${entry.value}');
        }
      } else {
        buf.writeln('Response: ${response.body}');
      }

      return buf.toString();
    } catch (e) {
      return 'Error: $e';
    }
  }
}
