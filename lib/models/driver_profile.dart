import 'package:freezed_annotation/freezed_annotation.dart';

part 'driver_profile.freezed.dart';
part 'driver_profile.g.dart';

@freezed
class DriverProfile with _$DriverProfile {
  const factory DriverProfile({
    required String id,
    @Default('') String name,
    @Default('') String licenceNumber,
    @Default('') String licenceExpiry,
    @Default('') String licenceCategories,
    @Default('') String address,
    @Default('') String emergencyContactName,
    @Default('') String emergencyContactPhone,
    @Default('') String bloodType,
    @Default('') String photoPath,
    @Default('') String licencePhotoFront,
    @Default('') String licencePhotoBack,
    @Default('') String notes,
  }) = _DriverProfile;

  factory DriverProfile.fromJson(Map<String, dynamic> json) =>
      _$DriverProfileFromJson(json);
}
