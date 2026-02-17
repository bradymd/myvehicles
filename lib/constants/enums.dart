enum FuelType {
  petrol,
  diesel,
  electric,
  hybrid,
  other;

  String get label => switch (this) {
        petrol => 'Petrol',
        diesel => 'Diesel',
        electric => 'Electric',
        hybrid => 'Hybrid',
        other => 'Other',
      };
}

enum TransmissionType {
  manual,
  automatic,
  other;

  String get label => switch (this) {
        manual => 'Manual',
        automatic => 'Automatic',
        other => 'Other',
      };
}

enum OwnershipType {
  owned,
  hp,
  pcp,
  pch,
  financed,
  leased;

  String get label => switch (this) {
        owned => 'Owned Outright',
        hp => 'Hire Purchase (HP)',
        pcp => 'PCP',
        pch => 'Personal Contract Hire (Lease)',
        financed => 'Finance Lease',
        leased => 'Leased',
      };
}

enum InsuranceType {
  comprehensive,
  thirdParty,
  thirdPartyFireTheft,
  none;

  String get label => switch (this) {
        comprehensive => 'Comprehensive',
        thirdParty => 'Third Party',
        thirdPartyFireTheft => 'Third Party Fire & Theft',
        none => 'Not Set',
      };
}

enum ServiceType {
  service,
  mot,
  repair,
  tyres,
  other;

  String get label => switch (this) {
        service => 'Service',
        mot => 'MOT',
        repair => 'Repair',
        tyres => 'Tyres',
        other => 'Other',
      };
}

enum MOTResult {
  pass,
  fail;

  String get label => switch (this) {
        pass => 'Pass',
        fail => 'Fail',
      };
}

enum DocumentParentType {
  vehicle,
  service,
  mot,
  insurance,
  finance,
  breakdown,
  profile;

  String get label => switch (this) {
        vehicle => 'Vehicle',
        service => 'Service',
        mot => 'MOT',
        insurance => 'Insurance',
        finance => 'Finance',
        breakdown => 'Breakdown',
        profile => 'Profile',
      };
}
