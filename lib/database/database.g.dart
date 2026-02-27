// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database.dart';

// ignore_for_file: type=lint
class $VehiclesTable extends Vehicles
    with TableInfo<$VehiclesTable, VehicleRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $VehiclesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _registrationMeta = const VerificationMeta(
    'registration',
  );
  @override
  late final GeneratedColumn<String> registration = GeneratedColumn<String>(
    'registration',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _makeMeta = const VerificationMeta('make');
  @override
  late final GeneratedColumn<String> make = GeneratedColumn<String>(
    'make',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _modelMeta = const VerificationMeta('model');
  @override
  late final GeneratedColumn<String> model = GeneratedColumn<String>(
    'model',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _yearMeta = const VerificationMeta('year');
  @override
  late final GeneratedColumn<String> year = GeneratedColumn<String>(
    'year',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _colourMeta = const VerificationMeta('colour');
  @override
  late final GeneratedColumn<String> colour = GeneratedColumn<String>(
    'colour',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _fuelTypeMeta = const VerificationMeta(
    'fuelType',
  );
  @override
  late final GeneratedColumn<String> fuelType = GeneratedColumn<String>(
    'fuel_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('petrol'),
  );
  static const VerificationMeta _transmissionMeta = const VerificationMeta(
    'transmission',
  );
  @override
  late final GeneratedColumn<String> transmission = GeneratedColumn<String>(
    'transmission',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _vinMeta = const VerificationMeta('vin');
  @override
  late final GeneratedColumn<String> vin = GeneratedColumn<String>(
    'vin',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _variantMeta = const VerificationMeta(
    'variant',
  );
  @override
  late final GeneratedColumn<String> variant = GeneratedColumn<String>(
    'variant',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _bodyTypeMeta = const VerificationMeta(
    'bodyType',
  );
  @override
  late final GeneratedColumn<String> bodyType = GeneratedColumn<String>(
    'body_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _engineCCMeta = const VerificationMeta(
    'engineCC',
  );
  @override
  late final GeneratedColumn<String> engineCC = GeneratedColumn<String>(
    'engine_c_c',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _engineNumberMeta = const VerificationMeta(
    'engineNumber',
  );
  @override
  late final GeneratedColumn<String> engineNumber = GeneratedColumn<String>(
    'engine_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _keyNumberMeta = const VerificationMeta(
    'keyNumber',
  );
  @override
  late final GeneratedColumn<String> keyNumber = GeneratedColumn<String>(
    'key_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _chassisNumberMeta = const VerificationMeta(
    'chassisNumber',
  );
  @override
  late final GeneratedColumn<String> chassisNumber = GeneratedColumn<String>(
    'chassis_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _radioCodeMeta = const VerificationMeta(
    'radioCode',
  );
  @override
  late final GeneratedColumn<String> radioCode = GeneratedColumn<String>(
    'radio_code',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _purchaseDateMeta = const VerificationMeta(
    'purchaseDate',
  );
  @override
  late final GeneratedColumn<String> purchaseDate = GeneratedColumn<String>(
    'purchase_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _purchasePriceMeta = const VerificationMeta(
    'purchasePrice',
  );
  @override
  late final GeneratedColumn<double> purchasePrice = GeneratedColumn<double>(
    'purchase_price',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _purchasedFromMeta = const VerificationMeta(
    'purchasedFrom',
  );
  @override
  late final GeneratedColumn<String> purchasedFrom = GeneratedColumn<String>(
    'purchased_from',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _ownershipMeta = const VerificationMeta(
    'ownership',
  );
  @override
  late final GeneratedColumn<String> ownership = GeneratedColumn<String>(
    'ownership',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _financeCompanyMeta = const VerificationMeta(
    'financeCompany',
  );
  @override
  late final GeneratedColumn<String> financeCompany = GeneratedColumn<String>(
    'finance_company',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _agreementNumberMeta = const VerificationMeta(
    'agreementNumber',
  );
  @override
  late final GeneratedColumn<String> agreementNumber = GeneratedColumn<String>(
    'agreement_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _depositMeta = const VerificationMeta(
    'deposit',
  );
  @override
  late final GeneratedColumn<double> deposit = GeneratedColumn<double>(
    'deposit',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _monthlyPaymentMeta = const VerificationMeta(
    'monthlyPayment',
  );
  @override
  late final GeneratedColumn<double> monthlyPayment = GeneratedColumn<double>(
    'monthly_payment',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _financeStartDateMeta = const VerificationMeta(
    'financeStartDate',
  );
  @override
  late final GeneratedColumn<String> financeStartDate = GeneratedColumn<String>(
    'finance_start_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _financeEndDateMeta = const VerificationMeta(
    'financeEndDate',
  );
  @override
  late final GeneratedColumn<String> financeEndDate = GeneratedColumn<String>(
    'finance_end_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _balloonPaymentMeta = const VerificationMeta(
    'balloonPayment',
  );
  @override
  late final GeneratedColumn<double> balloonPayment = GeneratedColumn<double>(
    'balloon_payment',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _annualMileageAllowanceMeta =
      const VerificationMeta('annualMileageAllowance');
  @override
  late final GeneratedColumn<int> annualMileageAllowance = GeneratedColumn<int>(
    'annual_mileage_allowance',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _numberOfPaymentsMeta = const VerificationMeta(
    'numberOfPayments',
  );
  @override
  late final GeneratedColumn<int> numberOfPayments = GeneratedColumn<int>(
    'number_of_payments',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _lessorMeta = const VerificationMeta('lessor');
  @override
  late final GeneratedColumn<String> lessor = GeneratedColumn<String>(
    'lessor',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _agreementHolderMeta = const VerificationMeta(
    'agreementHolder',
  );
  @override
  late final GeneratedColumn<String> agreementHolder = GeneratedColumn<String>(
    'agreement_holder',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _ownershipNotesMeta = const VerificationMeta(
    'ownershipNotes',
  );
  @override
  late final GeneratedColumn<String> ownershipNotes = GeneratedColumn<String>(
    'ownership_notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _insurerMeta = const VerificationMeta(
    'insurer',
  );
  @override
  late final GeneratedColumn<String> insurer = GeneratedColumn<String>(
    'insurer',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _insurancePolicyNumberMeta =
      const VerificationMeta('insurancePolicyNumber');
  @override
  late final GeneratedColumn<String> insurancePolicyNumber =
      GeneratedColumn<String>(
        'insurance_policy_number',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _insuranceRenewalDateMeta =
      const VerificationMeta('insuranceRenewalDate');
  @override
  late final GeneratedColumn<String> insuranceRenewalDate =
      GeneratedColumn<String>(
        'insurance_renewal_date',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _insuranceTypeMeta = const VerificationMeta(
    'insuranceType',
  );
  @override
  late final GeneratedColumn<String> insuranceType = GeneratedColumn<String>(
    'insurance_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _insuredDriversMeta = const VerificationMeta(
    'insuredDrivers',
  );
  @override
  late final GeneratedColumn<String> insuredDrivers = GeneratedColumn<String>(
    'insured_drivers',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _insuranceAnnualCostMeta =
      const VerificationMeta('insuranceAnnualCost');
  @override
  late final GeneratedColumn<double> insuranceAnnualCost =
      GeneratedColumn<double>(
        'insurance_annual_cost',
        aliasedName,
        false,
        type: DriftSqlType.double,
        requiredDuringInsert: false,
        defaultValue: const Constant(0),
      );
  static const VerificationMeta _breakdownProviderMeta = const VerificationMeta(
    'breakdownProvider',
  );
  @override
  late final GeneratedColumn<String> breakdownProvider =
      GeneratedColumn<String>(
        'breakdown_provider',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _breakdownMembershipNumberMeta =
      const VerificationMeta('breakdownMembershipNumber');
  @override
  late final GeneratedColumn<String> breakdownMembershipNumber =
      GeneratedColumn<String>(
        'breakdown_membership_number',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _breakdownContactMeta = const VerificationMeta(
    'breakdownContact',
  );
  @override
  late final GeneratedColumn<String> breakdownContact = GeneratedColumn<String>(
    'breakdown_contact',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _breakdownNotesMeta = const VerificationMeta(
    'breakdownNotes',
  );
  @override
  late final GeneratedColumn<String> breakdownNotes = GeneratedColumn<String>(
    'breakdown_notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _recoveryProviderMeta = const VerificationMeta(
    'recoveryProvider',
  );
  @override
  late final GeneratedColumn<String> recoveryProvider = GeneratedColumn<String>(
    'recovery_provider',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _recoveryArrangedViaMeta =
      const VerificationMeta('recoveryArrangedVia');
  @override
  late final GeneratedColumn<String> recoveryArrangedVia =
      GeneratedColumn<String>(
        'recovery_arranged_via',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _recoveryReferenceMeta = const VerificationMeta(
    'recoveryReference',
  );
  @override
  late final GeneratedColumn<String> recoveryReference =
      GeneratedColumn<String>(
        'recovery_reference',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _recoveryContactMeta = const VerificationMeta(
    'recoveryContact',
  );
  @override
  late final GeneratedColumn<String> recoveryContact = GeneratedColumn<String>(
    'recovery_contact',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _recoveryNotesMeta = const VerificationMeta(
    'recoveryNotes',
  );
  @override
  late final GeneratedColumn<String> recoveryNotes = GeneratedColumn<String>(
    'recovery_notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _motDueDateMeta = const VerificationMeta(
    'motDueDate',
  );
  @override
  late final GeneratedColumn<String> motDueDate = GeneratedColumn<String>(
    'mot_due_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _taxDueDateMeta = const VerificationMeta(
    'taxDueDate',
  );
  @override
  late final GeneratedColumn<String> taxDueDate = GeneratedColumn<String>(
    'tax_due_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _currentMileageMeta = const VerificationMeta(
    'currentMileage',
  );
  @override
  late final GeneratedColumn<int> currentMileage = GeneratedColumn<int>(
    'current_mileage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _dvlaVerifiedMeta = const VerificationMeta(
    'dvlaVerified',
  );
  @override
  late final GeneratedColumn<bool> dvlaVerified = GeneratedColumn<bool>(
    'dvla_verified',
    aliasedName,
    false,
    type: DriftSqlType.bool,
    requiredDuringInsert: false,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'CHECK ("dvla_verified" IN (0, 1))',
    ),
    defaultValue: const Constant(false),
  );
  static const VerificationMeta _taxStatusMeta = const VerificationMeta(
    'taxStatus',
  );
  @override
  late final GeneratedColumn<String> taxStatus = GeneratedColumn<String>(
    'tax_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _motStatusMeta = const VerificationMeta(
    'motStatus',
  );
  @override
  late final GeneratedColumn<String> motStatus = GeneratedColumn<String>(
    'mot_status',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    registration,
    make,
    model,
    year,
    colour,
    fuelType,
    transmission,
    vin,
    variant,
    bodyType,
    engineCC,
    engineNumber,
    keyNumber,
    chassisNumber,
    radioCode,
    description,
    purchaseDate,
    purchasePrice,
    purchasedFrom,
    ownership,
    financeCompany,
    agreementNumber,
    deposit,
    monthlyPayment,
    financeStartDate,
    financeEndDate,
    balloonPayment,
    annualMileageAllowance,
    numberOfPayments,
    lessor,
    agreementHolder,
    ownershipNotes,
    insurer,
    insurancePolicyNumber,
    insuranceRenewalDate,
    insuranceType,
    insuredDrivers,
    insuranceAnnualCost,
    breakdownProvider,
    breakdownMembershipNumber,
    breakdownContact,
    breakdownNotes,
    recoveryProvider,
    recoveryArrangedVia,
    recoveryReference,
    recoveryContact,
    recoveryNotes,
    motDueDate,
    taxDueDate,
    currentMileage,
    notes,
    dvlaVerified,
    taxStatus,
    motStatus,
    photoPath,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'vehicles';
  @override
  VerificationContext validateIntegrity(
    Insertable<VehicleRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('registration')) {
      context.handle(
        _registrationMeta,
        registration.isAcceptableOrUnknown(
          data['registration']!,
          _registrationMeta,
        ),
      );
    }
    if (data.containsKey('make')) {
      context.handle(
        _makeMeta,
        make.isAcceptableOrUnknown(data['make']!, _makeMeta),
      );
    }
    if (data.containsKey('model')) {
      context.handle(
        _modelMeta,
        model.isAcceptableOrUnknown(data['model']!, _modelMeta),
      );
    }
    if (data.containsKey('year')) {
      context.handle(
        _yearMeta,
        year.isAcceptableOrUnknown(data['year']!, _yearMeta),
      );
    }
    if (data.containsKey('colour')) {
      context.handle(
        _colourMeta,
        colour.isAcceptableOrUnknown(data['colour']!, _colourMeta),
      );
    }
    if (data.containsKey('fuel_type')) {
      context.handle(
        _fuelTypeMeta,
        fuelType.isAcceptableOrUnknown(data['fuel_type']!, _fuelTypeMeta),
      );
    }
    if (data.containsKey('transmission')) {
      context.handle(
        _transmissionMeta,
        transmission.isAcceptableOrUnknown(
          data['transmission']!,
          _transmissionMeta,
        ),
      );
    }
    if (data.containsKey('vin')) {
      context.handle(
        _vinMeta,
        vin.isAcceptableOrUnknown(data['vin']!, _vinMeta),
      );
    }
    if (data.containsKey('variant')) {
      context.handle(
        _variantMeta,
        variant.isAcceptableOrUnknown(data['variant']!, _variantMeta),
      );
    }
    if (data.containsKey('body_type')) {
      context.handle(
        _bodyTypeMeta,
        bodyType.isAcceptableOrUnknown(data['body_type']!, _bodyTypeMeta),
      );
    }
    if (data.containsKey('engine_c_c')) {
      context.handle(
        _engineCCMeta,
        engineCC.isAcceptableOrUnknown(data['engine_c_c']!, _engineCCMeta),
      );
    }
    if (data.containsKey('engine_number')) {
      context.handle(
        _engineNumberMeta,
        engineNumber.isAcceptableOrUnknown(
          data['engine_number']!,
          _engineNumberMeta,
        ),
      );
    }
    if (data.containsKey('key_number')) {
      context.handle(
        _keyNumberMeta,
        keyNumber.isAcceptableOrUnknown(data['key_number']!, _keyNumberMeta),
      );
    }
    if (data.containsKey('chassis_number')) {
      context.handle(
        _chassisNumberMeta,
        chassisNumber.isAcceptableOrUnknown(
          data['chassis_number']!,
          _chassisNumberMeta,
        ),
      );
    }
    if (data.containsKey('radio_code')) {
      context.handle(
        _radioCodeMeta,
        radioCode.isAcceptableOrUnknown(data['radio_code']!, _radioCodeMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('purchase_date')) {
      context.handle(
        _purchaseDateMeta,
        purchaseDate.isAcceptableOrUnknown(
          data['purchase_date']!,
          _purchaseDateMeta,
        ),
      );
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
        _purchasePriceMeta,
        purchasePrice.isAcceptableOrUnknown(
          data['purchase_price']!,
          _purchasePriceMeta,
        ),
      );
    }
    if (data.containsKey('purchased_from')) {
      context.handle(
        _purchasedFromMeta,
        purchasedFrom.isAcceptableOrUnknown(
          data['purchased_from']!,
          _purchasedFromMeta,
        ),
      );
    }
    if (data.containsKey('ownership')) {
      context.handle(
        _ownershipMeta,
        ownership.isAcceptableOrUnknown(data['ownership']!, _ownershipMeta),
      );
    }
    if (data.containsKey('finance_company')) {
      context.handle(
        _financeCompanyMeta,
        financeCompany.isAcceptableOrUnknown(
          data['finance_company']!,
          _financeCompanyMeta,
        ),
      );
    }
    if (data.containsKey('agreement_number')) {
      context.handle(
        _agreementNumberMeta,
        agreementNumber.isAcceptableOrUnknown(
          data['agreement_number']!,
          _agreementNumberMeta,
        ),
      );
    }
    if (data.containsKey('deposit')) {
      context.handle(
        _depositMeta,
        deposit.isAcceptableOrUnknown(data['deposit']!, _depositMeta),
      );
    }
    if (data.containsKey('monthly_payment')) {
      context.handle(
        _monthlyPaymentMeta,
        monthlyPayment.isAcceptableOrUnknown(
          data['monthly_payment']!,
          _monthlyPaymentMeta,
        ),
      );
    }
    if (data.containsKey('finance_start_date')) {
      context.handle(
        _financeStartDateMeta,
        financeStartDate.isAcceptableOrUnknown(
          data['finance_start_date']!,
          _financeStartDateMeta,
        ),
      );
    }
    if (data.containsKey('finance_end_date')) {
      context.handle(
        _financeEndDateMeta,
        financeEndDate.isAcceptableOrUnknown(
          data['finance_end_date']!,
          _financeEndDateMeta,
        ),
      );
    }
    if (data.containsKey('balloon_payment')) {
      context.handle(
        _balloonPaymentMeta,
        balloonPayment.isAcceptableOrUnknown(
          data['balloon_payment']!,
          _balloonPaymentMeta,
        ),
      );
    }
    if (data.containsKey('annual_mileage_allowance')) {
      context.handle(
        _annualMileageAllowanceMeta,
        annualMileageAllowance.isAcceptableOrUnknown(
          data['annual_mileage_allowance']!,
          _annualMileageAllowanceMeta,
        ),
      );
    }
    if (data.containsKey('number_of_payments')) {
      context.handle(
        _numberOfPaymentsMeta,
        numberOfPayments.isAcceptableOrUnknown(
          data['number_of_payments']!,
          _numberOfPaymentsMeta,
        ),
      );
    }
    if (data.containsKey('lessor')) {
      context.handle(
        _lessorMeta,
        lessor.isAcceptableOrUnknown(data['lessor']!, _lessorMeta),
      );
    }
    if (data.containsKey('agreement_holder')) {
      context.handle(
        _agreementHolderMeta,
        agreementHolder.isAcceptableOrUnknown(
          data['agreement_holder']!,
          _agreementHolderMeta,
        ),
      );
    }
    if (data.containsKey('ownership_notes')) {
      context.handle(
        _ownershipNotesMeta,
        ownershipNotes.isAcceptableOrUnknown(
          data['ownership_notes']!,
          _ownershipNotesMeta,
        ),
      );
    }
    if (data.containsKey('insurer')) {
      context.handle(
        _insurerMeta,
        insurer.isAcceptableOrUnknown(data['insurer']!, _insurerMeta),
      );
    }
    if (data.containsKey('insurance_policy_number')) {
      context.handle(
        _insurancePolicyNumberMeta,
        insurancePolicyNumber.isAcceptableOrUnknown(
          data['insurance_policy_number']!,
          _insurancePolicyNumberMeta,
        ),
      );
    }
    if (data.containsKey('insurance_renewal_date')) {
      context.handle(
        _insuranceRenewalDateMeta,
        insuranceRenewalDate.isAcceptableOrUnknown(
          data['insurance_renewal_date']!,
          _insuranceRenewalDateMeta,
        ),
      );
    }
    if (data.containsKey('insurance_type')) {
      context.handle(
        _insuranceTypeMeta,
        insuranceType.isAcceptableOrUnknown(
          data['insurance_type']!,
          _insuranceTypeMeta,
        ),
      );
    }
    if (data.containsKey('insured_drivers')) {
      context.handle(
        _insuredDriversMeta,
        insuredDrivers.isAcceptableOrUnknown(
          data['insured_drivers']!,
          _insuredDriversMeta,
        ),
      );
    }
    if (data.containsKey('insurance_annual_cost')) {
      context.handle(
        _insuranceAnnualCostMeta,
        insuranceAnnualCost.isAcceptableOrUnknown(
          data['insurance_annual_cost']!,
          _insuranceAnnualCostMeta,
        ),
      );
    }
    if (data.containsKey('breakdown_provider')) {
      context.handle(
        _breakdownProviderMeta,
        breakdownProvider.isAcceptableOrUnknown(
          data['breakdown_provider']!,
          _breakdownProviderMeta,
        ),
      );
    }
    if (data.containsKey('breakdown_membership_number')) {
      context.handle(
        _breakdownMembershipNumberMeta,
        breakdownMembershipNumber.isAcceptableOrUnknown(
          data['breakdown_membership_number']!,
          _breakdownMembershipNumberMeta,
        ),
      );
    }
    if (data.containsKey('breakdown_contact')) {
      context.handle(
        _breakdownContactMeta,
        breakdownContact.isAcceptableOrUnknown(
          data['breakdown_contact']!,
          _breakdownContactMeta,
        ),
      );
    }
    if (data.containsKey('breakdown_notes')) {
      context.handle(
        _breakdownNotesMeta,
        breakdownNotes.isAcceptableOrUnknown(
          data['breakdown_notes']!,
          _breakdownNotesMeta,
        ),
      );
    }
    if (data.containsKey('recovery_provider')) {
      context.handle(
        _recoveryProviderMeta,
        recoveryProvider.isAcceptableOrUnknown(
          data['recovery_provider']!,
          _recoveryProviderMeta,
        ),
      );
    }
    if (data.containsKey('recovery_arranged_via')) {
      context.handle(
        _recoveryArrangedViaMeta,
        recoveryArrangedVia.isAcceptableOrUnknown(
          data['recovery_arranged_via']!,
          _recoveryArrangedViaMeta,
        ),
      );
    }
    if (data.containsKey('recovery_reference')) {
      context.handle(
        _recoveryReferenceMeta,
        recoveryReference.isAcceptableOrUnknown(
          data['recovery_reference']!,
          _recoveryReferenceMeta,
        ),
      );
    }
    if (data.containsKey('recovery_contact')) {
      context.handle(
        _recoveryContactMeta,
        recoveryContact.isAcceptableOrUnknown(
          data['recovery_contact']!,
          _recoveryContactMeta,
        ),
      );
    }
    if (data.containsKey('recovery_notes')) {
      context.handle(
        _recoveryNotesMeta,
        recoveryNotes.isAcceptableOrUnknown(
          data['recovery_notes']!,
          _recoveryNotesMeta,
        ),
      );
    }
    if (data.containsKey('mot_due_date')) {
      context.handle(
        _motDueDateMeta,
        motDueDate.isAcceptableOrUnknown(
          data['mot_due_date']!,
          _motDueDateMeta,
        ),
      );
    }
    if (data.containsKey('tax_due_date')) {
      context.handle(
        _taxDueDateMeta,
        taxDueDate.isAcceptableOrUnknown(
          data['tax_due_date']!,
          _taxDueDateMeta,
        ),
      );
    }
    if (data.containsKey('current_mileage')) {
      context.handle(
        _currentMileageMeta,
        currentMileage.isAcceptableOrUnknown(
          data['current_mileage']!,
          _currentMileageMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    if (data.containsKey('dvla_verified')) {
      context.handle(
        _dvlaVerifiedMeta,
        dvlaVerified.isAcceptableOrUnknown(
          data['dvla_verified']!,
          _dvlaVerifiedMeta,
        ),
      );
    }
    if (data.containsKey('tax_status')) {
      context.handle(
        _taxStatusMeta,
        taxStatus.isAcceptableOrUnknown(data['tax_status']!, _taxStatusMeta),
      );
    }
    if (data.containsKey('mot_status')) {
      context.handle(
        _motStatusMeta,
        motStatus.isAcceptableOrUnknown(data['mot_status']!, _motStatusMeta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  VehicleRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return VehicleRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      registration: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}registration'],
      )!,
      make: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}make'],
      )!,
      model: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}model'],
      )!,
      year: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}year'],
      )!,
      colour: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}colour'],
      )!,
      fuelType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}fuel_type'],
      )!,
      transmission: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}transmission'],
      )!,
      vin: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vin'],
      )!,
      variant: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}variant'],
      )!,
      bodyType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}body_type'],
      )!,
      engineCC: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}engine_c_c'],
      )!,
      engineNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}engine_number'],
      )!,
      keyNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key_number'],
      )!,
      chassisNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}chassis_number'],
      )!,
      radioCode: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}radio_code'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      purchaseDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchase_date'],
      )!,
      purchasePrice: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}purchase_price'],
      )!,
      purchasedFrom: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}purchased_from'],
      )!,
      ownership: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ownership'],
      )!,
      financeCompany: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}finance_company'],
      )!,
      agreementNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}agreement_number'],
      )!,
      deposit: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}deposit'],
      )!,
      monthlyPayment: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}monthly_payment'],
      )!,
      financeStartDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}finance_start_date'],
      )!,
      financeEndDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}finance_end_date'],
      )!,
      balloonPayment: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}balloon_payment'],
      )!,
      annualMileageAllowance: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}annual_mileage_allowance'],
      )!,
      numberOfPayments: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}number_of_payments'],
      )!,
      lessor: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}lessor'],
      )!,
      agreementHolder: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}agreement_holder'],
      )!,
      ownershipNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}ownership_notes'],
      )!,
      insurer: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}insurer'],
      )!,
      insurancePolicyNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}insurance_policy_number'],
      )!,
      insuranceRenewalDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}insurance_renewal_date'],
      )!,
      insuranceType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}insurance_type'],
      )!,
      insuredDrivers: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}insured_drivers'],
      )!,
      insuranceAnnualCost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}insurance_annual_cost'],
      )!,
      breakdownProvider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breakdown_provider'],
      )!,
      breakdownMembershipNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breakdown_membership_number'],
      )!,
      breakdownContact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breakdown_contact'],
      )!,
      breakdownNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}breakdown_notes'],
      )!,
      recoveryProvider: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recovery_provider'],
      )!,
      recoveryArrangedVia: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recovery_arranged_via'],
      )!,
      recoveryReference: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recovery_reference'],
      )!,
      recoveryContact: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recovery_contact'],
      )!,
      recoveryNotes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}recovery_notes'],
      )!,
      motDueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mot_due_date'],
      )!,
      taxDueDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_due_date'],
      )!,
      currentMileage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}current_mileage'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
      dvlaVerified: attachedDatabase.typeMapping.read(
        DriftSqlType.bool,
        data['${effectivePrefix}dvla_verified'],
      )!,
      taxStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}tax_status'],
      )!,
      motStatus: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}mot_status'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      )!,
    );
  }

  @override
  $VehiclesTable createAlias(String alias) {
    return $VehiclesTable(attachedDatabase, alias);
  }
}

