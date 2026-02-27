import 'package:freezed_annotation/freezed_annotation.dart';

part 'vehicle.freezed.dart';
part 'vehicle.g.dart';

@freezed
class Vehicle with _$Vehicle {
  const Vehicle._();

  const factory Vehicle({
    required String id,
    @Default('') String registration,
    @Default('') String make,
    @Default('') String model,
    @Default('') String year,
    @Default('') String colour,
    @Default('petrol') String fuelType,
    @Default('') String transmission,
    @Default('') String vin,
    @Default('') String variant,
    @Default('') String bodyType,
    @Default('') String engineCC,
    @Default('') String engineNumber,
    @Default('') String keyNumber,
    @Default('') String chassisNumber,
    @Default('') String radioCode,
    @Default('') String description,
    // Ownership / finance info
    @Default('') String purchaseDate,
    @Default(0) double purchasePrice,
    @Default('') String purchasedFrom,
    @Default('') String ownership,
    @Default('') String financeCompany,
    @Default('') String agreementNumber,
    @Default(0) double deposit,
    @Default(0) double monthlyPayment,
    @Default('') String financeStartDate,
    @Default('') String financeEndDate,
    @Default(0) double balloonPayment,
    @Default(0) int annualMileageAllowance,
    @Default(0) int numberOfPayments,
    @Default('') String lessor,
    @Default('') String agreementHolder,
    @Default('') String ownershipNotes,
    // Insurance
    @Default('') String insurer,
    @Default('') String insurancePolicyNumber,
    @Default('') String insuranceRenewalDate,
    @Default('') String insuranceType,
    @Default('') String insuredDrivers,
    @Default(0) double insuranceAnnualCost,
    // Breakdown / recovery
    @Default('') String breakdownProvider,
    @Default('') String breakdownMembershipNumber,
    @Default('') String breakdownContact,
    @Default('') String breakdownNotes,
    @Default('') String recoveryProvider,
    @Default('') String recoveryArrangedVia,
    @Default('') String recoveryReference,
    @Default('') String recoveryContact,
    @Default('') String recoveryNotes,
    // Key dates
    @Default('') String motDueDate,
    @Default('') String taxDueDate,
    // Status
    @Default(0) int currentMileage,
    @Default('') String notes,
    // DVLA lookup
    @Default(false) bool dvlaVerified,
    @Default('') String taxStatus,
    @Default('') String motStatus,
    // Photo
    @Default('') String photoPath,
  }) = _Vehicle;

  factory Vehicle.fromJson(Map<String, dynamic> json) =>
      _$VehicleFromJson(json);

  /// The user-typed description, or a computed one from make/variant/year.
  /// e.g. "Citroen 1.2 PureTech [130] C-Series Edition 5dr Auto 2022"
  String get displayDescription {
    if (description.isNotEmpty) return description;
    final parts = <String>[];
    if (make.isNotEmpty) parts.add(make);
    if (variant.isNotEmpty) {
      parts.add(variant);
    } else if (model.isNotEmpty) {
      parts.add(model);
    }
    if (year.isNotEmpty) parts.add(year);
    return parts.join(' ');
  }

  /// Short description e.g. "Citroen C4 Hatchback"
  String get shortDescription {
    final parts = <String>[];
    if (make.isNotEmpty) parts.add(make);
    if (model.isNotEmpty) parts.add(model);
    return parts.join(' ');
  }
}