class VehicleRow extends DataClass implements Insertable<VehicleRow> {
  final String id;
  final String registration;
  final String make;
  final String model;
  final String year;
  final String colour;
  final String fuelType;
  final String transmission;
  final String vin;
  final String variant;
  final String bodyType;
  final String engineCC;
  final String engineNumber;
  final String keyNumber;
  final String chassisNumber;
  final String radioCode;
  final String description;
  final String purchaseDate;
  final double purchasePrice;
  final String purchasedFrom;
  final String ownership;
  final String financeCompany;
  final String agreementNumber;
  final double deposit;
  final double monthlyPayment;
  final String financeStartDate;
  final String financeEndDate;
  final double balloonPayment;
  final int annualMileageAllowance;
  final int numberOfPayments;
  final String lessor;
  final String agreementHolder;
  final String ownershipNotes;
  final String insurer;
  final String insurancePolicyNumber;
  final String insuranceRenewalDate;
  final String insuranceType;
  final String insuredDrivers;
  final double insuranceAnnualCost;
  final String breakdownProvider;
  final String breakdownMembershipNumber;
  final String breakdownContact;
  final String breakdownNotes;
  final String recoveryProvider;
  final String recoveryArrangedVia;
  final String recoveryReference;
  final String recoveryContact;
  final String recoveryNotes;
  final String motDueDate;
  final String taxDueDate;
  final int currentMileage;
  final String notes;
  final bool dvlaVerified;
  final String taxStatus;
  final String motStatus;
  final String photoPath;
  const VehicleRow({
    required this.id,
    required this.registration,
    required this.make,
    required this.model,
    required this.year,
    required this.colour,
    required this.fuelType,
    required this.transmission,
    required this.vin,
    required this.variant,
    required this.bodyType,
    required this.engineCC,
    required this.engineNumber,
    required this.keyNumber,
    required this.chassisNumber,
    required this.radioCode,
    required this.description,
    required this.purchaseDate,
    required this.purchasePrice,
    required this.purchasedFrom,
    required this.ownership,
    required this.financeCompany,
    required this.agreementNumber,
    required this.deposit,
    required this.monthlyPayment,
    required this.financeStartDate,
    required this.financeEndDate,
    required this.balloonPayment,
    required this.annualMileageAllowance,
    required this.numberOfPayments,
    required this.lessor,
    required this.agreementHolder,
    required this.ownershipNotes,
    required this.insurer,
    required this.insurancePolicyNumber,
    required this.insuranceRenewalDate,
    required this.insuranceType,
    required this.insuredDrivers,
    required this.insuranceAnnualCost,
    required this.breakdownProvider,
    required this.breakdownMembershipNumber,
    required this.breakdownContact,
    required this.breakdownNotes,
    required this.recoveryProvider,
    required this.recoveryArrangedVia,
    required this.recoveryReference,
    required this.recoveryContact,
    required this.recoveryNotes,
    required this.motDueDate,
    required this.taxDueDate,
    required this.currentMileage,
    required this.notes,
    required this.dvlaVerified,
    required this.taxStatus,
    required this.motStatus,
    required this.photoPath,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['registration'] = Variable<String>(registration);
    map['make'] = Variable<String>(make);
    map['model'] = Variable<String>(model);
    map['year'] = Variable<String>(year);
    map['colour'] = Variable<String>(colour);
    map['fuel_type'] = Variable<String>(fuelType);
    map['transmission'] = Variable<String>(transmission);
    map['vin'] = Variable<String>(vin);
    map['variant'] = Variable<String>(variant);
    map['body_type'] = Variable<String>(bodyType);
    map['engine_c_c'] = Variable<String>(engineCC);
    map['engine_number'] = Variable<String>(engineNumber);
    map['key_number'] = Variable<String>(keyNumber);
    map['chassis_number'] = Variable<String>(chassisNumber);
    map['radio_code'] = Variable<String>(radioCode);
    map['description'] = Variable<String>(description);
    map['purchase_date'] = Variable<String>(purchaseDate);
    map['purchase_price'] = Variable<double>(purchasePrice);
    map['purchased_from'] = Variable<String>(purchasedFrom);
    map['ownership'] = Variable<String>(ownership);
    map['finance_company'] = Variable<String>(financeCompany);
    map['agreement_number'] = Variable<String>(agreementNumber);
    map['deposit'] = Variable<double>(deposit);
    map['monthly_payment'] = Variable<double>(monthlyPayment);
    map['finance_start_date'] = Variable<String>(financeStartDate);
    map['finance_end_date'] = Variable<String>(financeEndDate);
    map['balloon_payment'] = Variable<double>(balloonPayment);
    map['annual_mileage_allowance'] = Variable<int>(annualMileageAllowance);
    map['number_of_payments'] = Variable<int>(numberOfPayments);
    map['lessor'] = Variable<String>(lessor);
    map['agreement_holder'] = Variable<String>(agreementHolder);
    map['ownership_notes'] = Variable<String>(ownershipNotes);
    map['insurer'] = Variable<String>(insurer);
    map['insurance_policy_number'] = Variable<String>(insurancePolicyNumber);
    map['insurance_renewal_date'] = Variable<String>(insuranceRenewalDate);
    map['insurance_type'] = Variable<String>(insuranceType);
    map['insured_drivers'] = Variable<String>(insuredDrivers);
    map['insurance_annual_cost'] = Variable<double>(insuranceAnnualCost);
    map['breakdown_provider'] = Variable<String>(breakdownProvider);
    map['breakdown_membership_number'] = Variable<String>(
      breakdownMembershipNumber,
    );
    map['breakdown_contact'] = Variable<String>(breakdownContact);
    map['breakdown_notes'] = Variable<String>(breakdownNotes);
    map['recovery_provider'] = Variable<String>(recoveryProvider);
    map['recovery_arranged_via'] = Variable<String>(recoveryArrangedVia);
    map['recovery_reference'] = Variable<String>(recoveryReference);
    map['recovery_contact'] = Variable<String>(recoveryContact);
    map['recovery_notes'] = Variable<String>(recoveryNotes);
    map['mot_due_date'] = Variable<String>(motDueDate);
    map['tax_due_date'] = Variable<String>(taxDueDate);
    map['current_mileage'] = Variable<int>(currentMileage);
    map['notes'] = Variable<String>(notes);
    map['dvla_verified'] = Variable<bool>(dvlaVerified);
    map['tax_status'] = Variable<String>(taxStatus);
    map['mot_status'] = Variable<String>(motStatus);
    map['photo_path'] = Variable<String>(photoPath);
    return map;
  }

  VehiclesCompanion toCompanion(bool nullToAbsent) {
    return VehiclesCompanion(
      id: Value(id),
      registration: Value(registration),
      make: Value(make),
      model: Value(model),
      year: Value(year),
      colour: Value(colour),
      fuelType: Value(fuelType),
      transmission: Value(transmission),
      vin: Value(vin),
      variant: Value(variant),
      bodyType: Value(bodyType),
      engineCC: Value(engineCC),
      engineNumber: Value(engineNumber),
      keyNumber: Value(keyNumber),
      chassisNumber: Value(chassisNumber),
      radioCode: Value(radioCode),
      description: Value(description),
      purchaseDate: Value(purchaseDate),
      purchasePrice: Value(purchasePrice),
      purchasedFrom: Value(purchasedFrom),
      ownership: Value(ownership),
      financeCompany: Value(financeCompany),
      agreementNumber: Value(agreementNumber),
      deposit: Value(deposit),
      monthlyPayment: Value(monthlyPayment),
      financeStartDate: Value(financeStartDate),
      financeEndDate: Value(financeEndDate),
      balloonPayment: Value(balloonPayment),
      annualMileageAllowance: Value(annualMileageAllowance),
      numberOfPayments: Value(numberOfPayments),
      lessor: Value(lessor),
      agreementHolder: Value(agreementHolder),
      ownershipNotes: Value(ownershipNotes),
      insurer: Value(insurer),
      insurancePolicyNumber: Value(insurancePolicyNumber),
      insuranceRenewalDate: Value(insuranceRenewalDate),
      insuranceType: Value(insuranceType),
      insuredDrivers: Value(insuredDrivers),
      insuranceAnnualCost: Value(insuranceAnnualCost),
      breakdownProvider: Value(breakdownProvider),
      breakdownMembershipNumber: Value(breakdownMembershipNumber),
      breakdownContact: Value(breakdownContact),
      breakdownNotes: Value(breakdownNotes),
      recoveryProvider: Value(recoveryProvider),
      recoveryArrangedVia: Value(recoveryArrangedVia),
      recoveryReference: Value(recoveryReference),
      recoveryContact: Value(recoveryContact),
      recoveryNotes: Value(recoveryNotes),
      motDueDate: Value(motDueDate),
      taxDueDate: Value(taxDueDate),
      currentMileage: Value(currentMileage),
      notes: Value(notes),
      dvlaVerified: Value(dvlaVerified),
      taxStatus: Value(taxStatus),
      motStatus: Value(motStatus),
      photoPath: Value(photoPath),
    );
  }

  factory VehicleRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return VehicleRow(
      id: serializer.fromJson<String>(json['id']),
      registration: serializer.fromJson<String>(json['registration']),
      make: serializer.fromJson<String>(json['make']),
      model: serializer.fromJson<String>(json['model']),
      year: serializer.fromJson<String>(json['year']),
      colour: serializer.fromJson<String>(json['colour']),
      fuelType: serializer.fromJson<String>(json['fuelType']),
      transmission: serializer.fromJson<String>(json['transmission']),
      vin: serializer.fromJson<String>(json['vin']),
      variant: serializer.fromJson<String>(json['variant']),
      bodyType: serializer.fromJson<String>(json['bodyType']),
      engineCC: serializer.fromJson<String>(json['engineCC']),
      engineNumber: serializer.fromJson<String>(json['engineNumber']),
      keyNumber: serializer.fromJson<String>(json['keyNumber']),
      chassisNumber: serializer.fromJson<String>(json['chassisNumber']),
      radioCode: serializer.fromJson<String>(json['radioCode']),
      description: serializer.fromJson<String>(json['description']),
      purchaseDate: serializer.fromJson<String>(json['purchaseDate']),
      purchasePrice: serializer.fromJson<double>(json['purchasePrice']),
      purchasedFrom: serializer.fromJson<String>(json['purchasedFrom']),
      ownership: serializer.fromJson<String>(json['ownership']),
      financeCompany: serializer.fromJson<String>(json['financeCompany']),
      agreementNumber: serializer.fromJson<String>(json['agreementNumber']),
      deposit: serializer.fromJson<double>(json['deposit']),
      monthlyPayment: serializer.fromJson<double>(json['monthlyPayment']),
      financeStartDate: serializer.fromJson<String>(json['financeStartDate']),
      financeEndDate: serializer.fromJson<String>(json['financeEndDate']),
      balloonPayment: serializer.fromJson<double>(json['balloonPayment']),
      annualMileageAllowance: serializer.fromJson<int>(
        json['annualMileageAllowance'],
      ),
      numberOfPayments: serializer.fromJson<int>(json['numberOfPayments']),
      lessor: serializer.fromJson<String>(json['lessor']),
      agreementHolder: serializer.fromJson<String>(json['agreementHolder']),
      ownershipNotes: serializer.fromJson<String>(json['ownershipNotes']),
      insurer: serializer.fromJson<String>(json['insurer']),
      insurancePolicyNumber: serializer.fromJson<String>(
        json['insurancePolicyNumber'],
      ),
      insuranceRenewalDate: serializer.fromJson<String>(
        json['insuranceRenewalDate'],
      ),
      insuranceType: serializer.fromJson<String>(json['insuranceType']),
      insuredDrivers: serializer.fromJson<String>(json['insuredDrivers']),
      insuranceAnnualCost: serializer.fromJson<double>(
        json['insuranceAnnualCost'],
      ),
      breakdownProvider: serializer.fromJson<String>(json['breakdownProvider']),
      breakdownMembershipNumber: serializer.fromJson<String>(
        json['breakdownMembershipNumber'],
      ),
      breakdownContact: serializer.fromJson<String>(json['breakdownContact']),
      breakdownNotes: serializer.fromJson<String>(json['breakdownNotes']),
      recoveryProvider: serializer.fromJson<String>(json['recoveryProvider']),
      recoveryArrangedVia: serializer.fromJson<String>(
        json['recoveryArrangedVia'],
      ),
      recoveryReference: serializer.fromJson<String>(json['recoveryReference']),
      recoveryContact: serializer.fromJson<String>(json['recoveryContact']),
      recoveryNotes: serializer.fromJson<String>(json['recoveryNotes']),
      motDueDate: serializer.fromJson<String>(json['motDueDate']),
      taxDueDate: serializer.fromJson<String>(json['taxDueDate']),
      currentMileage: serializer.fromJson<int>(json['currentMileage']),
      notes: serializer.fromJson<String>(json['notes']),
      dvlaVerified: serializer.fromJson<bool>(json['dvlaVerified']),
      taxStatus: serializer.fromJson<String>(json['taxStatus']),
      motStatus: serializer.fromJson<String>(json['motStatus']),
      photoPath: serializer.fromJson<String>(json['photoPath']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'registration': serializer.toJson<String>(registration),
      'make': serializer.toJson<String>(make),
      'model': serializer.toJson<String>(model),
      'year': serializer.toJson<String>(year),
      'colour': serializer.toJson<String>(colour),
      'fuelType': serializer.toJson<String>(fuelType),
      'transmission': serializer.toJson<String>(transmission),
      'vin': serializer.toJson<String>(vin),
      'variant': serializer.toJson<String>(variant),
      'bodyType': serializer.toJson<String>(bodyType),
      'engineCC': serializer.toJson<String>(engineCC),
      'engineNumber': serializer.toJson<String>(engineNumber),
      'keyNumber': serializer.toJson<String>(keyNumber),
      'chassisNumber': serializer.toJson<String>(chassisNumber),
      'radioCode': serializer.toJson<String>(radioCode),
      'description': serializer.toJson<String>(description),
      'purchaseDate': serializer.toJson<String>(purchaseDate),
      'purchasePrice': serializer.toJson<double>(purchasePrice),
      'purchasedFrom': serializer.toJson<String>(purchasedFrom),
      'ownership': serializer.toJson<String>(ownership),
      'financeCompany': serializer.toJson<String>(financeCompany),
      'agreementNumber': serializer.toJson<String>(agreementNumber),
      'deposit': serializer.toJson<double>(deposit),
      'monthlyPayment': serializer.toJson<double>(monthlyPayment),
      'financeStartDate': serializer.toJson<String>(financeStartDate),
      'financeEndDate': serializer.toJson<String>(financeEndDate),
      'balloonPayment': serializer.toJson<double>(balloonPayment),
      'annualMileageAllowance': serializer.toJson<int>(annualMileageAllowance),
      'numberOfPayments': serializer.toJson<int>(numberOfPayments),
      'lessor': serializer.toJson<String>(lessor),
      'agreementHolder': serializer.toJson<String>(agreementHolder),
      'ownershipNotes': serializer.toJson<String>(ownershipNotes),
      'insurer': serializer.toJson<String>(insurer),
      'insurancePolicyNumber': serializer.toJson<String>(insurancePolicyNumber),
      'insuranceRenewalDate': serializer.toJson<String>(insuranceRenewalDate),
      'insuranceType': serializer.toJson<String>(insuranceType),
      'insuredDrivers': serializer.toJson<String>(insuredDrivers),
      'insuranceAnnualCost': serializer.toJson<double>(insuranceAnnualCost),
      'breakdownProvider': serializer.toJson<String>(breakdownProvider),
      'breakdownMembershipNumber': serializer.toJson<String>(
        breakdownMembershipNumber,
      ),
      'breakdownContact': serializer.toJson<String>(breakdownContact),
      'breakdownNotes': serializer.toJson<String>(breakdownNotes),
      'recoveryProvider': serializer.toJson<String>(recoveryProvider),
      'recoveryArrangedVia': serializer.toJson<String>(recoveryArrangedVia),
      'recoveryReference': serializer.toJson<String>(recoveryReference),
      'recoveryContact': serializer.toJson<String>(recoveryContact),
      'recoveryNotes': serializer.toJson<String>(recoveryNotes),
      'motDueDate': serializer.toJson<String>(motDueDate),
      'taxDueDate': serializer.toJson<String>(taxDueDate),
      'currentMileage': serializer.toJson<int>(currentMileage),
      'notes': serializer.toJson<String>(notes),
      'dvlaVerified': serializer.toJson<bool>(dvlaVerified),
      'taxStatus': serializer.toJson<String>(taxStatus),
      'motStatus': serializer.toJson<String>(motStatus),
      'photoPath': serializer.toJson<String>(photoPath),
    };
  }

  VehicleRow copyWith({
    String? id,
    String? registration,
    String? make,
    String? model,
    String? year,
    String? colour,
    String? fuelType,
    String? transmission,
    String? vin,
    String? variant,
    String? bodyType,
    String? engineCC,
    String? engineNumber,
    String? keyNumber,
    String? chassisNumber,
    String? radioCode,
    String? description,
    String? purchaseDate,
    double? purchasePrice,
    String? purchasedFrom,
    String? ownership,
    String? financeCompany,
    String? agreementNumber,
    double? deposit,
    double? monthlyPayment,
    String? financeStartDate,
    String? financeEndDate,
    double? balloonPayment,
    int? annualMileageAllowance,
    int? numberOfPayments,
    String? lessor,
    String? agreementHolder,
    String? ownershipNotes,
    String? insurer,
    String? insurancePolicyNumber,
    String? insuranceRenewalDate,
    String? insuranceType,
    String? insuredDrivers,
    double? insuranceAnnualCost,
    String? breakdownProvider,
    String? breakdownMembershipNumber,
    String? breakdownContact,
    String? breakdownNotes,
    String? recoveryProvider,
    String? recoveryArrangedVia,
    String? recoveryReference,
    String? recoveryContact,
    String? recoveryNotes,
    String? motDueDate,
    String? taxDueDate,
    int? currentMileage,
    String? notes,
    bool? dvlaVerified,
    String? taxStatus,
    String? motStatus,
    String? photoPath,
  }) => VehicleRow(
    id: id ?? this.id,
    registration: registration ?? this.registration,
    make: make ?? this.make,
    model: model ?? this.model,
    year: year ?? this.year,
    colour: colour ?? this.colour,
    fuelType: fuelType ?? this.fuelType,
    transmission: transmission ?? this.transmission,
    vin: vin ?? this.vin,
    variant: variant ?? this.variant,
    bodyType: bodyType ?? this.bodyType,
    engineCC: engineCC ?? this.engineCC,
    engineNumber: engineNumber ?? this.engineNumber,
    keyNumber: keyNumber ?? this.keyNumber,
    chassisNumber: chassisNumber ?? this.chassisNumber,
    radioCode: radioCode ?? this.radioCode,
    description: description ?? this.description,
    purchaseDate: purchaseDate ?? this.purchaseDate,
    purchasePrice: purchasePrice ?? this.purchasePrice,
    purchasedFrom: purchasedFrom ?? this.purchasedFrom,
    ownership: ownership ?? this.ownership,
    financeCompany: financeCompany ?? this.financeCompany,
    agreementNumber: agreementNumber ?? this.agreementNumber,
    deposit: deposit ?? this.deposit,
    monthlyPayment: monthlyPayment ?? this.monthlyPayment,
    financeStartDate: financeStartDate ?? this.financeStartDate,
    financeEndDate: financeEndDate ?? this.financeEndDate,
    balloonPayment: balloonPayment ?? this.balloonPayment,
    annualMileageAllowance:
        annualMileageAllowance ?? this.annualMileageAllowance,
    numberOfPayments: numberOfPayments ?? this.numberOfPayments,
    lessor: lessor ?? this.lessor,
    agreementHolder: agreementHolder ?? this.agreementHolder,
    ownershipNotes: ownershipNotes ?? this.ownershipNotes,
    insurer: insurer ?? this.insurer,
    insurancePolicyNumber: insurancePolicyNumber ?? this.insurancePolicyNumber,
    insuranceRenewalDate: insuranceRenewalDate ?? this.insuranceRenewalDate,
    insuranceType: insuranceType ?? this.insuranceType,
    insuredDrivers: insuredDrivers ?? this.insuredDrivers,
    insuranceAnnualCost: insuranceAnnualCost ?? this.insuranceAnnualCost,
    breakdownProvider: breakdownProvider ?? this.breakdownProvider,
    breakdownMembershipNumber:
        breakdownMembershipNumber ?? this.breakdownMembershipNumber,
    breakdownContact: breakdownContact ?? this.breakdownContact,
    breakdownNotes: breakdownNotes ?? this.breakdownNotes,
    recoveryProvider: recoveryProvider ?? this.recoveryProvider,
    recoveryArrangedVia: recoveryArrangedVia ?? this.recoveryArrangedVia,
    recoveryReference: recoveryReference ?? this.recoveryReference,
    recoveryContact: recoveryContact ?? this.recoveryContact,
    recoveryNotes: recoveryNotes ?? this.recoveryNotes,
    motDueDate: motDueDate ?? this.motDueDate,
    taxDueDate: taxDueDate ?? this.taxDueDate,
    currentMileage: currentMileage ?? this.currentMileage,
    notes: notes ?? this.notes,
    dvlaVerified: dvlaVerified ?? this.dvlaVerified,
    taxStatus: taxStatus ?? this.taxStatus,
    motStatus: motStatus ?? this.motStatus,
    photoPath: photoPath ?? this.photoPath,
  );
  VehicleRow copyWithCompanion(VehiclesCompanion data) {
    return VehicleRow(
      id: data.id.present ? data.id.value : this.id,
      registration: data.registration.present
          ? data.registration.value
          : this.registration,
      make: data.make.present ? data.make.value : this.make,
      model: data.model.present ? data.model.value : this.model,
      year: data.year.present ? data.year.value : this.year,
      colour: data.colour.present ? data.colour.value : this.colour,
      fuelType: data.fuelType.present ? data.fuelType.value : this.fuelType,
      transmission: data.transmission.present
          ? data.transmission.value
          : this.transmission,
      vin: data.vin.present ? data.vin.value : this.vin,
      variant: data.variant.present ? data.variant.value : this.variant,
      bodyType: data.bodyType.present ? data.bodyType.value : this.bodyType,
      engineCC: data.engineCC.present ? data.engineCC.value : this.engineCC,
      engineNumber: data.engineNumber.present
          ? data.engineNumber.value
          : this.engineNumber,
      keyNumber: data.keyNumber.present ? data.keyNumber.value : this.keyNumber,
      chassisNumber: data.chassisNumber.present
          ? data.chassisNumber.value
          : this.chassisNumber,
      radioCode: data.radioCode.present ? data.radioCode.value : this.radioCode,
      description: data.description.present
          ? data.description.value
          : this.description,
      purchaseDate: data.purchaseDate.present
          ? data.purchaseDate.value
          : this.purchaseDate,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      purchasedFrom: data.purchasedFrom.present
          ? data.purchasedFrom.value
          : this.purchasedFrom,
      ownership: data.ownership.present ? data.ownership.value : this.ownership,
      financeCompany: data.financeCompany.present
          ? data.financeCompany.value
          : this.financeCompany,
      agreementNumber: data.agreementNumber.present
          ? data.agreementNumber.value
          : this.agreementNumber,
      deposit: data.deposit.present ? data.deposit.value : this.deposit,
      monthlyPayment: data.monthlyPayment.present
          ? data.monthlyPayment.value
          : this.monthlyPayment,
      financeStartDate: data.financeStartDate.present
          ? data.financeStartDate.value
          : this.financeStartDate,
      financeEndDate: data.financeEndDate.present
          ? data.financeEndDate.value
          : this.financeEndDate,
      balloonPayment: data.balloonPayment.present
          ? data.balloonPayment.value
          : this.balloonPayment,
      annualMileageAllowance: data.annualMileageAllowance.present
          ? data.annualMileageAllowance.value
          : this.annualMileageAllowance,
      numberOfPayments: data.numberOfPayments.present
          ? data.numberOfPayments.value
          : this.numberOfPayments,
      lessor: data.lessor.present ? data.lessor.value : this.lessor,
      agreementHolder: data.agreementHolder.present
          ? data.agreementHolder.value
          : this.agreementHolder,
      ownershipNotes: data.ownershipNotes.present
          ? data.ownershipNotes.value
          : this.ownershipNotes,
      insurer: data.insurer.present ? data.insurer.value : this.insurer,
      insurancePolicyNumber: data.insurancePolicyNumber.present
          ? data.insurancePolicyNumber.value
          : this.insurancePolicyNumber,
      insuranceRenewalDate: data.insuranceRenewalDate.present
          ? data.insuranceRenewalDate.value
          : this.insuranceRenewalDate,
      insuranceType: data.insuranceType.present
          ? data.insuranceType.value
          : this.insuranceType,
      insuredDrivers: data.insuredDrivers.present
          ? data.insuredDrivers.value
          : this.insuredDrivers,
      insuranceAnnualCost: data.insuranceAnnualCost.present
          ? data.insuranceAnnualCost.value
          : this.insuranceAnnualCost,
      breakdownProvider: data.breakdownProvider.present
          ? data.breakdownProvider.value
          : this.breakdownProvider,
      breakdownMembershipNumber: data.breakdownMembershipNumber.present
          ? data.breakdownMembershipNumber.value
          : this.breakdownMembershipNumber,
      breakdownContact: data.breakdownContact.present
          ? data.breakdownContact.value
          : this.breakdownContact,
      breakdownNotes: data.breakdownNotes.present
          ? data.breakdownNotes.value
          : this.breakdownNotes,
      recoveryProvider: data.recoveryProvider.present
          ? data.recoveryProvider.value
          : this.recoveryProvider,
      recoveryArrangedVia: data.recoveryArrangedVia.present
          ? data.recoveryArrangedVia.value
          : this.recoveryArrangedVia,
      recoveryReference: data.recoveryReference.present
          ? data.recoveryReference.value
          : this.recoveryReference,
      recoveryContact: data.recoveryContact.present
          ? data.recoveryContact.value
          : this.recoveryContact,
      recoveryNotes: data.recoveryNotes.present
          ? data.recoveryNotes.value
          : this.recoveryNotes,
      motDueDate: data.motDueDate.present
          ? data.motDueDate.value
          : this.motDueDate,
      taxDueDate: data.taxDueDate.present
          ? data.taxDueDate.value
          : this.taxDueDate,
      currentMileage: data.currentMileage.present
          ? data.currentMileage.value
          : this.currentMileage,
      notes: data.notes.present ? data.notes.value : this.notes,
      dvlaVerified: data.dvlaVerified.present
          ? data.dvlaVerified.value
          : this.dvlaVerified,
      taxStatus: data.taxStatus.present ? data.taxStatus.value : this.taxStatus,
      motStatus: data.motStatus.present ? data.motStatus.value : this.motStatus,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
    );
  }

  @override
  String toString() {
    return (StringBuffer('VehicleRow(')
          ..write('id: $id, ')
          ..write('registration: $registration, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('year: $year, ')
          ..write('colour: $colour, ')
          ..write('fuelType: $fuelType, ')
          ..write('transmission: $transmission, ')
          ..write('vin: $vin, ')
          ..write('variant: $variant, ')
          ..write('bodyType: $bodyType, ')
          ..write('engineCC: $engineCC, ')
          ..write('engineNumber: $engineNumber, ')
          ..write('keyNumber: $keyNumber, ')
          ..write('chassisNumber: $chassisNumber, ')
          ..write('radioCode: $radioCode, ')
          ..write('description: $description, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('purchasedFrom: $purchasedFrom, ')
          ..write('ownership: $ownership, ')
          ..write('financeCompany: $financeCompany, ')
          ..write('agreementNumber: $agreementNumber, ')
          ..write('deposit: $deposit, ')
          ..write('monthlyPayment: $monthlyPayment, ')
          ..write('financeStartDate: $financeStartDate, ')
          ..write('financeEndDate: $financeEndDate, ')
          ..write('balloonPayment: $balloonPayment, ')
          ..write('annualMileageAllowance: $annualMileageAllowance, ')
          ..write('numberOfPayments: $numberOfPayments, ')
          ..write('lessor: $lessor, ')
          ..write('agreementHolder: $agreementHolder, ')
          ..write('ownershipNotes: $ownershipNotes, ')
          ..write('insurer: $insurer, ')
          ..write('insurancePolicyNumber: $insurancePolicyNumber, ')
          ..write('insuranceRenewalDate: $insuranceRenewalDate, ')
          ..write('insuranceType: $insuranceType, ')
          ..write('insuredDrivers: $insuredDrivers, ')
          ..write('insuranceAnnualCost: $insuranceAnnualCost, ')
          ..write('breakdownProvider: $breakdownProvider, ')
          ..write('breakdownMembershipNumber: $breakdownMembershipNumber, ')
          ..write('breakdownContact: $breakdownContact, ')
          ..write('breakdownNotes: $breakdownNotes, ')
          ..write('recoveryProvider: $recoveryProvider, ')
          ..write('recoveryArrangedVia: $recoveryArrangedVia, ')
          ..write('recoveryReference: $recoveryReference, ')
          ..write('recoveryContact: $recoveryContact, ')
          ..write('recoveryNotes: $recoveryNotes, ')
          ..write('motDueDate: $motDueDate, ')
          ..write('taxDueDate: $taxDueDate, ')
          ..write('currentMileage: $currentMileage, ')
          ..write('notes: $notes, ')
          ..write('dvlaVerified: $dvlaVerified, ')
          ..write('taxStatus: $taxStatus, ')
          ..write('motStatus: $motStatus, ')
          ..write('photoPath: $photoPath')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
    id,
    registration,
    make,
    model,
    year,
    colour,
    fuelType,
    transmission,
    vin,
    variant,
    bodyType,
    engineCC,
    engineNumber,
    keyNumber,
    chassisNumber,
    radioCode,
    description,
    purchaseDate,
    purchasePrice,
    purchasedFrom,
    ownership,
    financeCompany,
    agreementNumber,
    deposit,
    monthlyPayment,
    financeStartDate,
    financeEndDate,
    balloonPayment,
    annualMileageAllowance,
    numberOfPayments,
    lessor,
    agreementHolder,
    ownershipNotes,
    insurer,
    insurancePolicyNumber,
    insuranceRenewalDate,
    insuranceType,
    insuredDrivers,
    insuranceAnnualCost,
    breakdownProvider,
    breakdownMembershipNumber,
    breakdownContact,
    breakdownNotes,
    recoveryProvider,
    recoveryArrangedVia,
    recoveryReference,
    recoveryContact,
    recoveryNotes,
    motDueDate,
    taxDueDate,
    currentMileage,
    notes,
    dvlaVerified,
    taxStatus,
    motStatus,
    photoPath,
  ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is VehicleRow &&
          other.id == this.id &&
          other.registration == this.registration &&
          other.make == this.make &&
          other.model == this.model &&
          other.year == this.year &&
          other.colour == this.colour &&
          other.fuelType == this.fuelType &&
          other.transmission == this.transmission &&
          other.vin == this.vin &&
          other.variant == this.variant &&
          other.bodyType == this.bodyType &&
          other.engineCC == this.engineCC &&
          other.engineNumber == this.engineNumber &&
          other.keyNumber == this.keyNumber &&
          other.chassisNumber == this.chassisNumber &&
          other.radioCode == this.radioCode &&
          other.description == this.description &&
          other.purchaseDate == this.purchaseDate &&
          other.purchasePrice == this.purchasePrice &&
          other.purchasedFrom == this.purchasedFrom &&
          other.ownership == this.ownership &&
          other.financeCompany == this.financeCompany &&
          other.agreementNumber == this.agreementNumber &&
          other.deposit == this.deposit &&
          other.monthlyPayment == this.monthlyPayment &&
          other.financeStartDate == this.financeStartDate &&
          other.financeEndDate == this.financeEndDate &&
          other.balloonPayment == this.balloonPayment &&
          other.annualMileageAllowance == this.annualMileageAllowance &&
          other.numberOfPayments == this.numberOfPayments &&
          other.lessor == this.lessor &&
          other.agreementHolder == this.agreementHolder &&
          other.ownershipNotes == this.ownershipNotes &&
          other.insurer == this.insurer &&
          other.insurancePolicyNumber == this.insurancePolicyNumber &&
          other.insuranceRenewalDate == this.insuranceRenewalDate &&
          other.insuranceType == this.insuranceType &&
          other.insuredDrivers == this.insuredDrivers &&
          other.insuranceAnnualCost == this.insuranceAnnualCost &&
          other.breakdownProvider == this.breakdownProvider &&
          other.breakdownMembershipNumber == this.breakdownMembershipNumber &&
          other.breakdownContact == this.breakdownContact &&
          other.breakdownNotes == this.breakdownNotes &&
          other.recoveryProvider == this.recoveryProvider &&
          other.recoveryArrangedVia == this.recoveryArrangedVia &&
          other.recoveryReference == this.recoveryReference &&
          other.recoveryContact == this.recoveryContact &&
          other.recoveryNotes == this.recoveryNotes &&
          other.motDueDate == this.motDueDate &&
          other.taxDueDate == this.taxDueDate &&
          other.currentMileage == this.currentMileage &&
          other.notes == this.notes &&
          other.dvlaVerified == this.dvlaVerified &&
          other.taxStatus == this.taxStatus &&
          other.motStatus == this.motStatus &&
          other.photoPath == this.photoPath);
}

class VehiclesCompanion extends UpdateCompanion<VehicleRow> {
  final Value<String> id;
  final Value<String> registration;
  final Value<String> make;
  final Value<String> model;
  final Value<String> year;
  final Value<String> colour;
  final Value<String> fuelType;
  final Value<String> transmission;
  final Value<String> vin;
  final Value<String> variant;
  final Value<String> bodyType;
  final Value<String> engineCC;
  final Value<String> engineNumber;
  final Value<String> keyNumber;
  final Value<String> chassisNumber;
  final Value<String> radioCode;
  final Value<String> description;
  final Value<String> purchaseDate;
  final Value<double> purchasePrice;
  final Value<String> purchasedFrom;
  final Value<String> ownership;
  final Value<String> financeCompany;
  final Value<String> agreementNumber;
  final Value<double> deposit;
  final Value<double> monthlyPayment;
  final Value<String> financeStartDate;
  final Value<String> financeEndDate;
  final Value<double> balloonPayment;
  final Value<int> annualMileageAllowance;
  final Value<int> numberOfPayments;
  final Value<String> lessor;
  final Value<String> agreementHolder;
  final Value<String> ownershipNotes;
  final Value<String> insurer;
  final Value<String> insurancePolicyNumber;
  final Value<String> insuranceRenewalDate;
  final Value<String> insuranceType;
  final Value<String> insuredDrivers;
  final Value<double> insuranceAnnualCost;
  final Value<String> breakdownProvider;
  final Value<String> breakdownMembershipNumber;
  final Value<String> breakdownContact;
  final Value<String> breakdownNotes;
  final Value<String> recoveryProvider;
  final Value<String> recoveryArrangedVia;
  final Value<String> recoveryReference;
  final Value<String> recoveryContact;
  final Value<String> recoveryNotes;
  final Value<String> motDueDate;
  final Value<String> taxDueDate;
  final Value<int> currentMileage;
  final Value<String> notes;
  final Value<bool> dvlaVerified;
  final Value<String> taxStatus;
  final Value<String> motStatus;
  final Value<String> photoPath;
  final Value<int> rowid;
  const VehiclesCompanion({
    this.id = const Value.absent(),
    this.registration = const Value.absent(),
    this.make = const Value.absent(),
    this.model = const Value.absent(),
    this.year = const Value.absent(),
    this.colour = const Value.absent(),
    this.fuelType = const Value.absent(),
    this.transmission = const Value.absent(),
    this.vin = const Value.absent(),
    this.variant = const Value.absent(),
    this.bodyType = const Value.absent(),
    this.engineCC = const Value.absent(),
    this.engineNumber = const Value.absent(),
    this.keyNumber = const Value.absent(),
    this.chassisNumber = const Value.absent(),
    this.radioCode = const Value.absent(),
    this.description = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.purchasedFrom = const Value.absent(),
    this.ownership = const Value.absent(),
    this.financeCompany = const Value.absent(),
    this.agreementNumber = const Value.absent(),
    this.deposit = const Value.absent(),
    this.monthlyPayment = const Value.absent(),
    this.financeStartDate = const Value.absent(),
    this.financeEndDate = const Value.absent(),
    this.balloonPayment = const Value.absent(),
    this.annualMileageAllowance = const Value.absent(),
    this.numberOfPayments = const Value.absent(),
    this.lessor = const Value.absent(),
    this.agreementHolder = const Value.absent(),
    this.ownershipNotes = const Value.absent(),
    this.insurer = const Value.absent(),
    this.insurancePolicyNumber = const Value.absent(),
    this.insuranceRenewalDate = const Value.absent(),
    this.insuranceType = const Value.absent(),
    this.insuredDrivers = const Value.absent(),
    this.insuranceAnnualCost = const Value.absent(),
    this.breakdownProvider = const Value.absent(),
    this.breakdownMembershipNumber = const Value.absent(),
    this.breakdownContact = const Value.absent(),
    this.breakdownNotes = const Value.absent(),
    this.recoveryProvider = const Value.absent(),
    this.recoveryArrangedVia = const Value.absent(),
    this.recoveryReference = const Value.absent(),
    this.recoveryContact = const Value.absent(),
    this.recoveryNotes = const Value.absent(),
    this.motDueDate = const Value.absent(),
    this.taxDueDate = const Value.absent(),
    this.currentMileage = const Value.absent(),
    this.notes = const Value.absent(),
    this.dvlaVerified = const Value.absent(),
    this.taxStatus = const Value.absent(),
    this.motStatus = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  VehiclesCompanion.insert({
    required String id,
    this.registration = const Value.absent(),
    this.make = const Value.absent(),
    this.model = const Value.absent(),
    this.year = const Value.absent(),
    this.colour = const Value.absent(),
    this.fuelType = const Value.absent(),
    this.transmission = const Value.absent(),
    this.vin = const Value.absent(),
    this.variant = const Value.absent(),
    this.bodyType = const Value.absent(),
    this.engineCC = const Value.absent(),
    this.engineNumber = const Value.absent(),
    this.keyNumber = const Value.absent(),
    this.chassisNumber = const Value.absent(),
    this.radioCode = const Value.absent(),
    this.description = const Value.absent(),
    this.purchaseDate = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.purchasedFrom = const Value.absent(),
    this.ownership = const Value.absent(),
    this.financeCompany = const Value.absent(),
    this.agreementNumber = const Value.absent(),
    this.deposit = const Value.absent(),
    this.monthlyPayment = const Value.absent(),
    this.financeStartDate = const Value.absent(),
    this.financeEndDate = const Value.absent(),
    this.balloonPayment = const Value.absent(),
    this.annualMileageAllowance = const Value.absent(),
    this.numberOfPayments = const Value.absent(),
    this.lessor = const Value.absent(),
    this.agreementHolder = const Value.absent(),
    this.ownershipNotes = const Value.absent(),
    this.insurer = const Value.absent(),
    this.insurancePolicyNumber = const Value.absent(),
    this.insuranceRenewalDate = const Value.absent(),
    this.insuranceType = const Value.absent(),
    this.insuredDrivers = const Value.absent(),
    this.insuranceAnnualCost = const Value.absent(),
    this.breakdownProvider = const Value.absent(),
    this.breakdownMembershipNumber = const Value.absent(),
    this.breakdownContact = const Value.absent(),
    this.breakdownNotes = const Value.absent(),
    this.recoveryProvider = const Value.absent(),
    this.recoveryArrangedVia = const Value.absent(),
    this.recoveryReference = const Value.absent(),
    this.recoveryContact = const Value.absent(),
    this.recoveryNotes = const Value.absent(),
    this.motDueDate = const Value.absent(),
    this.taxDueDate = const Value.absent(),
    this.currentMileage = const Value.absent(),
    this.notes = const Value.absent(),
    this.dvlaVerified = const Value.absent(),
    this.taxStatus = const Value.absent(),
    this.motStatus = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<VehicleRow> custom({
    Expression<String>? id,
    Expression<String>? registration,
    Expression<String>? make,
    Expression<String>? model,
    Expression<String>? year,
    Expression<String>? colour,
    Expression<String>? fuelType,
    Expression<String>? transmission,
    Expression<String>? vin,
    Expression<String>? variant,
    Expression<String>? bodyType,
    Expression<String>? engineCC,
    Expression<String>? engineNumber,
    Expression<String>? keyNumber,
    Expression<String>? chassisNumber,
    Expression<String>? radioCode,
    Expression<String>? description,
    Expression<String>? purchaseDate,
    Expression<double>? purchasePrice,
    Expression<String>? purchasedFrom,
    Expression<String>? ownership,
    Expression<String>? financeCompany,
    Expression<String>? agreementNumber,
    Expression<double>? deposit,
    Expression<double>? monthlyPayment,
    Expression<String>? financeStartDate,
    Expression<String>? financeEndDate,
    Expression<double>? balloonPayment,
    Expression<int>? annualMileageAllowance,
    Expression<int>? numberOfPayments,
    Expression<String>? lessor,
    Expression<String>? agreementHolder,
    Expression<String>? ownershipNotes,
    Expression<String>? insurer,
    Expression<String>? insurancePolicyNumber,
    Expression<String>? insuranceRenewalDate,
    Expression<String>? insuranceType,
    Expression<String>? insuredDrivers,
    Expression<double>? insuranceAnnualCost,
    Expression<String>? breakdownProvider,
    Expression<String>? breakdownMembershipNumber,
    Expression<String>? breakdownContact,
    Expression<String>? breakdownNotes,
    Expression<String>? recoveryProvider,
    Expression<String>? recoveryArrangedVia,
    Expression<String>? recoveryReference,
    Expression<String>? recoveryContact,
    Expression<String>? recoveryNotes,
    Expression<String>? motDueDate,
    Expression<String>? taxDueDate,
    Expression<int>? currentMileage,
    Expression<String>? notes,
    Expression<bool>? dvlaVerified,
    Expression<String>? taxStatus,
    Expression<String>? motStatus,
    Expression<String>? photoPath,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (registration != null) 'registration': registration,
      if (make != null) 'make': make,
      if (model != null) 'model': model,
      if (year != null) 'year': year,
      if (colour != null) 'colour': colour,
      if (fuelType != null) 'fuel_type': fuelType,
      if (transmission != null) 'transmission': transmission,
      if (vin != null) 'vin': vin,
      if (variant != null) 'variant': variant,
      if (bodyType != null) 'body_type': bodyType,
      if (engineCC != null) 'engine_c_c': engineCC,
      if (engineNumber != null) 'engine_number': engineNumber,
      if (keyNumber != null) 'key_number': keyNumber,
      if (chassisNumber != null) 'chassis_number': chassisNumber,
      if (radioCode != null) 'radio_code': radioCode,
      if (description != null) 'description': description,
      if (purchaseDate != null) 'purchase_date': purchaseDate,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (purchasedFrom != null) 'purchased_from': purchasedFrom,
      if (ownership != null) 'ownership': ownership,
      if (financeCompany != null) 'finance_company': financeCompany,
      if (agreementNumber != null) 'agreement_number': agreementNumber,
      if (deposit != null) 'deposit': deposit,
      if (monthlyPayment != null) 'monthly_payment': monthlyPayment,
      if (financeStartDate != null) 'finance_start_date': financeStartDate,
      if (financeEndDate != null) 'finance_end_date': financeEndDate,
      if (balloonPayment != null) 'balloon_payment': balloonPayment,
      if (annualMileageAllowance != null)
        'annual_mileage_allowance': annualMileageAllowance,
      if (numberOfPayments != null) 'number_of_payments': numberOfPayments,
      if (lessor != null) 'lessor': lessor,
      if (agreementHolder != null) 'agreement_holder': agreementHolder,
      if (ownershipNotes != null) 'ownership_notes': ownershipNotes,
      if (insurer != null) 'insurer': insurer,
      if (insurancePolicyNumber != null)
        'insurance_policy_number': insurancePolicyNumber,
      if (insuranceRenewalDate != null)
        'insurance_renewal_date': insuranceRenewalDate,
      if (insuranceType != null) 'insurance_type': insuranceType,
      if (insuredDrivers != null) 'insured_drivers': insuredDrivers,
      if (insuranceAnnualCost != null)
        'insurance_annual_cost': insuranceAnnualCost,
      if (breakdownProvider != null) 'breakdown_provider': breakdownProvider,
      if (breakdownMembershipNumber != null)
        'breakdown_membership_number': breakdownMembershipNumber,
      if (breakdownContact != null) 'breakdown_contact': breakdownContact,
      if (breakdownNotes != null) 'breakdown_notes': breakdownNotes,
      if (recoveryProvider != null) 'recovery_provider': recoveryProvider,
      if (recoveryArrangedVia != null)
        'recovery_arranged_via': recoveryArrangedVia,
      if (recoveryReference != null) 'recovery_reference': recoveryReference,
      if (recoveryContact != null) 'recovery_contact': recoveryContact,
      if (recoveryNotes != null) 'recovery_notes': recoveryNotes,
      if (motDueDate != null) 'mot_due_date': motDueDate,
      if (taxDueDate != null) 'tax_due_date': taxDueDate,
      if (currentMileage != null) 'current_mileage': currentMileage,
      if (notes != null) 'notes': notes,
      if (dvlaVerified != null) 'dvla_verified': dvlaVerified,
      if (taxStatus != null) 'tax_status': taxStatus,
      if (motStatus != null) 'mot_status': motStatus,
      if (photoPath != null) 'photo_path': photoPath,
      if (rowid != null) 'rowid': rowid,
    });
  }

  VehiclesCompanion copyWith({
    Value<String>? id,
    Value<String>? registration,
    Value<String>? make,
    Value<String>? model,
    Value<String>? year,
    Value<String>? colour,
    Value<String>? fuelType,
    Value<String>? transmission,
    Value<String>? vin,
    Value<String>? variant,
    Value<String>? bodyType,
    Value<String>? engineCC,
    Value<String>? engineNumber,
    Value<String>? keyNumber,
    Value<String>? chassisNumber,
    Value<String>? radioCode,
    Value<String>? description,
    Value<String>? purchaseDate,
    Value<double>? purchasePrice,
    Value<String>? purchasedFrom,
    Value<String>? ownership,
    Value<String>? financeCompany,
    Value<String>? agreementNumber,
    Value<double>? deposit,
    Value<double>? monthlyPayment,
    Value<String>? financeStartDate,
    Value<String>? financeEndDate,
    Value<double>? balloonPayment,
    Value<int>? annualMileageAllowance,
    Value<int>? numberOfPayments,
    Value<String>? lessor,
    Value<String>? agreementHolder,
    Value<String>? ownershipNotes,
    Value<String>? insurer,
    Value<String>? insurancePolicyNumber,
    Value<String>? insuranceRenewalDate,
    Value<String>? insuranceType,
    Value<String>? insuredDrivers,
    Value<double>? insuranceAnnualCost,
    Value<String>? breakdownProvider,
    Value<String>? breakdownMembershipNumber,
    Value<String>? breakdownContact,
    Value<String>? breakdownNotes,
    Value<String>? recoveryProvider,
    Value<String>? recoveryArrangedVia,
    Value<String>? recoveryReference,
    Value<String>? recoveryContact,
    Value<String>? recoveryNotes,
    Value<String>? motDueDate,
    Value<String>? taxDueDate,
    Value<int>? currentMileage,
    Value<String>? notes,
    Value<bool>? dvlaVerified,
    Value<String>? taxStatus,
    Value<String>? motStatus,
    Value<String>? photoPath,
    Value<int>? rowid,
  }) {
    return VehiclesCompanion(
      id: id ?? this.id,
      registration: registration ?? this.registration,
      make: make ?? this.make,
      model: model ?? this.model,
      year: year ?? this.year,
      colour: colour ?? this.colour,
      fuelType: fuelType ?? this.fuelType,
      transmission: transmission ?? this.transmission,
      vin: vin ?? this.vin,
      variant: variant ?? this.variant,
      bodyType: bodyType ?? this.bodyType,
      engineCC: engineCC ?? this.engineCC,
      engineNumber: engineNumber ?? this.engineNumber,
      keyNumber: keyNumber ?? this.keyNumber,
      chassisNumber: chassisNumber ?? this.chassisNumber,
      radioCode: radioCode ?? this.radioCode,
      description: description ?? this.description,
      purchaseDate: purchaseDate ?? this.purchaseDate,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      purchasedFrom: purchasedFrom ?? this.purchasedFrom,
      ownership: ownership ?? this.ownership,
      financeCompany: financeCompany ?? this.financeCompany,
      agreementNumber: agreementNumber ?? this.agreementNumber,
      deposit: deposit ?? this.deposit,
      monthlyPayment: monthlyPayment ?? this.monthlyPayment,
      financeStartDate: financeStartDate ?? this.financeStartDate,
      financeEndDate: financeEndDate ?? this.financeEndDate,
      balloonPayment: balloonPayment ?? this.balloonPayment,
      annualMileageAllowance:
          annualMileageAllowance ?? this.annualMileageAllowance,
      numberOfPayments: numberOfPayments ?? this.numberOfPayments,
      lessor: lessor ?? this.lessor,
      agreementHolder: agreementHolder ?? this.agreementHolder,
      ownershipNotes: ownershipNotes ?? this.ownershipNotes,
      insurer: insurer ?? this.insurer,
      insurancePolicyNumber:
          insurancePolicyNumber ?? this.insurancePolicyNumber,
      insuranceRenewalDate: insuranceRenewalDate ?? this.insuranceRenewalDate,
      insuranceType: insuranceType ?? this.insuranceType,
      insuredDrivers: insuredDrivers ?? this.insuredDrivers,
      insuranceAnnualCost: insuranceAnnualCost ?? this.insuranceAnnualCost,
      breakdownProvider: breakdownProvider ?? this.breakdownProvider,
      breakdownMembershipNumber:
          breakdownMembershipNumber ?? this.breakdownMembershipNumber,
      breakdownContact: breakdownContact ?? this.breakdownContact,
      breakdownNotes: breakdownNotes ?? this.breakdownNotes,
      recoveryProvider: recoveryProvider ?? this.recoveryProvider,
      recoveryArrangedVia: recoveryArrangedVia ?? this.recoveryArrangedVia,
      recoveryReference: recoveryReference ?? this.recoveryReference,
      recoveryContact: recoveryContact ?? this.recoveryContact,
      recoveryNotes: recoveryNotes ?? this.recoveryNotes,
      motDueDate: motDueDate ?? this.motDueDate,
      taxDueDate: taxDueDate ?? this.taxDueDate,
      currentMileage: currentMileage ?? this.currentMileage,
      notes: notes ?? this.notes,
      dvlaVerified: dvlaVerified ?? this.dvlaVerified,
      taxStatus: taxStatus ?? this.taxStatus,
      motStatus: motStatus ?? this.motStatus,
      photoPath: photoPath ?? this.photoPath,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (registration.present) {
      map['registration'] = Variable<String>(registration.value);
    }
    if (make.present) {
      map['make'] = Variable<String>(make.value);
    }
    if (model.present) {
      map['model'] = Variable<String>(model.value);
    }
    if (year.present) {
      map['year'] = Variable<String>(year.value);
    }
    if (colour.present) {
      map['colour'] = Variable<String>(colour.value);
    }
    if (fuelType.present) {
      map['fuel_type'] = Variable<String>(fuelType.value);
    }
    if (transmission.present) {
      map['transmission'] = Variable<String>(transmission.value);
    }
    if (vin.present) {
      map['vin'] = Variable<String>(vin.value);
    }
    if (variant.present) {
      map['variant'] = Variable<String>(variant.value);
    }
    if (bodyType.present) {
      map['body_type'] = Variable<String>(bodyType.value);
    }
    if (engineCC.present) {
      map['engine_c_c'] = Variable<String>(engineCC.value);
    }
    if (engineNumber.present) {
      map['engine_number'] = Variable<String>(engineNumber.value);
    }
    if (keyNumber.present) {
      map['key_number'] = Variable<String>(keyNumber.value);
    }
    if (chassisNumber.present) {
      map['chassis_number'] = Variable<String>(chassisNumber.value);
    }
    if (radioCode.present) {
      map['radio_code'] = Variable<String>(radioCode.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (purchaseDate.present) {
      map['purchase_date'] = Variable<String>(purchaseDate.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<double>(purchasePrice.value);
    }
    if (purchasedFrom.present) {
      map['purchased_from'] = Variable<String>(purchasedFrom.value);
    }
    if (ownership.present) {
      map['ownership'] = Variable<String>(ownership.value);
    }
    if (financeCompany.present) {
      map['finance_company'] = Variable<String>(financeCompany.value);
    }
    if (agreementNumber.present) {
      map['agreement_number'] = Variable<String>(agreementNumber.value);
    }
    if (deposit.present) {
      map['deposit'] = Variable<double>(deposit.value);
    }
    if (monthlyPayment.present) {
      map['monthly_payment'] = Variable<double>(monthlyPayment.value);
    }
    if (financeStartDate.present) {
      map['finance_start_date'] = Variable<String>(financeStartDate.value);
    }
    if (financeEndDate.present) {
      map['finance_end_date'] = Variable<String>(financeEndDate.value);
    }
    if (balloonPayment.present) {
      map['balloon_payment'] = Variable<double>(balloonPayment.value);
    }
    if (annualMileageAllowance.present) {
      map['annual_mileage_allowance'] = Variable<int>(
        annualMileageAllowance.value,
      );
    }
    if (numberOfPayments.present) {
      map['number_of_payments'] = Variable<int>(numberOfPayments.value);
    }
    if (lessor.present) {
      map['lessor'] = Variable<String>(lessor.value);
    }
    if (agreementHolder.present) {
      map['agreement_holder'] = Variable<String>(agreementHolder.value);
    }
    if (ownershipNotes.present) {
      map['ownership_notes'] = Variable<String>(ownershipNotes.value);
    }
    if (insurer.present) {
      map['insurer'] = Variable<String>(insurer.value);
    }
    if (insurancePolicyNumber.present) {
      map['insurance_policy_number'] = Variable<String>(
        insurancePolicyNumber.value,
      );
    }
    if (insuranceRenewalDate.present) {
      map['insurance_renewal_date'] = Variable<String>(
        insuranceRenewalDate.value,
      );
    }
    if (insuranceType.present) {
      map['insurance_type'] = Variable<String>(insuranceType.value);
    }
    if (insuredDrivers.present) {
      map['insured_drivers'] = Variable<String>(insuredDrivers.value);
    }
    if (insuranceAnnualCost.present) {
      map['insurance_annual_cost'] = Variable<double>(
        insuranceAnnualCost.value,
      );
    }
    if (breakdownProvider.present) {
      map['breakdown_provider'] = Variable<String>(breakdownProvider.value);
    }
    if (breakdownMembershipNumber.present) {
      map['breakdown_membership_number'] = Variable<String>(
        breakdownMembershipNumber.value,
      );
    }
    if (breakdownContact.present) {
      map['breakdown_contact'] = Variable<String>(breakdownContact.value);
    }
    if (breakdownNotes.present) {
      map['breakdown_notes'] = Variable<String>(breakdownNotes.value);
    }
    if (recoveryProvider.present) {
      map['recovery_provider'] = Variable<String>(recoveryProvider.value);
    }
    if (recoveryArrangedVia.present) {
      map['recovery_arranged_via'] = Variable<String>(
        recoveryArrangedVia.value,
      );
    }
    if (recoveryReference.present) {
      map['recovery_reference'] = Variable<String>(recoveryReference.value);
    }
    if (recoveryContact.present) {
      map['recovery_contact'] = Variable<String>(recoveryContact.value);
    }
    if (recoveryNotes.present) {
      map['recovery_notes'] = Variable<String>(recoveryNotes.value);
    }
    if (motDueDate.present) {
      map['mot_due_date'] = Variable<String>(motDueDate.value);
    }
    if (taxDueDate.present) {
      map['tax_due_date'] = Variable<String>(taxDueDate.value);
    }
    if (currentMileage.present) {
      map['current_mileage'] = Variable<int>(currentMileage.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (dvlaVerified.present) {
      map['dvla_verified'] = Variable<bool>(dvlaVerified.value);
    }
    if (taxStatus.present) {
      map['tax_status'] = Variable<String>(taxStatus.value);
    }
    if (motStatus.present) {
      map['mot_status'] = Variable<String>(motStatus.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('VehiclesCompanion(')
          ..write('id: $id, ')
          ..write('registration: $registration, ')
          ..write('make: $make, ')
          ..write('model: $model, ')
          ..write('year: $year, ')
          ..write('colour: $colour, ')
          ..write('fuelType: $fuelType, ')
          ..write('transmission: $transmission, ')
          ..write('vin: $vin, ')
          ..write('variant: $variant, ')
          ..write('bodyType: $bodyType, ')
          ..write('engineCC: $engineCC, ')
          ..write('engineNumber: $engineNumber, ')
          ..write('keyNumber: $keyNumber, ')
          ..write('chassisNumber: $chassisNumber, ')
          ..write('radioCode: $radioCode, ')
          ..write('description: $description, ')
          ..write('purchaseDate: $purchaseDate, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('purchasedFrom: $purchasedFrom, ')
          ..write('ownership: $ownership, ')
          ..write('financeCompany: $financeCompany, ')
          ..write('agreementNumber: $agreementNumber, ')
          ..write('deposit: $deposit, ')
          ..write('monthlyPayment: $monthlyPayment, ')
          ..write('financeStartDate: $financeStartDate, ')
          ..write('financeEndDate: $financeEndDate, ')
          ..write('balloonPayment: $balloonPayment, ')
          ..write('annualMileageAllowance: $annualMileageAllowance, ')
          ..write('numberOfPayments: $numberOfPayments, ')
          ..write('lessor: $lessor, ')
          ..write('agreementHolder: $agreementHolder, ')
          ..write('ownershipNotes: $ownershipNotes, ')
          ..write('insurer: $insurer, ')
          ..write('insurancePolicyNumber: $insurancePolicyNumber, ')
          ..write('insuranceRenewalDate: $insuranceRenewalDate, ')
          ..write('insuranceType: $insuranceType, ')
          ..write('insuredDrivers: $insuredDrivers, ')
          ..write('insuranceAnnualCost: $insuranceAnnualCost, ')
          ..write('breakdownProvider: $breakdownProvider, ')
          ..write('breakdownMembershipNumber: $breakdownMembershipNumber, ')
          ..write('breakdownContact: $breakdownContact, ')
          ..write('breakdownNotes: $breakdownNotes, ')
          ..write('recoveryProvider: $recoveryProvider, ')
          ..write('recoveryArrangedVia: $recoveryArrangedVia, ')
          ..write('recoveryReference: $recoveryReference, ')
          ..write('recoveryContact: $recoveryContact, ')
          ..write('recoveryNotes: $recoveryNotes, ')
          ..write('motDueDate: $motDueDate, ')
          ..write('taxDueDate: $taxDueDate, ')
          ..write('currentMileage: $currentMileage, ')
          ..write('notes: $notes, ')
          ..write('dvlaVerified: $dvlaVerified, ')
          ..write('taxStatus: $taxStatus, ')
          ..write('motStatus: $motStatus, ')
          ..write('photoPath: $photoPath, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ServiceEntriesTable extends ServiceEntries
    with TableInfo<$ServiceEntriesTable, ServiceEntryRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ServiceEntriesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<String> vehicleId = GeneratedColumn<String>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicles (id)',
    ),
  );
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<String> date = GeneratedColumn<String>(
    'date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
    'type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('service'),
  );
  static const VerificationMeta _descriptionMeta = const VerificationMeta(
    'description',
  );
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
    'description',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _costMeta = const VerificationMeta('cost');
  @override
  late final GeneratedColumn<double> cost = GeneratedColumn<double>(
    'cost',
    aliasedName,
    false,
    type: DriftSqlType.double,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _garageMeta = const VerificationMeta('garage');
  @override
  late final GeneratedColumn<String> garage = GeneratedColumn<String>(
    'garage',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _mileageMeta = const VerificationMeta(
    'mileage',
  );
  @override
  late final GeneratedColumn<int> mileage = GeneratedColumn<int>(
    'mileage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _nextServiceDateMeta = const VerificationMeta(
    'nextServiceDate',
  );
  @override
  late final GeneratedColumn<String> nextServiceDate = GeneratedColumn<String>(
    'next_service_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _nextServiceMileageMeta =
      const VerificationMeta('nextServiceMileage');
  @override
  late final GeneratedColumn<int> nextServiceMileage = GeneratedColumn<int>(
    'next_service_mileage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vehicleId,
    date,
    type,
    description,
    cost,
    garage,
    mileage,
    nextServiceDate,
    nextServiceMileage,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'service_entries';
  @override
  VerificationContext validateIntegrity(
    Insertable<ServiceEntryRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('date')) {
      context.handle(
        _dateMeta,
        date.isAcceptableOrUnknown(data['date']!, _dateMeta),
      );
    }
    if (data.containsKey('type')) {
      context.handle(
        _typeMeta,
        type.isAcceptableOrUnknown(data['type']!, _typeMeta),
      );
    }
    if (data.containsKey('description')) {
      context.handle(
        _descriptionMeta,
        description.isAcceptableOrUnknown(
          data['description']!,
          _descriptionMeta,
        ),
      );
    }
    if (data.containsKey('cost')) {
      context.handle(
        _costMeta,
        cost.isAcceptableOrUnknown(data['cost']!, _costMeta),
      );
    }
    if (data.containsKey('garage')) {
      context.handle(
        _garageMeta,
        garage.isAcceptableOrUnknown(data['garage']!, _garageMeta),
      );
    }
    if (data.containsKey('mileage')) {
      context.handle(
        _mileageMeta,
        mileage.isAcceptableOrUnknown(data['mileage']!, _mileageMeta),
      );
    }
    if (data.containsKey('next_service_date')) {
      context.handle(
        _nextServiceDateMeta,
        nextServiceDate.isAcceptableOrUnknown(
          data['next_service_date']!,
          _nextServiceDateMeta,
        ),
      );
    }
    if (data.containsKey('next_service_mileage')) {
      context.handle(
        _nextServiceMileageMeta,
        nextServiceMileage.isAcceptableOrUnknown(
          data['next_service_mileage']!,
          _nextServiceMileageMeta,
        ),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ServiceEntryRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ServiceEntryRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vehicle_id'],
      )!,
      date: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}date'],
      )!,
      type: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}type'],
      )!,
      description: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}description'],
      )!,
      cost: attachedDatabase.typeMapping.read(
        DriftSqlType.double,
        data['${effectivePrefix}cost'],
      )!,
      garage: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}garage'],
      )!,
      mileage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mileage'],
      )!,
      nextServiceDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}next_service_date'],
      )!,
      nextServiceMileage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}next_service_mileage'],
      )!,
    );
  }

  @override
  $ServiceEntriesTable createAlias(String alias) {
    return $ServiceEntriesTable(attachedDatabase, alias);
  }
}

class ServiceEntryRow extends DataClass implements Insertable<ServiceEntryRow> {
  final String id;
  final String vehicleId;
  final String date;
  final String type;
  final String description;
  final double cost;
  final String garage;
  final int mileage;
  final String nextServiceDate;
  final int nextServiceMileage;
  const ServiceEntryRow({
    required this.id,
    required this.vehicleId,
    required this.date,
    required this.type,
    required this.description,
    required this.cost,
    required this.garage,
    required this.mileage,
    required this.nextServiceDate,
    required this.nextServiceMileage,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['vehicle_id'] = Variable<String>(vehicleId);
    map['date'] = Variable<String>(date);
    map['type'] = Variable<String>(type);
    map['description'] = Variable<String>(description);
    map['cost'] = Variable<double>(cost);
    map['garage'] = Variable<String>(garage);
    map['mileage'] = Variable<int>(mileage);
    map['next_service_date'] = Variable<String>(nextServiceDate);
    map['next_service_mileage'] = Variable<int>(nextServiceMileage);
    return map;
  }

  ServiceEntriesCompanion toCompanion(bool nullToAbsent) {
    return ServiceEntriesCompanion(
      id: Value(id),
      vehicleId: Value(vehicleId),
      date: Value(date),
      type: Value(type),
      description: Value(description),
      cost: Value(cost),
      garage: Value(garage),
      mileage: Value(mileage),
      nextServiceDate: Value(nextServiceDate),
      nextServiceMileage: Value(nextServiceMileage),
    );
  }

  factory ServiceEntryRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ServiceEntryRow(
      id: serializer.fromJson<String>(json['id']),
      vehicleId: serializer.fromJson<String>(json['vehicleId']),
      date: serializer.fromJson<String>(json['date']),
      type: serializer.fromJson<String>(json['type']),
      description: serializer.fromJson<String>(json['description']),
      cost: serializer.fromJson<double>(json['cost']),
      garage: serializer.fromJson<String>(json['garage']),
      mileage: serializer.fromJson<int>(json['mileage']),
      nextServiceDate: serializer.fromJson<String>(json['nextServiceDate']),
      nextServiceMileage: serializer.fromJson<int>(json['nextServiceMileage']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vehicleId': serializer.toJson<String>(vehicleId),
      'date': serializer.toJson<String>(date),
      'type': serializer.toJson<String>(type),
      'description': serializer.toJson<String>(description),
      'cost': serializer.toJson<double>(cost),
      'garage': serializer.toJson<String>(garage),
      'mileage': serializer.toJson<int>(mileage),
      'nextServiceDate': serializer.toJson<String>(nextServiceDate),
      'nextServiceMileage': serializer.toJson<int>(nextServiceMileage),
    };
  }

  ServiceEntryRow copyWith({
    String? id,
    String? vehicleId,
    String? date,
    String? type,
    String? description,
    double? cost,
    String? garage,
    int? mileage,
    String? nextServiceDate,
    int? nextServiceMileage,
  }) => ServiceEntryRow(
    id: id ?? this.id,
    vehicleId: vehicleId ?? this.vehicleId,
    date: date ?? this.date,
    type: type ?? this.type,
    description: description ?? this.description,
    cost: cost ?? this.cost,
    garage: garage ?? this.garage,
    mileage: mileage ?? this.mileage,
    nextServiceDate: nextServiceDate ?? this.nextServiceDate,
    nextServiceMileage: nextServiceMileage ?? this.nextServiceMileage,
  );
  ServiceEntryRow copyWithCompanion(ServiceEntriesCompanion data) {
    return ServiceEntryRow(
      id: data.id.present ? data.id.value : this.id,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      date: data.date.present ? data.date.value : this.date,
      type: data.type.present ? data.type.value : this.type,
      description: data.description.present
          ? data.description.value
          : this.description,
      cost: data.cost.present ? data.cost.value : this.cost,
      garage: data.garage.present ? data.garage.value : this.garage,
      mileage: data.mileage.present ? data.mileage.value : this.mileage,
      nextServiceDate: data.nextServiceDate.present
          ? data.nextServiceDate.value
          : this.nextServiceDate,
      nextServiceMileage: data.nextServiceMileage.present
          ? data.nextServiceMileage.value
          : this.nextServiceMileage,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ServiceEntryRow(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('garage: $garage, ')
          ..write('mileage: $mileage, ')
          ..write('nextServiceDate: $nextServiceDate, ')
          ..write('nextServiceMileage: $nextServiceMileage')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vehicleId,
    date,
    type,
    description,
    cost,
    garage,
    mileage,
    nextServiceDate,
    nextServiceMileage,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ServiceEntryRow &&
          other.id == this.id &&
          other.vehicleId == this.vehicleId &&
          other.date == this.date &&
          other.type == this.type &&
          other.description == this.description &&
          other.cost == this.cost &&
          other.garage == this.garage &&
          other.mileage == this.mileage &&
          other.nextServiceDate == this.nextServiceDate &&
          other.nextServiceMileage == this.nextServiceMileage);
}

class ServiceEntriesCompanion extends UpdateCompanion<ServiceEntryRow> {
  final Value<String> id;
  final Value<String> vehicleId;
  final Value<String> date;
  final Value<String> type;
  final Value<String> description;
  final Value<double> cost;
  final Value<String> garage;
  final Value<int> mileage;
  final Value<String> nextServiceDate;
  final Value<int> nextServiceMileage;
  final Value<int> rowid;
  const ServiceEntriesCompanion({
    this.id = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.cost = const Value.absent(),
    this.garage = const Value.absent(),
    this.mileage = const Value.absent(),
    this.nextServiceDate = const Value.absent(),
    this.nextServiceMileage = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ServiceEntriesCompanion.insert({
    required String id,
    required String vehicleId,
    this.date = const Value.absent(),
    this.type = const Value.absent(),
    this.description = const Value.absent(),
    this.cost = const Value.absent(),
    this.garage = const Value.absent(),
    this.mileage = const Value.absent(),
    this.nextServiceDate = const Value.absent(),
    this.nextServiceMileage = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       vehicleId = Value(vehicleId);
  static Insertable<ServiceEntryRow> custom({
    Expression<String>? id,
    Expression<String>? vehicleId,
    Expression<String>? date,
    Expression<String>? type,
    Expression<String>? description,
    Expression<double>? cost,
    Expression<String>? garage,
    Expression<int>? mileage,
    Expression<String>? nextServiceDate,
    Expression<int>? nextServiceMileage,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (date != null) 'date': date,
      if (type != null) 'type': type,
      if (description != null) 'description': description,
      if (cost != null) 'cost': cost,
      if (garage != null) 'garage': garage,
      if (mileage != null) 'mileage': mileage,
      if (nextServiceDate != null) 'next_service_date': nextServiceDate,
      if (nextServiceMileage != null)
        'next_service_mileage': nextServiceMileage,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ServiceEntriesCompanion copyWith({
    Value<String>? id,
    Value<String>? vehicleId,
    Value<String>? date,
    Value<String>? type,
    Value<String>? description,
    Value<double>? cost,
    Value<String>? garage,
    Value<int>? mileage,
    Value<String>? nextServiceDate,
    Value<int>? nextServiceMileage,
    Value<int>? rowid,
  }) {
    return ServiceEntriesCompanion(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      date: date ?? this.date,
      type: type ?? this.type,
      description: description ?? this.description,
      cost: cost ?? this.cost,
      garage: garage ?? this.garage,
      mileage: mileage ?? this.mileage,
      nextServiceDate: nextServiceDate ?? this.nextServiceDate,
      nextServiceMileage: nextServiceMileage ?? this.nextServiceMileage,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<String>(vehicleId.value);
    }
    if (date.present) {
      map['date'] = Variable<String>(date.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (cost.present) {
      map['cost'] = Variable<double>(cost.value);
    }
    if (garage.present) {
      map['garage'] = Variable<String>(garage.value);
    }
    if (mileage.present) {
      map['mileage'] = Variable<int>(mileage.value);
    }
    if (nextServiceDate.present) {
      map['next_service_date'] = Variable<String>(nextServiceDate.value);
    }
    if (nextServiceMileage.present) {
      map['next_service_mileage'] = Variable<int>(nextServiceMileage.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ServiceEntriesCompanion(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('date: $date, ')
          ..write('type: $type, ')
          ..write('description: $description, ')
          ..write('cost: $cost, ')
          ..write('garage: $garage, ')
          ..write('mileage: $mileage, ')
          ..write('nextServiceDate: $nextServiceDate, ')
          ..write('nextServiceMileage: $nextServiceMileage, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $MOTRecordsTable extends MOTRecords
    with TableInfo<$MOTRecordsTable, MOTRecordRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $MOTRecordsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _vehicleIdMeta = const VerificationMeta(
    'vehicleId',
  );
  @override
  late final GeneratedColumn<String> vehicleId = GeneratedColumn<String>(
    'vehicle_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
    defaultConstraints: GeneratedColumn.constraintIsAlways(
      'REFERENCES vehicles (id)',
    ),
  );
  static const VerificationMeta _testDateMeta = const VerificationMeta(
    'testDate',
  );
  @override
  late final GeneratedColumn<String> testDate = GeneratedColumn<String>(
    'test_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _expiryDateMeta = const VerificationMeta(
    'expiryDate',
  );
  @override
  late final GeneratedColumn<String> expiryDate = GeneratedColumn<String>(
    'expiry_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _testCentreMeta = const VerificationMeta(
    'testCentre',
  );
  @override
  late final GeneratedColumn<String> testCentre = GeneratedColumn<String>(
    'test_centre',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _mileageMeta = const VerificationMeta(
    'mileage',
  );
  @override
  late final GeneratedColumn<int> mileage = GeneratedColumn<int>(
    'mileage',
    aliasedName,
    false,
    type: DriftSqlType.int,
    requiredDuringInsert: false,
    defaultValue: const Constant(0),
  );
  static const VerificationMeta _resultMeta = const VerificationMeta('result');
  @override
  late final GeneratedColumn<String> result = GeneratedColumn<String>(
    'result',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('pass'),
  );
  static const VerificationMeta _advisoriesMeta = const VerificationMeta(
    'advisories',
  );
  @override
  late final GeneratedColumn<String> advisories = GeneratedColumn<String>(
    'advisories',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    vehicleId,
    testDate,
    expiryDate,
    testCentre,
    mileage,
    result,
    advisories,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'm_o_t_records';
  @override
  VerificationContext validateIntegrity(
    Insertable<MOTRecordRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('vehicle_id')) {
      context.handle(
        _vehicleIdMeta,
        vehicleId.isAcceptableOrUnknown(data['vehicle_id']!, _vehicleIdMeta),
      );
    } else if (isInserting) {
      context.missing(_vehicleIdMeta);
    }
    if (data.containsKey('test_date')) {
      context.handle(
        _testDateMeta,
        testDate.isAcceptableOrUnknown(data['test_date']!, _testDateMeta),
      );
    }
    if (data.containsKey('expiry_date')) {
      context.handle(
        _expiryDateMeta,
        expiryDate.isAcceptableOrUnknown(data['expiry_date']!, _expiryDateMeta),
      );
    }
    if (data.containsKey('test_centre')) {
      context.handle(
        _testCentreMeta,
        testCentre.isAcceptableOrUnknown(data['test_centre']!, _testCentreMeta),
      );
    }
    if (data.containsKey('mileage')) {
      context.handle(
        _mileageMeta,
        mileage.isAcceptableOrUnknown(data['mileage']!, _mileageMeta),
      );
    }
    if (data.containsKey('result')) {
      context.handle(
        _resultMeta,
        result.isAcceptableOrUnknown(data['result']!, _resultMeta),
      );
    }
    if (data.containsKey('advisories')) {
      context.handle(
        _advisoriesMeta,
        advisories.isAcceptableOrUnknown(data['advisories']!, _advisoriesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  MOTRecordRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return MOTRecordRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      vehicleId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}vehicle_id'],
      )!,
      testDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_date'],
      )!,
      expiryDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}expiry_date'],
      )!,
      testCentre: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}test_centre'],
      )!,
      mileage: attachedDatabase.typeMapping.read(
        DriftSqlType.int,
        data['${effectivePrefix}mileage'],
      )!,
      result: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}result'],
      )!,
      advisories: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}advisories'],
      )!,
    );
  }

  @override
  $MOTRecordsTable createAlias(String alias) {
    return $MOTRecordsTable(attachedDatabase, alias);
  }
}

class MOTRecordRow extends DataClass implements Insertable<MOTRecordRow> {
  final String id;
  final String vehicleId;
  final String testDate;
  final String expiryDate;
  final String testCentre;
  final int mileage;
  final String result;
  final String advisories;
  const MOTRecordRow({
    required this.id,
    required this.vehicleId,
    required this.testDate,
    required this.expiryDate,
    required this.testCentre,
    required this.mileage,
    required this.result,
    required this.advisories,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['vehicle_id'] = Variable<String>(vehicleId);
    map['test_date'] = Variable<String>(testDate);
    map['expiry_date'] = Variable<String>(expiryDate);
    map['test_centre'] = Variable<String>(testCentre);
    map['mileage'] = Variable<int>(mileage);
    map['result'] = Variable<String>(result);
    map['advisories'] = Variable<String>(advisories);
    return map;
  }

  MOTRecordsCompanion toCompanion(bool nullToAbsent) {
    return MOTRecordsCompanion(
      id: Value(id),
      vehicleId: Value(vehicleId),
      testDate: Value(testDate),
      expiryDate: Value(expiryDate),
      testCentre: Value(testCentre),
      mileage: Value(mileage),
      result: Value(result),
      advisories: Value(advisories),
    );
  }

  factory MOTRecordRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return MOTRecordRow(
      id: serializer.fromJson<String>(json['id']),
      vehicleId: serializer.fromJson<String>(json['vehicleId']),
      testDate: serializer.fromJson<String>(json['testDate']),
      expiryDate: serializer.fromJson<String>(json['expiryDate']),
      testCentre: serializer.fromJson<String>(json['testCentre']),
      mileage: serializer.fromJson<int>(json['mileage']),
      result: serializer.fromJson<String>(json['result']),
      advisories: serializer.fromJson<String>(json['advisories']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'vehicleId': serializer.toJson<String>(vehicleId),
      'testDate': serializer.toJson<String>(testDate),
      'expiryDate': serializer.toJson<String>(expiryDate),
      'testCentre': serializer.toJson<String>(testCentre),
      'mileage': serializer.toJson<int>(mileage),
      'result': serializer.toJson<String>(result),
      'advisories': serializer.toJson<String>(advisories),
    };
  }

  MOTRecordRow copyWith({
    String? id,
    String? vehicleId,
    String? testDate,
    String? expiryDate,
    String? testCentre,
    int? mileage,
    String? result,
    String? advisories,
  }) => MOTRecordRow(
    id: id ?? this.id,
    vehicleId: vehicleId ?? this.vehicleId,
    testDate: testDate ?? this.testDate,
    expiryDate: expiryDate ?? this.expiryDate,
    testCentre: testCentre ?? this.testCentre,
    mileage: mileage ?? this.mileage,
    result: result ?? this.result,
    advisories: advisories ?? this.advisories,
  );
  MOTRecordRow copyWithCompanion(MOTRecordsCompanion data) {
    return MOTRecordRow(
      id: data.id.present ? data.id.value : this.id,
      vehicleId: data.vehicleId.present ? data.vehicleId.value : this.vehicleId,
      testDate: data.testDate.present ? data.testDate.value : this.testDate,
      expiryDate: data.expiryDate.present
          ? data.expiryDate.value
          : this.expiryDate,
      testCentre: data.testCentre.present
          ? data.testCentre.value
          : this.testCentre,
      mileage: data.mileage.present ? data.mileage.value : this.mileage,
      result: data.result.present ? data.result.value : this.result,
      advisories: data.advisories.present
          ? data.advisories.value
          : this.advisories,
    );
  }

  @override
  String toString() {
    return (StringBuffer('MOTRecordRow(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('testDate: $testDate, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('testCentre: $testCentre, ')
          ..write('mileage: $mileage, ')
          ..write('result: $result, ')
          ..write('advisories: $advisories')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    vehicleId,
    testDate,
    expiryDate,
    testCentre,
    mileage,
    result,
    advisories,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is MOTRecordRow &&
          other.id == this.id &&
          other.vehicleId == this.vehicleId &&
          other.testDate == this.testDate &&
          other.expiryDate == this.expiryDate &&
          other.testCentre == this.testCentre &&
          other.mileage == this.mileage &&
          other.result == this.result &&
          other.advisories == this.advisories);
}

class MOTRecordsCompanion extends UpdateCompanion<MOTRecordRow> {
  final Value<String> id;
  final Value<String> vehicleId;
  final Value<String> testDate;
  final Value<String> expiryDate;
  final Value<String> testCentre;
  final Value<int> mileage;
  final Value<String> result;
  final Value<String> advisories;
  final Value<int> rowid;
  const MOTRecordsCompanion({
    this.id = const Value.absent(),
    this.vehicleId = const Value.absent(),
    this.testDate = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.testCentre = const Value.absent(),
    this.mileage = const Value.absent(),
    this.result = const Value.absent(),
    this.advisories = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  MOTRecordsCompanion.insert({
    required String id,
    required String vehicleId,
    this.testDate = const Value.absent(),
    this.expiryDate = const Value.absent(),
    this.testCentre = const Value.absent(),
    this.mileage = const Value.absent(),
    this.result = const Value.absent(),
    this.advisories = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id),
       vehicleId = Value(vehicleId);
  static Insertable<MOTRecordRow> custom({
    Expression<String>? id,
    Expression<String>? vehicleId,
    Expression<String>? testDate,
    Expression<String>? expiryDate,
    Expression<String>? testCentre,
    Expression<int>? mileage,
    Expression<String>? result,
    Expression<String>? advisories,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (vehicleId != null) 'vehicle_id': vehicleId,
      if (testDate != null) 'test_date': testDate,
      if (expiryDate != null) 'expiry_date': expiryDate,
      if (testCentre != null) 'test_centre': testCentre,
      if (mileage != null) 'mileage': mileage,
      if (result != null) 'result': result,
      if (advisories != null) 'advisories': advisories,
      if (rowid != null) 'rowid': rowid,
    });
  }

  MOTRecordsCompanion copyWith({
    Value<String>? id,
    Value<String>? vehicleId,
    Value<String>? testDate,
    Value<String>? expiryDate,
    Value<String>? testCentre,
    Value<int>? mileage,
    Value<String>? result,
    Value<String>? advisories,
    Value<int>? rowid,
  }) {
    return MOTRecordsCompanion(
      id: id ?? this.id,
      vehicleId: vehicleId ?? this.vehicleId,
      testDate: testDate ?? this.testDate,
      expiryDate: expiryDate ?? this.expiryDate,
      testCentre: testCentre ?? this.testCentre,
      mileage: mileage ?? this.mileage,
      result: result ?? this.result,
      advisories: advisories ?? this.advisories,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (vehicleId.present) {
      map['vehicle_id'] = Variable<String>(vehicleId.value);
    }
    if (testDate.present) {
      map['test_date'] = Variable<String>(testDate.value);
    }
    if (expiryDate.present) {
      map['expiry_date'] = Variable<String>(expiryDate.value);
    }
    if (testCentre.present) {
      map['test_centre'] = Variable<String>(testCentre.value);
    }
    if (mileage.present) {
      map['mileage'] = Variable<int>(mileage.value);
    }
    if (result.present) {
      map['result'] = Variable<String>(result.value);
    }
    if (advisories.present) {
      map['advisories'] = Variable<String>(advisories.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('MOTRecordsCompanion(')
          ..write('id: $id, ')
          ..write('vehicleId: $vehicleId, ')
          ..write('testDate: $testDate, ')
          ..write('expiryDate: $expiryDate, ')
          ..write('testCentre: $testCentre, ')
          ..write('mileage: $mileage, ')
          ..write('result: $result, ')
          ..write('advisories: $advisories, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DocumentRefsTable extends DocumentRefs
    with TableInfo<$DocumentRefsTable, DocumentRefRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DocumentRefsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _parentTypeMeta = const VerificationMeta(
    'parentType',
  );
  @override
  late final GeneratedColumn<String> parentType = GeneratedColumn<String>(
    'parent_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant('vehicle'),
  );
  static const VerificationMeta _parentIdMeta = const VerificationMeta(
    'parentId',
  );
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
    'parent_id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _filenameMeta = const VerificationMeta(
    'filename',
  );
  @override
  late final GeneratedColumn<String> filename = GeneratedColumn<String>(
    'filename',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _localPathMeta = const VerificationMeta(
    'localPath',
  );
  @override
  late final GeneratedColumn<String> localPath = GeneratedColumn<String>(
    'local_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _fileTypeMeta = const VerificationMeta(
    'fileType',
  );
  @override
  late final GeneratedColumn<String> fileType = GeneratedColumn<String>(
    'file_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _addedDateMeta = const VerificationMeta(
    'addedDate',
  );
  @override
  late final GeneratedColumn<String> addedDate = GeneratedColumn<String>(
    'added_date',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    parentType,
    parentId,
    filename,
    localPath,
    fileType,
    addedDate,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'document_refs';
  @override
  VerificationContext validateIntegrity(
    Insertable<DocumentRefRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('parent_type')) {
      context.handle(
        _parentTypeMeta,
        parentType.isAcceptableOrUnknown(data['parent_type']!, _parentTypeMeta),
      );
    }
    if (data.containsKey('parent_id')) {
      context.handle(
        _parentIdMeta,
        parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta),
      );
    }
    if (data.containsKey('filename')) {
      context.handle(
        _filenameMeta,
        filename.isAcceptableOrUnknown(data['filename']!, _filenameMeta),
      );
    }
    if (data.containsKey('local_path')) {
      context.handle(
        _localPathMeta,
        localPath.isAcceptableOrUnknown(data['local_path']!, _localPathMeta),
      );
    }
    if (data.containsKey('file_type')) {
      context.handle(
        _fileTypeMeta,
        fileType.isAcceptableOrUnknown(data['file_type']!, _fileTypeMeta),
      );
    }
    if (data.containsKey('added_date')) {
      context.handle(
        _addedDateMeta,
        addedDate.isAcceptableOrUnknown(data['added_date']!, _addedDateMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DocumentRefRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DocumentRefRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      parentType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_type'],
      )!,
      parentId: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}parent_id'],
      )!,
      filename: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}filename'],
      )!,
      localPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}local_path'],
      )!,
      fileType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}file_type'],
      )!,
      addedDate: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}added_date'],
      )!,
    );
  }

  @override
  $DocumentRefsTable createAlias(String alias) {
    return $DocumentRefsTable(attachedDatabase, alias);
  }
}

class DocumentRefRow extends DataClass implements Insertable<DocumentRefRow> {
  final String id;
  final String parentType;
  final String parentId;
  final String filename;
  final String localPath;
  final String fileType;
  final String addedDate;
  const DocumentRefRow({
    required this.id,
    required this.parentType,
    required this.parentId,
    required this.filename,
    required this.localPath,
    required this.fileType,
    required this.addedDate,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['parent_type'] = Variable<String>(parentType);
    map['parent_id'] = Variable<String>(parentId);
    map['filename'] = Variable<String>(filename);
    map['local_path'] = Variable<String>(localPath);
    map['file_type'] = Variable<String>(fileType);
    map['added_date'] = Variable<String>(addedDate);
    return map;
  }

  DocumentRefsCompanion toCompanion(bool nullToAbsent) {
    return DocumentRefsCompanion(
      id: Value(id),
      parentType: Value(parentType),
      parentId: Value(parentId),
      filename: Value(filename),
      localPath: Value(localPath),
      fileType: Value(fileType),
      addedDate: Value(addedDate),
    );
  }

  factory DocumentRefRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DocumentRefRow(
      id: serializer.fromJson<String>(json['id']),
      parentType: serializer.fromJson<String>(json['parentType']),
      parentId: serializer.fromJson<String>(json['parentId']),
      filename: serializer.fromJson<String>(json['filename']),
      localPath: serializer.fromJson<String>(json['localPath']),
      fileType: serializer.fromJson<String>(json['fileType']),
      addedDate: serializer.fromJson<String>(json['addedDate']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'parentType': serializer.toJson<String>(parentType),
      'parentId': serializer.toJson<String>(parentId),
      'filename': serializer.toJson<String>(filename),
      'localPath': serializer.toJson<String>(localPath),
      'fileType': serializer.toJson<String>(fileType),
      'addedDate': serializer.toJson<String>(addedDate),
    };
  }

  DocumentRefRow copyWith({
    String? id,
    String? parentType,
    String? parentId,
    String? filename,
    String? localPath,
    String? fileType,
    String? addedDate,
  }) => DocumentRefRow(
    id: id ?? this.id,
    parentType: parentType ?? this.parentType,
    parentId: parentId ?? this.parentId,
    filename: filename ?? this.filename,
    localPath: localPath ?? this.localPath,
    fileType: fileType ?? this.fileType,
    addedDate: addedDate ?? this.addedDate,
  );
  DocumentRefRow copyWithCompanion(DocumentRefsCompanion data) {
    return DocumentRefRow(
      id: data.id.present ? data.id.value : this.id,
      parentType: data.parentType.present
          ? data.parentType.value
          : this.parentType,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      filename: data.filename.present ? data.filename.value : this.filename,
      localPath: data.localPath.present ? data.localPath.value : this.localPath,
      fileType: data.fileType.present ? data.fileType.value : this.fileType,
      addedDate: data.addedDate.present ? data.addedDate.value : this.addedDate,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DocumentRefRow(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('filename: $filename, ')
          ..write('localPath: $localPath, ')
          ..write('fileType: $fileType, ')
          ..write('addedDate: $addedDate')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    parentType,
    parentId,
    filename,
    localPath,
    fileType,
    addedDate,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DocumentRefRow &&
          other.id == this.id &&
          other.parentType == this.parentType &&
          other.parentId == this.parentId &&
          other.filename == this.filename &&
          other.localPath == this.localPath &&
          other.fileType == this.fileType &&
          other.addedDate == this.addedDate);
}

class DocumentRefsCompanion extends UpdateCompanion<DocumentRefRow> {
  final Value<String> id;
  final Value<String> parentType;
  final Value<String> parentId;
  final Value<String> filename;
  final Value<String> localPath;
  final Value<String> fileType;
  final Value<String> addedDate;
  final Value<int> rowid;
  const DocumentRefsCompanion({
    this.id = const Value.absent(),
    this.parentType = const Value.absent(),
    this.parentId = const Value.absent(),
    this.filename = const Value.absent(),
    this.localPath = const Value.absent(),
    this.fileType = const Value.absent(),
    this.addedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DocumentRefsCompanion.insert({
    required String id,
    this.parentType = const Value.absent(),
    this.parentId = const Value.absent(),
    this.filename = const Value.absent(),
    this.localPath = const Value.absent(),
    this.fileType = const Value.absent(),
    this.addedDate = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<DocumentRefRow> custom({
    Expression<String>? id,
    Expression<String>? parentType,
    Expression<String>? parentId,
    Expression<String>? filename,
    Expression<String>? localPath,
    Expression<String>? fileType,
    Expression<String>? addedDate,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (parentType != null) 'parent_type': parentType,
      if (parentId != null) 'parent_id': parentId,
      if (filename != null) 'filename': filename,
      if (localPath != null) 'local_path': localPath,
      if (fileType != null) 'file_type': fileType,
      if (addedDate != null) 'added_date': addedDate,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DocumentRefsCompanion copyWith({
    Value<String>? id,
    Value<String>? parentType,
    Value<String>? parentId,
    Value<String>? filename,
    Value<String>? localPath,
    Value<String>? fileType,
    Value<String>? addedDate,
    Value<int>? rowid,
  }) {
    return DocumentRefsCompanion(
      id: id ?? this.id,
      parentType: parentType ?? this.parentType,
      parentId: parentId ?? this.parentId,
      filename: filename ?? this.filename,
      localPath: localPath ?? this.localPath,
      fileType: fileType ?? this.fileType,
      addedDate: addedDate ?? this.addedDate,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (parentType.present) {
      map['parent_type'] = Variable<String>(parentType.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (filename.present) {
      map['filename'] = Variable<String>(filename.value);
    }
    if (localPath.present) {
      map['local_path'] = Variable<String>(localPath.value);
    }
    if (fileType.present) {
      map['file_type'] = Variable<String>(fileType.value);
    }
    if (addedDate.present) {
      map['added_date'] = Variable<String>(addedDate.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DocumentRefsCompanion(')
          ..write('id: $id, ')
          ..write('parentType: $parentType, ')
          ..write('parentId: $parentId, ')
          ..write('filename: $filename, ')
          ..write('localPath: $localPath, ')
          ..write('fileType: $fileType, ')
          ..write('addedDate: $addedDate, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DriverProfilesTable extends DriverProfiles
    with TableInfo<$DriverProfilesTable, DriverProfileRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DriverProfilesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
    'id',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
    'name',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _licenceNumberMeta = const VerificationMeta(
    'licenceNumber',
  );
  @override
  late final GeneratedColumn<String> licenceNumber = GeneratedColumn<String>(
    'licence_number',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _licenceExpiryMeta = const VerificationMeta(
    'licenceExpiry',
  );
  @override
  late final GeneratedColumn<String> licenceExpiry = GeneratedColumn<String>(
    'licence_expiry',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _licenceCategoriesMeta = const VerificationMeta(
    'licenceCategories',
  );
  @override
  late final GeneratedColumn<String> licenceCategories =
      GeneratedColumn<String>(
        'licence_categories',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _addressMeta = const VerificationMeta(
    'address',
  );
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
    'address',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _emergencyContactNameMeta =
      const VerificationMeta('emergencyContactName');
  @override
  late final GeneratedColumn<String> emergencyContactName =
      GeneratedColumn<String>(
        'emergency_contact_name',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _emergencyContactPhoneMeta =
      const VerificationMeta('emergencyContactPhone');
  @override
  late final GeneratedColumn<String> emergencyContactPhone =
      GeneratedColumn<String>(
        'emergency_contact_phone',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _bloodTypeMeta = const VerificationMeta(
    'bloodType',
  );
  @override
  late final GeneratedColumn<String> bloodType = GeneratedColumn<String>(
    'blood_type',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _photoPathMeta = const VerificationMeta(
    'photoPath',
  );
  @override
  late final GeneratedColumn<String> photoPath = GeneratedColumn<String>(
    'photo_path',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _licencePhotoFrontMeta = const VerificationMeta(
    'licencePhotoFront',
  );
  @override
  late final GeneratedColumn<String> licencePhotoFront =
      GeneratedColumn<String>(
        'licence_photo_front',
        aliasedName,
        false,
        type: DriftSqlType.string,
        requiredDuringInsert: false,
        defaultValue: const Constant(''),
      );
  static const VerificationMeta _licencePhotoBackMeta = const VerificationMeta(
    'licencePhotoBack',
  );
  @override
  late final GeneratedColumn<String> licencePhotoBack = GeneratedColumn<String>(
    'licence_photo_back',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
    'notes',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: false,
    defaultValue: const Constant(''),
  );
  @override
  List<GeneratedColumn> get $columns => [
    id,
    name,
    licenceNumber,
    licenceExpiry,
    licenceCategories,
    address,
    emergencyContactName,
    emergencyContactPhone,
    bloodType,
    photoPath,
    licencePhotoFront,
    licencePhotoBack,
    notes,
  ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'driver_profiles';
  @override
  VerificationContext validateIntegrity(
    Insertable<DriverProfileRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
        _nameMeta,
        name.isAcceptableOrUnknown(data['name']!, _nameMeta),
      );
    }
    if (data.containsKey('licence_number')) {
      context.handle(
        _licenceNumberMeta,
        licenceNumber.isAcceptableOrUnknown(
          data['licence_number']!,
          _licenceNumberMeta,
        ),
      );
    }
    if (data.containsKey('licence_expiry')) {
      context.handle(
        _licenceExpiryMeta,
        licenceExpiry.isAcceptableOrUnknown(
          data['licence_expiry']!,
          _licenceExpiryMeta,
        ),
      );
    }
    if (data.containsKey('licence_categories')) {
      context.handle(
        _licenceCategoriesMeta,
        licenceCategories.isAcceptableOrUnknown(
          data['licence_categories']!,
          _licenceCategoriesMeta,
        ),
      );
    }
    if (data.containsKey('address')) {
      context.handle(
        _addressMeta,
        address.isAcceptableOrUnknown(data['address']!, _addressMeta),
      );
    }
    if (data.containsKey('emergency_contact_name')) {
      context.handle(
        _emergencyContactNameMeta,
        emergencyContactName.isAcceptableOrUnknown(
          data['emergency_contact_name']!,
          _emergencyContactNameMeta,
        ),
      );
    }
    if (data.containsKey('emergency_contact_phone')) {
      context.handle(
        _emergencyContactPhoneMeta,
        emergencyContactPhone.isAcceptableOrUnknown(
          data['emergency_contact_phone']!,
          _emergencyContactPhoneMeta,
        ),
      );
    }
    if (data.containsKey('blood_type')) {
      context.handle(
        _bloodTypeMeta,
        bloodType.isAcceptableOrUnknown(data['blood_type']!, _bloodTypeMeta),
      );
    }
    if (data.containsKey('photo_path')) {
      context.handle(
        _photoPathMeta,
        photoPath.isAcceptableOrUnknown(data['photo_path']!, _photoPathMeta),
      );
    }
    if (data.containsKey('licence_photo_front')) {
      context.handle(
        _licencePhotoFrontMeta,
        licencePhotoFront.isAcceptableOrUnknown(
          data['licence_photo_front']!,
          _licencePhotoFrontMeta,
        ),
      );
    }
    if (data.containsKey('licence_photo_back')) {
      context.handle(
        _licencePhotoBackMeta,
        licencePhotoBack.isAcceptableOrUnknown(
          data['licence_photo_back']!,
          _licencePhotoBackMeta,
        ),
      );
    }
    if (data.containsKey('notes')) {
      context.handle(
        _notesMeta,
        notes.isAcceptableOrUnknown(data['notes']!, _notesMeta),
      );
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DriverProfileRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DriverProfileRow(
      id: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}id'],
      )!,
      name: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}name'],
      )!,
      licenceNumber: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}licence_number'],
      )!,
      licenceExpiry: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}licence_expiry'],
      )!,
      licenceCategories: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}licence_categories'],
      )!,
      address: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}address'],
      )!,
      emergencyContactName: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_name'],
      )!,
      emergencyContactPhone: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}emergency_contact_phone'],
      )!,
      bloodType: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}blood_type'],
      )!,
      photoPath: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}photo_path'],
      )!,
      licencePhotoFront: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}licence_photo_front'],
      )!,
      licencePhotoBack: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}licence_photo_back'],
      )!,
      notes: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}notes'],
      )!,
    );
  }

  @override
  $DriverProfilesTable createAlias(String alias) {
    return $DriverProfilesTable(attachedDatabase, alias);
  }
}

class DriverProfileRow extends DataClass
    implements Insertable<DriverProfileRow> {
  final String id;
  final String name;
  final String licenceNumber;
  final String licenceExpiry;
  final String licenceCategories;
  final String address;
  final String emergencyContactName;
  final String emergencyContactPhone;
  final String bloodType;
  final String photoPath;
  final String licencePhotoFront;
  final String licencePhotoBack;
  final String notes;
  const DriverProfileRow({
    required this.id,
    required this.name,
    required this.licenceNumber,
    required this.licenceExpiry,
    required this.licenceCategories,
    required this.address,
    required this.emergencyContactName,
    required this.emergencyContactPhone,
    required this.bloodType,
    required this.photoPath,
    required this.licencePhotoFront,
    required this.licencePhotoBack,
    required this.notes,
  });
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['licence_number'] = Variable<String>(licenceNumber);
    map['licence_expiry'] = Variable<String>(licenceExpiry);
    map['licence_categories'] = Variable<String>(licenceCategories);
    map['address'] = Variable<String>(address);
    map['emergency_contact_name'] = Variable<String>(emergencyContactName);
    map['emergency_contact_phone'] = Variable<String>(emergencyContactPhone);
    map['blood_type'] = Variable<String>(bloodType);
    map['photo_path'] = Variable<String>(photoPath);
    map['licence_photo_front'] = Variable<String>(licencePhotoFront);
    map['licence_photo_back'] = Variable<String>(licencePhotoBack);
    map['notes'] = Variable<String>(notes);
    return map;
  }

  DriverProfilesCompanion toCompanion(bool nullToAbsent) {
    return DriverProfilesCompanion(
      id: Value(id),
      name: Value(name),
      licenceNumber: Value(licenceNumber),
      licenceExpiry: Value(licenceExpiry),
      licenceCategories: Value(licenceCategories),
      address: Value(address),
      emergencyContactName: Value(emergencyContactName),
      emergencyContactPhone: Value(emergencyContactPhone),
      bloodType: Value(bloodType),
      photoPath: Value(photoPath),
      licencePhotoFront: Value(licencePhotoFront),
      licencePhotoBack: Value(licencePhotoBack),
      notes: Value(notes),
    );
  }

  factory DriverProfileRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DriverProfileRow(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      licenceNumber: serializer.fromJson<String>(json['licenceNumber']),
      licenceExpiry: serializer.fromJson<String>(json['licenceExpiry']),
      licenceCategories: serializer.fromJson<String>(json['licenceCategories']),
      address: serializer.fromJson<String>(json['address']),
      emergencyContactName: serializer.fromJson<String>(
        json['emergencyContactName'],
      ),
      emergencyContactPhone: serializer.fromJson<String>(
        json['emergencyContactPhone'],
      ),
      bloodType: serializer.fromJson<String>(json['bloodType']),
      photoPath: serializer.fromJson<String>(json['photoPath']),
      licencePhotoFront: serializer.fromJson<String>(json['licencePhotoFront']),
      licencePhotoBack: serializer.fromJson<String>(json['licencePhotoBack']),
      notes: serializer.fromJson<String>(json['notes']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'licenceNumber': serializer.toJson<String>(licenceNumber),
      'licenceExpiry': serializer.toJson<String>(licenceExpiry),
      'licenceCategories': serializer.toJson<String>(licenceCategories),
      'address': serializer.toJson<String>(address),
      'emergencyContactName': serializer.toJson<String>(emergencyContactName),
      'emergencyContactPhone': serializer.toJson<String>(emergencyContactPhone),
      'bloodType': serializer.toJson<String>(bloodType),
      'photoPath': serializer.toJson<String>(photoPath),
      'licencePhotoFront': serializer.toJson<String>(licencePhotoFront),
      'licencePhotoBack': serializer.toJson<String>(licencePhotoBack),
      'notes': serializer.toJson<String>(notes),
    };
  }

  DriverProfileRow copyWith({
    String? id,
    String? name,
    String? licenceNumber,
    String? licenceExpiry,
    String? licenceCategories,
    String? address,
    String? emergencyContactName,
    String? emergencyContactPhone,
    String? bloodType,
    String? photoPath,
    String? licencePhotoFront,
    String? licencePhotoBack,
    String? notes,
  }) => DriverProfileRow(
    id: id ?? this.id,
    name: name ?? this.name,
    licenceNumber: licenceNumber ?? this.licenceNumber,
    licenceExpiry: licenceExpiry ?? this.licenceExpiry,
    licenceCategories: licenceCategories ?? this.licenceCategories,
    address: address ?? this.address,
    emergencyContactName: emergencyContactName ?? this.emergencyContactName,
    emergencyContactPhone: emergencyContactPhone ?? this.emergencyContactPhone,
    bloodType: bloodType ?? this.bloodType,
    photoPath: photoPath ?? this.photoPath,
    licencePhotoFront: licencePhotoFront ?? this.licencePhotoFront,
    licencePhotoBack: licencePhotoBack ?? this.licencePhotoBack,
    notes: notes ?? this.notes,
  );
  DriverProfileRow copyWithCompanion(DriverProfilesCompanion data) {
    return DriverProfileRow(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      licenceNumber: data.licenceNumber.present
          ? data.licenceNumber.value
          : this.licenceNumber,
      licenceExpiry: data.licenceExpiry.present
          ? data.licenceExpiry.value
          : this.licenceExpiry,
      licenceCategories: data.licenceCategories.present
          ? data.licenceCategories.value
          : this.licenceCategories,
      address: data.address.present ? data.address.value : this.address,
      emergencyContactName: data.emergencyContactName.present
          ? data.emergencyContactName.value
          : this.emergencyContactName,
      emergencyContactPhone: data.emergencyContactPhone.present
          ? data.emergencyContactPhone.value
          : this.emergencyContactPhone,
      bloodType: data.bloodType.present ? data.bloodType.value : this.bloodType,
      photoPath: data.photoPath.present ? data.photoPath.value : this.photoPath,
      licencePhotoFront: data.licencePhotoFront.present
          ? data.licencePhotoFront.value
          : this.licencePhotoFront,
      licencePhotoBack: data.licencePhotoBack.present
          ? data.licencePhotoBack.value
          : this.licencePhotoBack,
      notes: data.notes.present ? data.notes.value : this.notes,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DriverProfileRow(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('licenceNumber: $licenceNumber, ')
          ..write('licenceExpiry: $licenceExpiry, ')
          ..write('licenceCategories: $licenceCategories, ')
          ..write('address: $address, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactPhone: $emergencyContactPhone, ')
          ..write('bloodType: $bloodType, ')
          ..write('photoPath: $photoPath, ')
          ..write('licencePhotoFront: $licencePhotoFront, ')
          ..write('licencePhotoBack: $licencePhotoBack, ')
          ..write('notes: $notes')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
    id,
    name,
    licenceNumber,
    licenceExpiry,
    licenceCategories,
    address,
    emergencyContactName,
    emergencyContactPhone,
    bloodType,
    photoPath,
    licencePhotoFront,
    licencePhotoBack,
    notes,
  );
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DriverProfileRow &&
          other.id == this.id &&
          other.name == this.name &&
          other.licenceNumber == this.licenceNumber &&
          other.licenceExpiry == this.licenceExpiry &&
          other.licenceCategories == this.licenceCategories &&
          other.address == this.address &&
          other.emergencyContactName == this.emergencyContactName &&
          other.emergencyContactPhone == this.emergencyContactPhone &&
          other.bloodType == this.bloodType &&
          other.photoPath == this.photoPath &&
          other.licencePhotoFront == this.licencePhotoFront &&
          other.licencePhotoBack == this.licencePhotoBack &&
          other.notes == this.notes);
}

class DriverProfilesCompanion extends UpdateCompanion<DriverProfileRow> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> licenceNumber;
  final Value<String> licenceExpiry;
  final Value<String> licenceCategories;
  final Value<String> address;
  final Value<String> emergencyContactName;
  final Value<String> emergencyContactPhone;
  final Value<String> bloodType;
  final Value<String> photoPath;
  final Value<String> licencePhotoFront;
  final Value<String> licencePhotoBack;
  final Value<String> notes;
  final Value<int> rowid;
  const DriverProfilesCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.licenceNumber = const Value.absent(),
    this.licenceExpiry = const Value.absent(),
    this.licenceCategories = const Value.absent(),
    this.address = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactPhone = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.licencePhotoFront = const Value.absent(),
    this.licencePhotoBack = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DriverProfilesCompanion.insert({
    required String id,
    this.name = const Value.absent(),
    this.licenceNumber = const Value.absent(),
    this.licenceExpiry = const Value.absent(),
    this.licenceCategories = const Value.absent(),
    this.address = const Value.absent(),
    this.emergencyContactName = const Value.absent(),
    this.emergencyContactPhone = const Value.absent(),
    this.bloodType = const Value.absent(),
    this.photoPath = const Value.absent(),
    this.licencePhotoFront = const Value.absent(),
    this.licencePhotoBack = const Value.absent(),
    this.notes = const Value.absent(),
    this.rowid = const Value.absent(),
  }) : id = Value(id);
  static Insertable<DriverProfileRow> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? licenceNumber,
    Expression<String>? licenceExpiry,
    Expression<String>? licenceCategories,
    Expression<String>? address,
    Expression<String>? emergencyContactName,
    Expression<String>? emergencyContactPhone,
    Expression<String>? bloodType,
    Expression<String>? photoPath,
    Expression<String>? licencePhotoFront,
    Expression<String>? licencePhotoBack,
    Expression<String>? notes,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (licenceNumber != null) 'licence_number': licenceNumber,
      if (licenceExpiry != null) 'licence_expiry': licenceExpiry,
      if (licenceCategories != null) 'licence_categories': licenceCategories,
      if (address != null) 'address': address,
      if (emergencyContactName != null)
        'emergency_contact_name': emergencyContactName,
      if (emergencyContactPhone != null)
        'emergency_contact_phone': emergencyContactPhone,
      if (bloodType != null) 'blood_type': bloodType,
      if (photoPath != null) 'photo_path': photoPath,
      if (licencePhotoFront != null) 'licence_photo_front': licencePhotoFront,
      if (licencePhotoBack != null) 'licence_photo_back': licencePhotoBack,
      if (notes != null) 'notes': notes,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DriverProfilesCompanion copyWith({
    Value<String>? id,
    Value<String>? name,
    Value<String>? licenceNumber,
    Value<String>? licenceExpiry,
    Value<String>? licenceCategories,
    Value<String>? address,
    Value<String>? emergencyContactName,
    Value<String>? emergencyContactPhone,
    Value<String>? bloodType,
    Value<String>? photoPath,
    Value<String>? licencePhotoFront,
    Value<String>? licencePhotoBack,
    Value<String>? notes,
    Value<int>? rowid,
  }) {
    return DriverProfilesCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      licenceNumber: licenceNumber ?? this.licenceNumber,
      licenceExpiry: licenceExpiry ?? this.licenceExpiry,
      licenceCategories: licenceCategories ?? this.licenceCategories,
      address: address ?? this.address,
      emergencyContactName: emergencyContactName ?? this.emergencyContactName,
      emergencyContactPhone:
          emergencyContactPhone ?? this.emergencyContactPhone,
      bloodType: bloodType ?? this.bloodType,
      photoPath: photoPath ?? this.photoPath,
      licencePhotoFront: licencePhotoFront ?? this.licencePhotoFront,
      licencePhotoBack: licencePhotoBack ?? this.licencePhotoBack,
      notes: notes ?? this.notes,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (licenceNumber.present) {
      map['licence_number'] = Variable<String>(licenceNumber.value);
    }
    if (licenceExpiry.present) {
      map['licence_expiry'] = Variable<String>(licenceExpiry.value);
    }
    if (licenceCategories.present) {
      map['licence_categories'] = Variable<String>(licenceCategories.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (emergencyContactName.present) {
      map['emergency_contact_name'] = Variable<String>(
        emergencyContactName.value,
      );
    }
    if (emergencyContactPhone.present) {
      map['emergency_contact_phone'] = Variable<String>(
        emergencyContactPhone.value,
      );
    }
    if (bloodType.present) {
      map['blood_type'] = Variable<String>(bloodType.value);
    }
    if (photoPath.present) {
      map['photo_path'] = Variable<String>(photoPath.value);
    }
    if (licencePhotoFront.present) {
      map['licence_photo_front'] = Variable<String>(licencePhotoFront.value);
    }
    if (licencePhotoBack.present) {
      map['licence_photo_back'] = Variable<String>(licencePhotoBack.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DriverProfilesCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('licenceNumber: $licenceNumber, ')
          ..write('licenceExpiry: $licenceExpiry, ')
          ..write('licenceCategories: $licenceCategories, ')
          ..write('address: $address, ')
          ..write('emergencyContactName: $emergencyContactName, ')
          ..write('emergencyContactPhone: $emergencyContactPhone, ')
          ..write('bloodType: $bloodType, ')
          ..write('photoPath: $photoPath, ')
          ..write('licencePhotoFront: $licencePhotoFront, ')
          ..write('licencePhotoBack: $licencePhotoBack, ')
          ..write('notes: $notes, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AppSettingsTable extends AppSettings
    with TableInfo<$AppSettingsTable, AppSettingRow> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AppSettingsTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _keyMeta = const VerificationMeta('key');
  @override
  late final GeneratedColumn<String> key = GeneratedColumn<String>(
    'key',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<String> value = GeneratedColumn<String>(
    'value',
    aliasedName,
    false,
    type: DriftSqlType.string,
    requiredDuringInsert: true,
  );
  @override
  List<GeneratedColumn> get $columns => [key, value];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'app_settings';
  @override
  VerificationContext validateIntegrity(
    Insertable<AppSettingRow> instance, {
    bool isInserting = false,
  }) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('key')) {
      context.handle(
        _keyMeta,
        key.isAcceptableOrUnknown(data['key']!, _keyMeta),
      );
    } else if (isInserting) {
      context.missing(_keyMeta);
    }
    if (data.containsKey('value')) {
      context.handle(
        _valueMeta,
        value.isAcceptableOrUnknown(data['value']!, _valueMeta),
      );
    } else if (isInserting) {
      context.missing(_valueMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {key};
  @override
  AppSettingRow map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AppSettingRow(
      key: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}key'],
      )!,
      value: attachedDatabase.typeMapping.read(
        DriftSqlType.string,
        data['${effectivePrefix}value'],
      )!,
    );
  }

  @override
  $AppSettingsTable createAlias(String alias) {
    return $AppSettingsTable(attachedDatabase, alias);
  }
}

class AppSettingRow extends DataClass implements Insertable<AppSettingRow> {
  final String key;
  final String value;
  const AppSettingRow({required this.key, required this.value});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['key'] = Variable<String>(key);
    map['value'] = Variable<String>(value);
    return map;
  }

  AppSettingsCompanion toCompanion(bool nullToAbsent) {
    return AppSettingsCompanion(key: Value(key), value: Value(value));
  }

  factory AppSettingRow.fromJson(
    Map<String, dynamic> json, {
    ValueSerializer? serializer,
  }) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AppSettingRow(
      key: serializer.fromJson<String>(json['key']),
      value: serializer.fromJson<String>(json['value']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'key': serializer.toJson<String>(key),
      'value': serializer.toJson<String>(value),
    };
  }

  AppSettingRow copyWith({String? key, String? value}) =>
      AppSettingRow(key: key ?? this.key, value: value ?? this.value);
  AppSettingRow copyWithCompanion(AppSettingsCompanion data) {
    return AppSettingRow(
      key: data.key.present ? data.key.value : this.key,
      value: data.value.present ? data.value.value : this.value,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingRow(')
          ..write('key: $key, ')
          ..write('value: $value')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(key, value);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AppSettingRow &&
          other.key == this.key &&
          other.value == this.value);
}

class AppSettingsCompanion extends UpdateCompanion<AppSettingRow> {
  final Value<String> key;
  final Value<String> value;
  final Value<int> rowid;
  const AppSettingsCompanion({
    this.key = const Value.absent(),
    this.value = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AppSettingsCompanion.insert({
    required String key,
    required String value,
    this.rowid = const Value.absent(),
  }) : key = Value(key),
       value = Value(value);
  static Insertable<AppSettingRow> custom({
    Expression<String>? key,
    Expression<String>? value,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (key != null) 'key': key,
      if (value != null) 'value': value,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AppSettingsCompanion copyWith({
    Value<String>? key,
    Value<String>? value,
    Value<int>? rowid,
  }) {
    return AppSettingsCompanion(
      key: key ?? this.key,
      value: value ?? this.value,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (key.present) {
      map['key'] = Variable<String>(key.value);
    }
    if (value.present) {
      map['value'] = Variable<String>(value.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AppSettingsCompanion(')
          ..write('key: $key, ')
          ..write('value: $value, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $VehiclesTable vehicles = $VehiclesTable(this);
  late final $ServiceEntriesTable serviceEntries = $ServiceEntriesTable(this);
  late final $MOTRecordsTable mOTRecords = $MOTRecordsTable(this);
  late final $DocumentRefsTable documentRefs = $DocumentRefsTable(this);
  late final $DriverProfilesTable driverProfiles = $DriverProfilesTable(this);
  late final $AppSettingsTable appSettings = $AppSettingsTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
    vehicles,
    serviceEntries,
    mOTRecords,
    documentRefs,
    driverProfiles,
    appSettings,
  ];
}

typedef $$VehiclesTableCreateCompanionBuilder =
    VehiclesCompanion Function({
      required String id,
      Value<String> registration,
      Value<String> make,
      Value<String> model,
      Value<String> year,
      Value<String> colour,
      Value<String> fuelType,
      Value<String> transmission,
      Value<String> vin,
      Value<String> variant,
      Value<String> bodyType,
      Value<String> engineCC,
      Value<String> engineNumber,
      Value<String> keyNumber,
      Value<String> chassisNumber,
      Value<String> radioCode,
      Value<String> description,
      Value<String> purchaseDate,
      Value<double> purchasePrice,
      Value<String> purchasedFrom,
      Value<String> ownership,
      Value<String> financeCompany,
      Value<String> agreementNumber,
      Value<double> deposit,
      Value<double> monthlyPayment,
      Value<String> financeStartDate,
      Value<String> financeEndDate,
      Value<double> balloonPayment,
      Value<int> annualMileageAllowance,
      Value<int> numberOfPayments,
      Value<String> lessor,
      Value<String> agreementHolder,
      Value<String> ownershipNotes,
      Value<String> insurer,
      Value<String> insurancePolicyNumber,
      Value<String> insuranceRenewalDate,
      Value<String> insuranceType,
      Value<String> insuredDrivers,
      Value<double> insuranceAnnualCost,
      Value<String> breakdownProvider,
      Value<String> breakdownMembershipNumber,
      Value<String> breakdownContact,
      Value<String> breakdownNotes,
      Value<String> recoveryProvider,
      Value<String> recoveryArrangedVia,
      Value<String> recoveryReference,
      Value<String> recoveryContact,
      Value<String> recoveryNotes,
      Value<String> motDueDate,
      Value<String> taxDueDate,
      Value<int> currentMileage,
      Value<String> notes,
      Value<bool> dvlaVerified,
      Value<String> taxStatus,
      Value<String> motStatus,
      Value<String> photoPath,
      Value<int> rowid,
    });
typedef $$VehiclesTableUpdateCompanionBuilder =
    VehiclesCompanion Function({
      Value<String> id,
      Value<String> registration,
      Value<String> make,
      Value<String> model,
      Value<String> year,
      Value<String> colour,
      Value<String> fuelType,
      Value<String> transmission,
      Value<String> vin,
      Value<String> variant,
      Value<String> bodyType,
      Value<String> engineCC,
      Value<String> engineNumber,
      Value<String> keyNumber,
      Value<String> chassisNumber,
      Value<String> radioCode,
      Value<String> description,
      Value<String> purchaseDate,
      Value<double> purchasePrice,
      Value<String> purchasedFrom,
      Value<String> ownership,
      Value<String> financeCompany,
      Value<String> agreementNumber,
      Value<double> deposit,
      Value<double> monthlyPayment,
      Value<String> financeStartDate,
      Value<String> financeEndDate,
      Value<double> balloonPayment,
      Value<int> annualMileageAllowance,
      Value<int> numberOfPayments,
      Value<String> lessor,
      Value<String> agreementHolder,
      Value<String> ownershipNotes,
      Value<String> insurer,
      Value<String> insurancePolicyNumber,
      Value<String> insuranceRenewalDate,
      Value<String> insuranceType,
      Value<String> insuredDrivers,
      Value<double> insuranceAnnualCost,
      Value<String> breakdownProvider,
      Value<String> breakdownMembershipNumber,
      Value<String> breakdownContact,
      Value<String> breakdownNotes,
      Value<String> recoveryProvider,
      Value<String> recoveryArrangedVia,
      Value<String> recoveryReference,
      Value<String> recoveryContact,
      Value<String> recoveryNotes,
      Value<String> motDueDate,
      Value<String> taxDueDate,
      Value<int> currentMileage,
      Value<String> notes,
      Value<bool> dvlaVerified,
      Value<String> taxStatus,
      Value<String> motStatus,
      Value<String> photoPath,
      Value<int> rowid,
    });

final class $$VehiclesTableReferences
    extends BaseReferences<_$AppDatabase, $VehiclesTable, VehicleRow> {
  $$VehiclesTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ServiceEntriesTable, List<ServiceEntryRow>>
  _serviceEntriesRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.serviceEntries,
    aliasName: $_aliasNameGenerator(
      db.vehicles.id,
      db.serviceEntries.vehicleId,
    ),
  );

  $$ServiceEntriesTableProcessedTableManager get serviceEntriesRefs {
    final manager = $$ServiceEntriesTableTableManager(
      $_db,
      $_db.serviceEntries,
    ).filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_serviceEntriesRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }

  static MultiTypedResultKey<$MOTRecordsTable, List<MOTRecordRow>>
  _mOTRecordsRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
    db.mOTRecords,
    aliasName: $_aliasNameGenerator(db.vehicles.id, db.mOTRecords.vehicleId),
  );

  $$MOTRecordsTableProcessedTableManager get mOTRecordsRefs {
    final manager = $$MOTRecordsTableTableManager(
      $_db,
      $_db.mOTRecords,
    ).filter((f) => f.vehicleId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_mOTRecordsRefsTable($_db));
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: cache),
    );
  }
}

class $$VehiclesTableFilterComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get registration => $composableBuilder(
    column: $table.registration,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get make => $composableBuilder(
    column: $table.make,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get colour => $composableBuilder(
    column: $table.colour,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fuelType => $composableBuilder(
    column: $table.fuelType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get transmission => $composableBuilder(
    column: $table.transmission,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get vin => $composableBuilder(
    column: $table.vin,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get variant => $composableBuilder(
    column: $table.variant,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bodyType => $composableBuilder(
    column: $table.bodyType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get engineCC => $composableBuilder(
    column: $table.engineCC,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get engineNumber => $composableBuilder(
    column: $table.engineNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get keyNumber => $composableBuilder(
    column: $table.keyNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get chassisNumber => $composableBuilder(
    column: $table.chassisNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get radioCode => $composableBuilder(
    column: $table.radioCode,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get purchasedFrom => $composableBuilder(
    column: $table.purchasedFrom,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownership => $composableBuilder(
    column: $table.ownership,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get financeCompany => $composableBuilder(
    column: $table.financeCompany,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get agreementNumber => $composableBuilder(
    column: $table.agreementNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get deposit => $composableBuilder(
    column: $table.deposit,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get monthlyPayment => $composableBuilder(
    column: $table.monthlyPayment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get financeStartDate => $composableBuilder(
    column: $table.financeStartDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get financeEndDate => $composableBuilder(
    column: $table.financeEndDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get balloonPayment => $composableBuilder(
    column: $table.balloonPayment,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get annualMileageAllowance => $composableBuilder(
    column: $table.annualMileageAllowance,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get numberOfPayments => $composableBuilder(
    column: $table.numberOfPayments,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get lessor => $composableBuilder(
    column: $table.lessor,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get agreementHolder => $composableBuilder(
    column: $table.agreementHolder,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get ownershipNotes => $composableBuilder(
    column: $table.ownershipNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get insurer => $composableBuilder(
    column: $table.insurer,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get insurancePolicyNumber => $composableBuilder(
    column: $table.insurancePolicyNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get insuranceRenewalDate => $composableBuilder(
    column: $table.insuranceRenewalDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get insuranceType => $composableBuilder(
    column: $table.insuranceType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get insuredDrivers => $composableBuilder(
    column: $table.insuredDrivers,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get insuranceAnnualCost => $composableBuilder(
    column: $table.insuranceAnnualCost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breakdownProvider => $composableBuilder(
    column: $table.breakdownProvider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breakdownMembershipNumber => $composableBuilder(
    column: $table.breakdownMembershipNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breakdownContact => $composableBuilder(
    column: $table.breakdownContact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get breakdownNotes => $composableBuilder(
    column: $table.breakdownNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recoveryProvider => $composableBuilder(
    column: $table.recoveryProvider,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recoveryArrangedVia => $composableBuilder(
    column: $table.recoveryArrangedVia,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recoveryReference => $composableBuilder(
    column: $table.recoveryReference,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recoveryContact => $composableBuilder(
    column: $table.recoveryContact,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get recoveryNotes => $composableBuilder(
    column: $table.recoveryNotes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get motDueDate => $composableBuilder(
    column: $table.motDueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxDueDate => $composableBuilder(
    column: $table.taxDueDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get currentMileage => $composableBuilder(
    column: $table.currentMileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<bool> get dvlaVerified => $composableBuilder(
    column: $table.dvlaVerified,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get taxStatus => $composableBuilder(
    column: $table.taxStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get motStatus => $composableBuilder(
    column: $table.motStatus,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  Expression<bool> serviceEntriesRefs(
    Expression<bool> Function($$ServiceEntriesTableFilterComposer f) f,
  ) {
    final $$ServiceEntriesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.serviceEntries,
      getReferencedColumn: (t) => t.vehicleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceEntriesTableFilterComposer(
            $db: $db,
            $table: $db.serviceEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<bool> mOTRecordsRefs(
    Expression<bool> Function($$MOTRecordsTableFilterComposer f) f,
  ) {
    final $$MOTRecordsTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mOTRecords,
      getReferencedColumn: (t) => t.vehicleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MOTRecordsTableFilterComposer(
            $db: $db,
            $table: $db.mOTRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehiclesTableOrderingComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get registration => $composableBuilder(
    column: $table.registration,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get make => $composableBuilder(
    column: $table.make,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get model => $composableBuilder(
    column: $table.model,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get year => $composableBuilder(
    column: $table.year,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get colour => $composableBuilder(
    column: $table.colour,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fuelType => $composableBuilder(
    column: $table.fuelType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get transmission => $composableBuilder(
    column: $table.transmission,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get vin => $composableBuilder(
    column: $table.vin,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get variant => $composableBuilder(
    column: $table.variant,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bodyType => $composableBuilder(
    column: $table.bodyType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get engineCC => $composableBuilder(
    column: $table.engineCC,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get engineNumber => $composableBuilder(
    column: $table.engineNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get keyNumber => $composableBuilder(
    column: $table.keyNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get chassisNumber => $composableBuilder(
    column: $table.chassisNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get radioCode => $composableBuilder(
    column: $table.radioCode,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get purchasedFrom => $composableBuilder(
    column: $table.purchasedFrom,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownership => $composableBuilder(
    column: $table.ownership,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get financeCompany => $composableBuilder(
    column: $table.financeCompany,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get agreementNumber => $composableBuilder(
    column: $table.agreementNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get deposit => $composableBuilder(
    column: $table.deposit,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get monthlyPayment => $composableBuilder(
    column: $table.monthlyPayment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get financeStartDate => $composableBuilder(
    column: $table.financeStartDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get financeEndDate => $composableBuilder(
    column: $table.financeEndDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get balloonPayment => $composableBuilder(
    column: $table.balloonPayment,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get annualMileageAllowance => $composableBuilder(
    column: $table.annualMileageAllowance,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get numberOfPayments => $composableBuilder(
    column: $table.numberOfPayments,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get lessor => $composableBuilder(
    column: $table.lessor,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get agreementHolder => $composableBuilder(
    column: $table.agreementHolder,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get ownershipNotes => $composableBuilder(
    column: $table.ownershipNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get insurer => $composableBuilder(
    column: $table.insurer,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get insurancePolicyNumber => $composableBuilder(
    column: $table.insurancePolicyNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get insuranceRenewalDate => $composableBuilder(
    column: $table.insuranceRenewalDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get insuranceType => $composableBuilder(
    column: $table.insuranceType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get insuredDrivers => $composableBuilder(
    column: $table.insuredDrivers,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get insuranceAnnualCost => $composableBuilder(
    column: $table.insuranceAnnualCost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breakdownProvider => $composableBuilder(
    column: $table.breakdownProvider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breakdownMembershipNumber => $composableBuilder(
    column: $table.breakdownMembershipNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breakdownContact => $composableBuilder(
    column: $table.breakdownContact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get breakdownNotes => $composableBuilder(
    column: $table.breakdownNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recoveryProvider => $composableBuilder(
    column: $table.recoveryProvider,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recoveryArrangedVia => $composableBuilder(
    column: $table.recoveryArrangedVia,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recoveryReference => $composableBuilder(
    column: $table.recoveryReference,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recoveryContact => $composableBuilder(
    column: $table.recoveryContact,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get recoveryNotes => $composableBuilder(
    column: $table.recoveryNotes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get motDueDate => $composableBuilder(
    column: $table.motDueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxDueDate => $composableBuilder(
    column: $table.taxDueDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get currentMileage => $composableBuilder(
    column: $table.currentMileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<bool> get dvlaVerified => $composableBuilder(
    column: $table.dvlaVerified,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get taxStatus => $composableBuilder(
    column: $table.taxStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get motStatus => $composableBuilder(
    column: $table.motStatus,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$VehiclesTableAnnotationComposer
    extends Composer<_$AppDatabase, $VehiclesTable> {
  $$VehiclesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get registration => $composableBuilder(
    column: $table.registration,
    builder: (column) => column,
  );

  GeneratedColumn<String> get make =>
      $composableBuilder(column: $table.make, builder: (column) => column);

  GeneratedColumn<String> get model =>
      $composableBuilder(column: $table.model, builder: (column) => column);

  GeneratedColumn<String> get year =>
      $composableBuilder(column: $table.year, builder: (column) => column);

  GeneratedColumn<String> get colour =>
      $composableBuilder(column: $table.colour, builder: (column) => column);

  GeneratedColumn<String> get fuelType =>
      $composableBuilder(column: $table.fuelType, builder: (column) => column);

  GeneratedColumn<String> get transmission => $composableBuilder(
    column: $table.transmission,
    builder: (column) => column,
  );

  GeneratedColumn<String> get vin =>
      $composableBuilder(column: $table.vin, builder: (column) => column);

  GeneratedColumn<String> get variant =>
      $composableBuilder(column: $table.variant, builder: (column) => column);

  GeneratedColumn<String> get bodyType =>
      $composableBuilder(column: $table.bodyType, builder: (column) => column);

  GeneratedColumn<String> get engineCC =>
      $composableBuilder(column: $table.engineCC, builder: (column) => column);

  GeneratedColumn<String> get engineNumber => $composableBuilder(
    column: $table.engineNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get keyNumber =>
      $composableBuilder(column: $table.keyNumber, builder: (column) => column);

  GeneratedColumn<String> get chassisNumber => $composableBuilder(
    column: $table.chassisNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get radioCode =>
      $composableBuilder(column: $table.radioCode, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<String> get purchaseDate => $composableBuilder(
    column: $table.purchaseDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get purchasePrice => $composableBuilder(
    column: $table.purchasePrice,
    builder: (column) => column,
  );

  GeneratedColumn<String> get purchasedFrom => $composableBuilder(
    column: $table.purchasedFrom,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownership =>
      $composableBuilder(column: $table.ownership, builder: (column) => column);

  GeneratedColumn<String> get financeCompany => $composableBuilder(
    column: $table.financeCompany,
    builder: (column) => column,
  );

  GeneratedColumn<String> get agreementNumber => $composableBuilder(
    column: $table.agreementNumber,
    builder: (column) => column,
  );

  GeneratedColumn<double> get deposit =>
      $composableBuilder(column: $table.deposit, builder: (column) => column);

  GeneratedColumn<double> get monthlyPayment => $composableBuilder(
    column: $table.monthlyPayment,
    builder: (column) => column,
  );

  GeneratedColumn<String> get financeStartDate => $composableBuilder(
    column: $table.financeStartDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get financeEndDate => $composableBuilder(
    column: $table.financeEndDate,
    builder: (column) => column,
  );

  GeneratedColumn<double> get balloonPayment => $composableBuilder(
    column: $table.balloonPayment,
    builder: (column) => column,
  );

  GeneratedColumn<int> get annualMileageAllowance => $composableBuilder(
    column: $table.annualMileageAllowance,
    builder: (column) => column,
  );

  GeneratedColumn<int> get numberOfPayments => $composableBuilder(
    column: $table.numberOfPayments,
    builder: (column) => column,
  );

  GeneratedColumn<String> get lessor =>
      $composableBuilder(column: $table.lessor, builder: (column) => column);

  GeneratedColumn<String> get agreementHolder => $composableBuilder(
    column: $table.agreementHolder,
    builder: (column) => column,
  );

  GeneratedColumn<String> get ownershipNotes => $composableBuilder(
    column: $table.ownershipNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get insurer =>
      $composableBuilder(column: $table.insurer, builder: (column) => column);

  GeneratedColumn<String> get insurancePolicyNumber => $composableBuilder(
    column: $table.insurancePolicyNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get insuranceRenewalDate => $composableBuilder(
    column: $table.insuranceRenewalDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get insuranceType => $composableBuilder(
    column: $table.insuranceType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get insuredDrivers => $composableBuilder(
    column: $table.insuredDrivers,
    builder: (column) => column,
  );

  GeneratedColumn<double> get insuranceAnnualCost => $composableBuilder(
    column: $table.insuranceAnnualCost,
    builder: (column) => column,
  );

  GeneratedColumn<String> get breakdownProvider => $composableBuilder(
    column: $table.breakdownProvider,
    builder: (column) => column,
  );

  GeneratedColumn<String> get breakdownMembershipNumber => $composableBuilder(
    column: $table.breakdownMembershipNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get breakdownContact => $composableBuilder(
    column: $table.breakdownContact,
    builder: (column) => column,
  );

  GeneratedColumn<String> get breakdownNotes => $composableBuilder(
    column: $table.breakdownNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recoveryProvider => $composableBuilder(
    column: $table.recoveryProvider,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recoveryArrangedVia => $composableBuilder(
    column: $table.recoveryArrangedVia,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recoveryReference => $composableBuilder(
    column: $table.recoveryReference,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recoveryContact => $composableBuilder(
    column: $table.recoveryContact,
    builder: (column) => column,
  );

  GeneratedColumn<String> get recoveryNotes => $composableBuilder(
    column: $table.recoveryNotes,
    builder: (column) => column,
  );

  GeneratedColumn<String> get motDueDate => $composableBuilder(
    column: $table.motDueDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get taxDueDate => $composableBuilder(
    column: $table.taxDueDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get currentMileage => $composableBuilder(
    column: $table.currentMileage,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get dvlaVerified => $composableBuilder(
    column: $table.dvlaVerified,
    builder: (column) => column,
  );

  GeneratedColumn<String> get taxStatus =>
      $composableBuilder(column: $table.taxStatus, builder: (column) => column);

  GeneratedColumn<String> get motStatus =>
      $composableBuilder(column: $table.motStatus, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  Expression<T> serviceEntriesRefs<T extends Object>(
    Expression<T> Function($$ServiceEntriesTableAnnotationComposer a) f,
  ) {
    final $$ServiceEntriesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.serviceEntries,
      getReferencedColumn: (t) => t.vehicleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$ServiceEntriesTableAnnotationComposer(
            $db: $db,
            $table: $db.serviceEntries,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }

  Expression<T> mOTRecordsRefs<T extends Object>(
    Expression<T> Function($$MOTRecordsTableAnnotationComposer a) f,
  ) {
    final $$MOTRecordsTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.id,
      referencedTable: $db.mOTRecords,
      getReferencedColumn: (t) => t.vehicleId,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$MOTRecordsTableAnnotationComposer(
            $db: $db,
            $table: $db.mOTRecords,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return f(composer);
  }
}

class $$VehiclesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $VehiclesTable,
          VehicleRow,
          $$VehiclesTableFilterComposer,
          $$VehiclesTableOrderingComposer,
          $$VehiclesTableAnnotationComposer,
          $$VehiclesTableCreateCompanionBuilder,
          $$VehiclesTableUpdateCompanionBuilder,
          (VehicleRow, $$VehiclesTableReferences),
          VehicleRow,
          PrefetchHooks Function({bool serviceEntriesRefs, bool mOTRecordsRefs})
        > {
  $$VehiclesTableTableManager(_$AppDatabase db, $VehiclesTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$VehiclesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$VehiclesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$VehiclesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> registration = const Value.absent(),
                Value<String> make = const Value.absent(),
                Value<String> model = const Value.absent(),
                Value<String> year = const Value.absent(),
                Value<String> colour = const Value.absent(),
                Value<String> fuelType = const Value.absent(),
                Value<String> transmission = const Value.absent(),
                Value<String> vin = const Value.absent(),
                Value<String> variant = const Value.absent(),
                Value<String> bodyType = const Value.absent(),
                Value<String> engineCC = const Value.absent(),
                Value<String> engineNumber = const Value.absent(),
                Value<String> keyNumber = const Value.absent(),
                Value<String> chassisNumber = const Value.absent(),
                Value<String> radioCode = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> purchaseDate = const Value.absent(),
                Value<double> purchasePrice = const Value.absent(),
                Value<String> purchasedFrom = const Value.absent(),
                Value<String> ownership = const Value.absent(),
                Value<String> financeCompany = const Value.absent(),
                Value<String> agreementNumber = const Value.absent(),
                Value<double> deposit = const Value.absent(),
                Value<double> monthlyPayment = const Value.absent(),
                Value<String> financeStartDate = const Value.absent(),
                Value<String> financeEndDate = const Value.absent(),
                Value<double> balloonPayment = const Value.absent(),
                Value<int> annualMileageAllowance = const Value.absent(),
                Value<int> numberOfPayments = const Value.absent(),
                Value<String> lessor = const Value.absent(),
                Value<String> agreementHolder = const Value.absent(),
                Value<String> ownershipNotes = const Value.absent(),
                Value<String> insurer = const Value.absent(),
                Value<String> insurancePolicyNumber = const Value.absent(),
                Value<String> insuranceRenewalDate = const Value.absent(),
                Value<String> insuranceType = const Value.absent(),
                Value<String> insuredDrivers = const Value.absent(),
                Value<double> insuranceAnnualCost = const Value.absent(),
                Value<String> breakdownProvider = const Value.absent(),
                Value<String> breakdownMembershipNumber = const Value.absent(),
                Value<String> breakdownContact = const Value.absent(),
                Value<String> breakdownNotes = const Value.absent(),
                Value<String> recoveryProvider = const Value.absent(),
                Value<String> recoveryArrangedVia = const Value.absent(),
                Value<String> recoveryReference = const Value.absent(),
                Value<String> recoveryContact = const Value.absent(),
                Value<String> recoveryNotes = const Value.absent(),
                Value<String> motDueDate = const Value.absent(),
                Value<String> taxDueDate = const Value.absent(),
                Value<int> currentMileage = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<bool> dvlaVerified = const Value.absent(),
                Value<String> taxStatus = const Value.absent(),
                Value<String> motStatus = const Value.absent(),
                Value<String> photoPath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VehiclesCompanion(
                id: id,
                registration: registration,
                make: make,
                model: model,
                year: year,
                colour: colour,
                fuelType: fuelType,
                transmission: transmission,
                vin: vin,
                variant: variant,
                bodyType: bodyType,
                engineCC: engineCC,
                engineNumber: engineNumber,
                keyNumber: keyNumber,
                chassisNumber: chassisNumber,
                radioCode: radioCode,
                description: description,
                purchaseDate: purchaseDate,
                purchasePrice: purchasePrice,
                purchasedFrom: purchasedFrom,
                ownership: ownership,
                financeCompany: financeCompany,
                agreementNumber: agreementNumber,
                deposit: deposit,
                monthlyPayment: monthlyPayment,
                financeStartDate: financeStartDate,
                financeEndDate: financeEndDate,
                balloonPayment: balloonPayment,
                annualMileageAllowance: annualMileageAllowance,
                numberOfPayments: numberOfPayments,
                lessor: lessor,
                agreementHolder: agreementHolder,
                ownershipNotes: ownershipNotes,
                insurer: insurer,
                insurancePolicyNumber: insurancePolicyNumber,
                insuranceRenewalDate: insuranceRenewalDate,
                insuranceType: insuranceType,
                insuredDrivers: insuredDrivers,
                insuranceAnnualCost: insuranceAnnualCost,
                breakdownProvider: breakdownProvider,
                breakdownMembershipNumber: breakdownMembershipNumber,
                breakdownContact: breakdownContact,
                breakdownNotes: breakdownNotes,
                recoveryProvider: recoveryProvider,
                recoveryArrangedVia: recoveryArrangedVia,
                recoveryReference: recoveryReference,
                recoveryContact: recoveryContact,
                recoveryNotes: recoveryNotes,
                motDueDate: motDueDate,
                taxDueDate: taxDueDate,
                currentMileage: currentMileage,
                notes: notes,
                dvlaVerified: dvlaVerified,
                taxStatus: taxStatus,
                motStatus: motStatus,
                photoPath: photoPath,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> registration = const Value.absent(),
                Value<String> make = const Value.absent(),
                Value<String> model = const Value.absent(),
                Value<String> year = const Value.absent(),
                Value<String> colour = const Value.absent(),
                Value<String> fuelType = const Value.absent(),
                Value<String> transmission = const Value.absent(),
                Value<String> vin = const Value.absent(),
                Value<String> variant = const Value.absent(),
                Value<String> bodyType = const Value.absent(),
                Value<String> engineCC = const Value.absent(),
                Value<String> engineNumber = const Value.absent(),
                Value<String> keyNumber = const Value.absent(),
                Value<String> chassisNumber = const Value.absent(),
                Value<String> radioCode = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<String> purchaseDate = const Value.absent(),
                Value<double> purchasePrice = const Value.absent(),
                Value<String> purchasedFrom = const Value.absent(),
                Value<String> ownership = const Value.absent(),
                Value<String> financeCompany = const Value.absent(),
                Value<String> agreementNumber = const Value.absent(),
                Value<double> deposit = const Value.absent(),
                Value<double> monthlyPayment = const Value.absent(),
                Value<String> financeStartDate = const Value.absent(),
                Value<String> financeEndDate = const Value.absent(),
                Value<double> balloonPayment = const Value.absent(),
                Value<int> annualMileageAllowance = const Value.absent(),
                Value<int> numberOfPayments = const Value.absent(),
                Value<String> lessor = const Value.absent(),
                Value<String> agreementHolder = const Value.absent(),
                Value<String> ownershipNotes = const Value.absent(),
                Value<String> insurer = const Value.absent(),
                Value<String> insurancePolicyNumber = const Value.absent(),
                Value<String> insuranceRenewalDate = const Value.absent(),
                Value<String> insuranceType = const Value.absent(),
                Value<String> insuredDrivers = const Value.absent(),
                Value<double> insuranceAnnualCost = const Value.absent(),
                Value<String> breakdownProvider = const Value.absent(),
                Value<String> breakdownMembershipNumber = const Value.absent(),
                Value<String> breakdownContact = const Value.absent(),
                Value<String> breakdownNotes = const Value.absent(),
                Value<String> recoveryProvider = const Value.absent(),
                Value<String> recoveryArrangedVia = const Value.absent(),
                Value<String> recoveryReference = const Value.absent(),
                Value<String> recoveryContact = const Value.absent(),
                Value<String> recoveryNotes = const Value.absent(),
                Value<String> motDueDate = const Value.absent(),
                Value<String> taxDueDate = const Value.absent(),
                Value<int> currentMileage = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<bool> dvlaVerified = const Value.absent(),
                Value<String> taxStatus = const Value.absent(),
                Value<String> motStatus = const Value.absent(),
                Value<String> photoPath = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => VehiclesCompanion.insert(
                id: id,
                registration: registration,
                make: make,
                model: model,
                year: year,
                colour: colour,
                fuelType: fuelType,
                transmission: transmission,
                vin: vin,
                variant: variant,
                bodyType: bodyType,
                engineCC: engineCC,
                engineNumber: engineNumber,
                keyNumber: keyNumber,
                chassisNumber: chassisNumber,
                radioCode: radioCode,
                description: description,
                purchaseDate: purchaseDate,
                purchasePrice: purchasePrice,
                purchasedFrom: purchasedFrom,
                ownership: ownership,
                financeCompany: financeCompany,
                agreementNumber: agreementNumber,
                deposit: deposit,
                monthlyPayment: monthlyPayment,
                financeStartDate: financeStartDate,
                financeEndDate: financeEndDate,
                balloonPayment: balloonPayment,
                annualMileageAllowance: annualMileageAllowance,
                numberOfPayments: numberOfPayments,
                lessor: lessor,
                agreementHolder: agreementHolder,
                ownershipNotes: ownershipNotes,
                insurer: insurer,
                insurancePolicyNumber: insurancePolicyNumber,
                insuranceRenewalDate: insuranceRenewalDate,
                insuranceType: insuranceType,
                insuredDrivers: insuredDrivers,
                insuranceAnnualCost: insuranceAnnualCost,
                breakdownProvider: breakdownProvider,
                breakdownMembershipNumber: breakdownMembershipNumber,
                breakdownContact: breakdownContact,
                breakdownNotes: breakdownNotes,
                recoveryProvider: recoveryProvider,
                recoveryArrangedVia: recoveryArrangedVia,
                recoveryReference: recoveryReference,
                recoveryContact: recoveryContact,
                recoveryNotes: recoveryNotes,
                motDueDate: motDueDate,
                taxDueDate: taxDueDate,
                currentMileage: currentMileage,
                notes: notes,
                dvlaVerified: dvlaVerified,
                taxStatus: taxStatus,
                motStatus: motStatus,
                photoPath: photoPath,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$VehiclesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback:
              ({serviceEntriesRefs = false, mOTRecordsRefs = false}) {
                return PrefetchHooks(
                  db: db,
                  explicitlyWatchedTables: [
                    if (serviceEntriesRefs) db.serviceEntries,
                    if (mOTRecordsRefs) db.mOTRecords,
                  ],
                  addJoins: null,
                  getPrefetchedDataCallback: (items) async {
                    return [
                      if (serviceEntriesRefs)
                        await $_getPrefetchedData<
                          VehicleRow,
                          $VehiclesTable,
                          ServiceEntryRow
                        >(
                          currentTable: table,
                          referencedTable: $$VehiclesTableReferences
                              ._serviceEntriesRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehiclesTableReferences(
                                db,
                                table,
                                p0,
                              ).serviceEntriesRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleId == item.id,
                              ),
                          typedResults: items,
                        ),
                      if (mOTRecordsRefs)
                        await $_getPrefetchedData<
                          VehicleRow,
                          $VehiclesTable,
                          MOTRecordRow
                        >(
                          currentTable: table,
                          referencedTable: $$VehiclesTableReferences
                              ._mOTRecordsRefsTable(db),
                          managerFromTypedResult: (p0) =>
                              $$VehiclesTableReferences(
                                db,
                                table,
                                p0,
                              ).mOTRecordsRefs,
                          referencedItemsForCurrentItem:
                              (item, referencedItems) => referencedItems.where(
                                (e) => e.vehicleId == item.id,
                              ),
                          typedResults: items,
                        ),
                    ];
                  },
                );
              },
        ),
      );
}

typedef $$VehiclesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $VehiclesTable,
      VehicleRow,
      $$VehiclesTableFilterComposer,
      $$VehiclesTableOrderingComposer,
      $$VehiclesTableAnnotationComposer,
      $$VehiclesTableCreateCompanionBuilder,
      $$VehiclesTableUpdateCompanionBuilder,
      (VehicleRow, $$VehiclesTableReferences),
      VehicleRow,
      PrefetchHooks Function({bool serviceEntriesRefs, bool mOTRecordsRefs})
    >;
typedef $$ServiceEntriesTableCreateCompanionBuilder =
    ServiceEntriesCompanion Function({
      required String id,
      required String vehicleId,
      Value<String> date,
      Value<String> type,
      Value<String> description,
      Value<double> cost,
      Value<String> garage,
      Value<int> mileage,
      Value<String> nextServiceDate,
      Value<int> nextServiceMileage,
      Value<int> rowid,
    });
typedef $$ServiceEntriesTableUpdateCompanionBuilder =
    ServiceEntriesCompanion Function({
      Value<String> id,
      Value<String> vehicleId,
      Value<String> date,
      Value<String> type,
      Value<String> description,
      Value<double> cost,
      Value<String> garage,
      Value<int> mileage,
      Value<String> nextServiceDate,
      Value<int> nextServiceMileage,
      Value<int> rowid,
    });

final class $$ServiceEntriesTableReferences
    extends
        BaseReferences<_$AppDatabase, $ServiceEntriesTable, ServiceEntryRow> {
  $$ServiceEntriesTableReferences(
    super.$_db,
    super.$_table,
    super.$_typedResult,
  );

  static $VehiclesTable _vehicleIdTable(_$AppDatabase db) =>
      db.vehicles.createAlias(
        $_aliasNameGenerator(db.serviceEntries.vehicleId, db.vehicles.id),
      );

  $$VehiclesTableProcessedTableManager get vehicleId {
    final $_column = $_itemColumn<String>('vehicle_id')!;

    final manager = $$VehiclesTableTableManager(
      $_db,
      $_db.vehicles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$ServiceEntriesTableFilterComposer
    extends Composer<_$AppDatabase, $ServiceEntriesTable> {
  $$ServiceEntriesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get garage => $composableBuilder(
    column: $table.garage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get nextServiceDate => $composableBuilder(
    column: $table.nextServiceDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get nextServiceMileage => $composableBuilder(
    column: $table.nextServiceMileage,
    builder: (column) => ColumnFilters(column),
  );

  $$VehiclesTableFilterComposer get vehicleId {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableFilterComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceEntriesTableOrderingComposer
    extends Composer<_$AppDatabase, $ServiceEntriesTable> {
  $$ServiceEntriesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get date => $composableBuilder(
    column: $table.date,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get type => $composableBuilder(
    column: $table.type,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<double> get cost => $composableBuilder(
    column: $table.cost,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get garage => $composableBuilder(
    column: $table.garage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get nextServiceDate => $composableBuilder(
    column: $table.nextServiceDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get nextServiceMileage => $composableBuilder(
    column: $table.nextServiceMileage,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehiclesTableOrderingComposer get vehicleId {
    final $$VehiclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableOrderingComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceEntriesTableAnnotationComposer
    extends Composer<_$AppDatabase, $ServiceEntriesTable> {
  $$ServiceEntriesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get date =>
      $composableBuilder(column: $table.date, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
    column: $table.description,
    builder: (column) => column,
  );

  GeneratedColumn<double> get cost =>
      $composableBuilder(column: $table.cost, builder: (column) => column);

  GeneratedColumn<String> get garage =>
      $composableBuilder(column: $table.garage, builder: (column) => column);

  GeneratedColumn<int> get mileage =>
      $composableBuilder(column: $table.mileage, builder: (column) => column);

  GeneratedColumn<String> get nextServiceDate => $composableBuilder(
    column: $table.nextServiceDate,
    builder: (column) => column,
  );

  GeneratedColumn<int> get nextServiceMileage => $composableBuilder(
    column: $table.nextServiceMileage,
    builder: (column) => column,
  );

  $$VehiclesTableAnnotationComposer get vehicleId {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$ServiceEntriesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $ServiceEntriesTable,
          ServiceEntryRow,
          $$ServiceEntriesTableFilterComposer,
          $$ServiceEntriesTableOrderingComposer,
          $$ServiceEntriesTableAnnotationComposer,
          $$ServiceEntriesTableCreateCompanionBuilder,
          $$ServiceEntriesTableUpdateCompanionBuilder,
          (ServiceEntryRow, $$ServiceEntriesTableReferences),
          ServiceEntryRow,
          PrefetchHooks Function({bool vehicleId})
        > {
  $$ServiceEntriesTableTableManager(
    _$AppDatabase db,
    $ServiceEntriesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ServiceEntriesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ServiceEntriesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ServiceEntriesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> vehicleId = const Value.absent(),
                Value<String> date = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<String> garage = const Value.absent(),
                Value<int> mileage = const Value.absent(),
                Value<String> nextServiceDate = const Value.absent(),
                Value<int> nextServiceMileage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServiceEntriesCompanion(
                id: id,
                vehicleId: vehicleId,
                date: date,
                type: type,
                description: description,
                cost: cost,
                garage: garage,
                mileage: mileage,
                nextServiceDate: nextServiceDate,
                nextServiceMileage: nextServiceMileage,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String vehicleId,
                Value<String> date = const Value.absent(),
                Value<String> type = const Value.absent(),
                Value<String> description = const Value.absent(),
                Value<double> cost = const Value.absent(),
                Value<String> garage = const Value.absent(),
                Value<int> mileage = const Value.absent(),
                Value<String> nextServiceDate = const Value.absent(),
                Value<int> nextServiceMileage = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => ServiceEntriesCompanion.insert(
                id: id,
                vehicleId: vehicleId,
                date: date,
                type: type,
                description: description,
                cost: cost,
                garage: garage,
                mileage: mileage,
                nextServiceDate: nextServiceDate,
                nextServiceMileage: nextServiceMileage,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$ServiceEntriesTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({vehicleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (vehicleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.vehicleId,
                                referencedTable: $$ServiceEntriesTableReferences
                                    ._vehicleIdTable(db),
                                referencedColumn:
                                    $$ServiceEntriesTableReferences
                                        ._vehicleIdTable(db)
                                        .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$ServiceEntriesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $ServiceEntriesTable,
      ServiceEntryRow,
      $$ServiceEntriesTableFilterComposer,
      $$ServiceEntriesTableOrderingComposer,
      $$ServiceEntriesTableAnnotationComposer,
      $$ServiceEntriesTableCreateCompanionBuilder,
      $$ServiceEntriesTableUpdateCompanionBuilder,
      (ServiceEntryRow, $$ServiceEntriesTableReferences),
      ServiceEntryRow,
      PrefetchHooks Function({bool vehicleId})
    >;
typedef $$MOTRecordsTableCreateCompanionBuilder =
    MOTRecordsCompanion Function({
      required String id,
      required String vehicleId,
      Value<String> testDate,
      Value<String> expiryDate,
      Value<String> testCentre,
      Value<int> mileage,
      Value<String> result,
      Value<String> advisories,
      Value<int> rowid,
    });
typedef $$MOTRecordsTableUpdateCompanionBuilder =
    MOTRecordsCompanion Function({
      Value<String> id,
      Value<String> vehicleId,
      Value<String> testDate,
      Value<String> expiryDate,
      Value<String> testCentre,
      Value<int> mileage,
      Value<String> result,
      Value<String> advisories,
      Value<int> rowid,
    });

final class $$MOTRecordsTableReferences
    extends BaseReferences<_$AppDatabase, $MOTRecordsTable, MOTRecordRow> {
  $$MOTRecordsTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $VehiclesTable _vehicleIdTable(_$AppDatabase db) =>
      db.vehicles.createAlias(
        $_aliasNameGenerator(db.mOTRecords.vehicleId, db.vehicles.id),
      );

  $$VehiclesTableProcessedTableManager get vehicleId {
    final $_column = $_itemColumn<String>('vehicle_id')!;

    final manager = $$VehiclesTableTableManager(
      $_db,
      $_db.vehicles,
    ).filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_vehicleIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
      manager.$state.copyWith(prefetchedData: [item]),
    );
  }
}

class $$MOTRecordsTableFilterComposer
    extends Composer<_$AppDatabase, $MOTRecordsTable> {
  $$MOTRecordsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testDate => $composableBuilder(
    column: $table.testDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get testCentre => $composableBuilder(
    column: $table.testCentre,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<int> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get advisories => $composableBuilder(
    column: $table.advisories,
    builder: (column) => ColumnFilters(column),
  );

  $$VehiclesTableFilterComposer get vehicleId {
    final $$VehiclesTableFilterComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableFilterComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MOTRecordsTableOrderingComposer
    extends Composer<_$AppDatabase, $MOTRecordsTable> {
  $$MOTRecordsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testDate => $composableBuilder(
    column: $table.testDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get testCentre => $composableBuilder(
    column: $table.testCentre,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<int> get mileage => $composableBuilder(
    column: $table.mileage,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get result => $composableBuilder(
    column: $table.result,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get advisories => $composableBuilder(
    column: $table.advisories,
    builder: (column) => ColumnOrderings(column),
  );

  $$VehiclesTableOrderingComposer get vehicleId {
    final $$VehiclesTableOrderingComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableOrderingComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MOTRecordsTableAnnotationComposer
    extends Composer<_$AppDatabase, $MOTRecordsTable> {
  $$MOTRecordsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get testDate =>
      $composableBuilder(column: $table.testDate, builder: (column) => column);

  GeneratedColumn<String> get expiryDate => $composableBuilder(
    column: $table.expiryDate,
    builder: (column) => column,
  );

  GeneratedColumn<String> get testCentre => $composableBuilder(
    column: $table.testCentre,
    builder: (column) => column,
  );

  GeneratedColumn<int> get mileage =>
      $composableBuilder(column: $table.mileage, builder: (column) => column);

  GeneratedColumn<String> get result =>
      $composableBuilder(column: $table.result, builder: (column) => column);

  GeneratedColumn<String> get advisories => $composableBuilder(
    column: $table.advisories,
    builder: (column) => column,
  );

  $$VehiclesTableAnnotationComposer get vehicleId {
    final $$VehiclesTableAnnotationComposer composer = $composerBuilder(
      composer: this,
      getCurrentColumn: (t) => t.vehicleId,
      referencedTable: $db.vehicles,
      getReferencedColumn: (t) => t.id,
      builder:
          (
            joinBuilder, {
            $addJoinBuilderToRootComposer,
            $removeJoinBuilderFromRootComposer,
          }) => $$VehiclesTableAnnotationComposer(
            $db: $db,
            $table: $db.vehicles,
            $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
            joinBuilder: joinBuilder,
            $removeJoinBuilderFromRootComposer:
                $removeJoinBuilderFromRootComposer,
          ),
    );
    return composer;
  }
}

class $$MOTRecordsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $MOTRecordsTable,
          MOTRecordRow,
          $$MOTRecordsTableFilterComposer,
          $$MOTRecordsTableOrderingComposer,
          $$MOTRecordsTableAnnotationComposer,
          $$MOTRecordsTableCreateCompanionBuilder,
          $$MOTRecordsTableUpdateCompanionBuilder,
          (MOTRecordRow, $$MOTRecordsTableReferences),
          MOTRecordRow,
          PrefetchHooks Function({bool vehicleId})
        > {
  $$MOTRecordsTableTableManager(_$AppDatabase db, $MOTRecordsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$MOTRecordsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$MOTRecordsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$MOTRecordsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> vehicleId = const Value.absent(),
                Value<String> testDate = const Value.absent(),
                Value<String> expiryDate = const Value.absent(),
                Value<String> testCentre = const Value.absent(),
                Value<int> mileage = const Value.absent(),
                Value<String> result = const Value.absent(),
                Value<String> advisories = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MOTRecordsCompanion(
                id: id,
                vehicleId: vehicleId,
                testDate: testDate,
                expiryDate: expiryDate,
                testCentre: testCentre,
                mileage: mileage,
                result: result,
                advisories: advisories,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                required String vehicleId,
                Value<String> testDate = const Value.absent(),
                Value<String> expiryDate = const Value.absent(),
                Value<String> testCentre = const Value.absent(),
                Value<int> mileage = const Value.absent(),
                Value<String> result = const Value.absent(),
                Value<String> advisories = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => MOTRecordsCompanion.insert(
                id: id,
                vehicleId: vehicleId,
                testDate: testDate,
                expiryDate: expiryDate,
                testCentre: testCentre,
                mileage: mileage,
                result: result,
                advisories: advisories,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map(
                (e) => (
                  e.readTable(table),
                  $$MOTRecordsTableReferences(db, table, e),
                ),
              )
              .toList(),
          prefetchHooksCallback: ({vehicleId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins:
                  <
                    T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic
                    >
                  >(state) {
                    if (vehicleId) {
                      state =
                          state.withJoin(
                                currentTable: table,
                                currentColumn: table.vehicleId,
                                referencedTable: $$MOTRecordsTableReferences
                                    ._vehicleIdTable(db),
                                referencedColumn: $$MOTRecordsTableReferences
                                    ._vehicleIdTable(db)
                                    .id,
                              )
                              as T;
                    }

                    return state;
                  },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ),
      );
}

typedef $$MOTRecordsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $MOTRecordsTable,
      MOTRecordRow,
      $$MOTRecordsTableFilterComposer,
      $$MOTRecordsTableOrderingComposer,
      $$MOTRecordsTableAnnotationComposer,
      $$MOTRecordsTableCreateCompanionBuilder,
      $$MOTRecordsTableUpdateCompanionBuilder,
      (MOTRecordRow, $$MOTRecordsTableReferences),
      MOTRecordRow,
      PrefetchHooks Function({bool vehicleId})
    >;
typedef $$DocumentRefsTableCreateCompanionBuilder =
    DocumentRefsCompanion Function({
      required String id,
      Value<String> parentType,
      Value<String> parentId,
      Value<String> filename,
      Value<String> localPath,
      Value<String> fileType,
      Value<String> addedDate,
      Value<int> rowid,
    });
typedef $$DocumentRefsTableUpdateCompanionBuilder =
    DocumentRefsCompanion Function({
      Value<String> id,
      Value<String> parentType,
      Value<String> parentId,
      Value<String> filename,
      Value<String> localPath,
      Value<String> fileType,
      Value<String> addedDate,
      Value<int> rowid,
    });

class $$DocumentRefsTableFilterComposer
    extends Composer<_$AppDatabase, $DocumentRefsTable> {
  $$DocumentRefsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get addedDate => $composableBuilder(
    column: $table.addedDate,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DocumentRefsTableOrderingComposer
    extends Composer<_$AppDatabase, $DocumentRefsTable> {
  $$DocumentRefsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get parentId => $composableBuilder(
    column: $table.parentId,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get filename => $composableBuilder(
    column: $table.filename,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get localPath => $composableBuilder(
    column: $table.localPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get fileType => $composableBuilder(
    column: $table.fileType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get addedDate => $composableBuilder(
    column: $table.addedDate,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DocumentRefsTableAnnotationComposer
    extends Composer<_$AppDatabase, $DocumentRefsTable> {
  $$DocumentRefsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get parentType => $composableBuilder(
    column: $table.parentType,
    builder: (column) => column,
  );

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get filename =>
      $composableBuilder(column: $table.filename, builder: (column) => column);

  GeneratedColumn<String> get localPath =>
      $composableBuilder(column: $table.localPath, builder: (column) => column);

  GeneratedColumn<String> get fileType =>
      $composableBuilder(column: $table.fileType, builder: (column) => column);

  GeneratedColumn<String> get addedDate =>
      $composableBuilder(column: $table.addedDate, builder: (column) => column);
}

class $$DocumentRefsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DocumentRefsTable,
          DocumentRefRow,
          $$DocumentRefsTableFilterComposer,
          $$DocumentRefsTableOrderingComposer,
          $$DocumentRefsTableAnnotationComposer,
          $$DocumentRefsTableCreateCompanionBuilder,
          $$DocumentRefsTableUpdateCompanionBuilder,
          (
            DocumentRefRow,
            BaseReferences<_$AppDatabase, $DocumentRefsTable, DocumentRefRow>,
          ),
          DocumentRefRow,
          PrefetchHooks Function()
        > {
  $$DocumentRefsTableTableManager(_$AppDatabase db, $DocumentRefsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DocumentRefsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DocumentRefsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DocumentRefsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> parentType = const Value.absent(),
                Value<String> parentId = const Value.absent(),
                Value<String> filename = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<String> fileType = const Value.absent(),
                Value<String> addedDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DocumentRefsCompanion(
                id: id,
                parentType: parentType,
                parentId: parentId,
                filename: filename,
                localPath: localPath,
                fileType: fileType,
                addedDate: addedDate,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> parentType = const Value.absent(),
                Value<String> parentId = const Value.absent(),
                Value<String> filename = const Value.absent(),
                Value<String> localPath = const Value.absent(),
                Value<String> fileType = const Value.absent(),
                Value<String> addedDate = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DocumentRefsCompanion.insert(
                id: id,
                parentType: parentType,
                parentId: parentId,
                filename: filename,
                localPath: localPath,
                fileType: fileType,
                addedDate: addedDate,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DocumentRefsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DocumentRefsTable,
      DocumentRefRow,
      $$DocumentRefsTableFilterComposer,
      $$DocumentRefsTableOrderingComposer,
      $$DocumentRefsTableAnnotationComposer,
      $$DocumentRefsTableCreateCompanionBuilder,
      $$DocumentRefsTableUpdateCompanionBuilder,
      (
        DocumentRefRow,
        BaseReferences<_$AppDatabase, $DocumentRefsTable, DocumentRefRow>,
      ),
      DocumentRefRow,
      PrefetchHooks Function()
    >;
typedef $$DriverProfilesTableCreateCompanionBuilder =
    DriverProfilesCompanion Function({
      required String id,
      Value<String> name,
      Value<String> licenceNumber,
      Value<String> licenceExpiry,
      Value<String> licenceCategories,
      Value<String> address,
      Value<String> emergencyContactName,
      Value<String> emergencyContactPhone,
      Value<String> bloodType,
      Value<String> photoPath,
      Value<String> licencePhotoFront,
      Value<String> licencePhotoBack,
      Value<String> notes,
      Value<int> rowid,
    });
typedef $$DriverProfilesTableUpdateCompanionBuilder =
    DriverProfilesCompanion Function({
      Value<String> id,
      Value<String> name,
      Value<String> licenceNumber,
      Value<String> licenceExpiry,
      Value<String> licenceCategories,
      Value<String> address,
      Value<String> emergencyContactName,
      Value<String> emergencyContactPhone,
      Value<String> bloodType,
      Value<String> photoPath,
      Value<String> licencePhotoFront,
      Value<String> licencePhotoBack,
      Value<String> notes,
      Value<int> rowid,
    });

class $$DriverProfilesTableFilterComposer
    extends Composer<_$AppDatabase, $DriverProfilesTable> {
  $$DriverProfilesTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get licenceNumber => $composableBuilder(
    column: $table.licenceNumber,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get licenceExpiry => $composableBuilder(
    column: $table.licenceExpiry,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get licenceCategories => $composableBuilder(
    column: $table.licenceCategories,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get emergencyContactPhone => $composableBuilder(
    column: $table.emergencyContactPhone,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get bloodType => $composableBuilder(
    column: $table.bloodType,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get licencePhotoFront => $composableBuilder(
    column: $table.licencePhotoFront,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get licencePhotoBack => $composableBuilder(
    column: $table.licencePhotoBack,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnFilters(column),
  );
}

class $$DriverProfilesTableOrderingComposer
    extends Composer<_$AppDatabase, $DriverProfilesTable> {
  $$DriverProfilesTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
    column: $table.id,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get name => $composableBuilder(
    column: $table.name,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get licenceNumber => $composableBuilder(
    column: $table.licenceNumber,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get licenceExpiry => $composableBuilder(
    column: $table.licenceExpiry,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get licenceCategories => $composableBuilder(
    column: $table.licenceCategories,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get address => $composableBuilder(
    column: $table.address,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get emergencyContactPhone => $composableBuilder(
    column: $table.emergencyContactPhone,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get bloodType => $composableBuilder(
    column: $table.bloodType,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get photoPath => $composableBuilder(
    column: $table.photoPath,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get licencePhotoFront => $composableBuilder(
    column: $table.licencePhotoFront,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get licencePhotoBack => $composableBuilder(
    column: $table.licencePhotoBack,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get notes => $composableBuilder(
    column: $table.notes,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$DriverProfilesTableAnnotationComposer
    extends Composer<_$AppDatabase, $DriverProfilesTable> {
  $$DriverProfilesTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get licenceNumber => $composableBuilder(
    column: $table.licenceNumber,
    builder: (column) => column,
  );

  GeneratedColumn<String> get licenceExpiry => $composableBuilder(
    column: $table.licenceExpiry,
    builder: (column) => column,
  );

  GeneratedColumn<String> get licenceCategories => $composableBuilder(
    column: $table.licenceCategories,
    builder: (column) => column,
  );

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get emergencyContactName => $composableBuilder(
    column: $table.emergencyContactName,
    builder: (column) => column,
  );

  GeneratedColumn<String> get emergencyContactPhone => $composableBuilder(
    column: $table.emergencyContactPhone,
    builder: (column) => column,
  );

  GeneratedColumn<String> get bloodType =>
      $composableBuilder(column: $table.bloodType, builder: (column) => column);

  GeneratedColumn<String> get photoPath =>
      $composableBuilder(column: $table.photoPath, builder: (column) => column);

  GeneratedColumn<String> get licencePhotoFront => $composableBuilder(
    column: $table.licencePhotoFront,
    builder: (column) => column,
  );

  GeneratedColumn<String> get licencePhotoBack => $composableBuilder(
    column: $table.licencePhotoBack,
    builder: (column) => column,
  );

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);
}

class $$DriverProfilesTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $DriverProfilesTable,
          DriverProfileRow,
          $$DriverProfilesTableFilterComposer,
          $$DriverProfilesTableOrderingComposer,
          $$DriverProfilesTableAnnotationComposer,
          $$DriverProfilesTableCreateCompanionBuilder,
          $$DriverProfilesTableUpdateCompanionBuilder,
          (
            DriverProfileRow,
            BaseReferences<
              _$AppDatabase,
              $DriverProfilesTable,
              DriverProfileRow
            >,
          ),
          DriverProfileRow,
          PrefetchHooks Function()
        > {
  $$DriverProfilesTableTableManager(
    _$AppDatabase db,
    $DriverProfilesTable table,
  ) : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DriverProfilesTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DriverProfilesTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DriverProfilesTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> id = const Value.absent(),
                Value<String> name = const Value.absent(),
                Value<String> licenceNumber = const Value.absent(),
                Value<String> licenceExpiry = const Value.absent(),
                Value<String> licenceCategories = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> emergencyContactName = const Value.absent(),
                Value<String> emergencyContactPhone = const Value.absent(),
                Value<String> bloodType = const Value.absent(),
                Value<String> photoPath = const Value.absent(),
                Value<String> licencePhotoFront = const Value.absent(),
                Value<String> licencePhotoBack = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DriverProfilesCompanion(
                id: id,
                name: name,
                licenceNumber: licenceNumber,
                licenceExpiry: licenceExpiry,
                licenceCategories: licenceCategories,
                address: address,
                emergencyContactName: emergencyContactName,
                emergencyContactPhone: emergencyContactPhone,
                bloodType: bloodType,
                photoPath: photoPath,
                licencePhotoFront: licencePhotoFront,
                licencePhotoBack: licencePhotoBack,
                notes: notes,
                rowid: rowid,
              ),
          createCompanionCallback:
              ({
                required String id,
                Value<String> name = const Value.absent(),
                Value<String> licenceNumber = const Value.absent(),
                Value<String> licenceExpiry = const Value.absent(),
                Value<String> licenceCategories = const Value.absent(),
                Value<String> address = const Value.absent(),
                Value<String> emergencyContactName = const Value.absent(),
                Value<String> emergencyContactPhone = const Value.absent(),
                Value<String> bloodType = const Value.absent(),
                Value<String> photoPath = const Value.absent(),
                Value<String> licencePhotoFront = const Value.absent(),
                Value<String> licencePhotoBack = const Value.absent(),
                Value<String> notes = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => DriverProfilesCompanion.insert(
                id: id,
                name: name,
                licenceNumber: licenceNumber,
                licenceExpiry: licenceExpiry,
                licenceCategories: licenceCategories,
                address: address,
                emergencyContactName: emergencyContactName,
                emergencyContactPhone: emergencyContactPhone,
                bloodType: bloodType,
                photoPath: photoPath,
                licencePhotoFront: licencePhotoFront,
                licencePhotoBack: licencePhotoBack,
                notes: notes,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$DriverProfilesTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $DriverProfilesTable,
      DriverProfileRow,
      $$DriverProfilesTableFilterComposer,
      $$DriverProfilesTableOrderingComposer,
      $$DriverProfilesTableAnnotationComposer,
      $$DriverProfilesTableCreateCompanionBuilder,
      $$DriverProfilesTableUpdateCompanionBuilder,
      (
        DriverProfileRow,
        BaseReferences<_$AppDatabase, $DriverProfilesTable, DriverProfileRow>,
      ),
      DriverProfileRow,
      PrefetchHooks Function()
    >;
typedef $$AppSettingsTableCreateCompanionBuilder =
    AppSettingsCompanion Function({
      required String key,
      required String value,
      Value<int> rowid,
    });
typedef $$AppSettingsTableUpdateCompanionBuilder =
    AppSettingsCompanion Function({
      Value<String> key,
      Value<String> value,
      Value<int> rowid,
    });

class $$AppSettingsTableFilterComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnFilters(column),
  );

  ColumnFilters<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnFilters(column),
  );
}

class $$AppSettingsTableOrderingComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get key => $composableBuilder(
    column: $table.key,
    builder: (column) => ColumnOrderings(column),
  );

  ColumnOrderings<String> get value => $composableBuilder(
    column: $table.value,
    builder: (column) => ColumnOrderings(column),
  );
}

class $$AppSettingsTableAnnotationComposer
    extends Composer<_$AppDatabase, $AppSettingsTable> {
  $$AppSettingsTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get key =>
      $composableBuilder(column: $table.key, builder: (column) => column);

  GeneratedColumn<String> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);
}

class $$AppSettingsTableTableManager
    extends
        RootTableManager<
          _$AppDatabase,
          $AppSettingsTable,
          AppSettingRow,
          $$AppSettingsTableFilterComposer,
          $$AppSettingsTableOrderingComposer,
          $$AppSettingsTableAnnotationComposer,
          $$AppSettingsTableCreateCompanionBuilder,
          $$AppSettingsTableUpdateCompanionBuilder,
          (
            AppSettingRow,
            BaseReferences<_$AppDatabase, $AppSettingsTable, AppSettingRow>,
          ),
          AppSettingRow,
          PrefetchHooks Function()
        > {
  $$AppSettingsTableTableManager(_$AppDatabase db, $AppSettingsTable table)
    : super(
        TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AppSettingsTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AppSettingsTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AppSettingsTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback:
              ({
                Value<String> key = const Value.absent(),
                Value<String> value = const Value.absent(),
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion(key: key, value: value, rowid: rowid),
          createCompanionCallback:
              ({
                required String key,
                required String value,
                Value<int> rowid = const Value.absent(),
              }) => AppSettingsCompanion.insert(
                key: key,
                value: value,
                rowid: rowid,
              ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ),
      );
}

typedef $$AppSettingsTableProcessedTableManager =
    ProcessedTableManager<
      _$AppDatabase,
      $AppSettingsTable,
      AppSettingRow,
      $$AppSettingsTableFilterComposer,
      $$AppSettingsTableOrderingComposer,
      $$AppSettingsTableAnnotationComposer,
      $$AppSettingsTableCreateCompanionBuilder,
      $$AppSettingsTableUpdateCompanionBuilder,
      (
        AppSettingRow,
        BaseReferences<_$AppDatabase, $AppSettingsTable, AppSettingRow>,
      ),
      AppSettingRow,
      PrefetchHooks Function()
    >;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$VehiclesTableTableManager get vehicles =>
      $$VehiclesTableTableManager(_db, _db.vehicles);
  $$ServiceEntriesTableTableManager get serviceEntries =>
      $$ServiceEntriesTableTableManager(_db, _db.serviceEntries);
  $$MOTRecordsTableTableManager get mOTRecords =>
      $$MOTRecordsTableTableManager(_db, _db.mOTRecords);
  $$DocumentRefsTableTableManager get documentRefs =>
      $$DocumentRefsTableTableManager(_db, _db.documentRefs);
  $$DriverProfilesTableTableManager get driverProfiles =>
      $$DriverProfilesTableTableManager(_db, _db.driverProfiles);
  $$AppSettingsTableTableManager get appSettings =>
      $$AppSettingsTableTableManager(_db, _db.appSettings);
}
