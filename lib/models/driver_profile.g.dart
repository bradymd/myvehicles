// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'driver_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DriverProfileImpl _$$DriverProfileImplFromJson(Map<String, dynamic> json) =>
    _$DriverProfileImpl(
      id: json['id'] as String,
      name: json['name'] as String? ?? '',
      licenceNumber: json['licenceNumber'] as String? ?? '',
      licenceExpiry: json['licenceExpiry'] as String? ?? '',
      licenceCategories: json['licenceCategories'] as String? ?? '',
      address: json['address'] as String? ?? '',
      emergencyContactName: json['emergencyContactName'] as String? ?? '',
      emergencyContactPhone: json['emergencyContactPhone'] as String? ?? '',
      bloodType: json['bloodType'] as String? ?? '',
      photoPath: json['photoPath'] as String? ?? '',
      licencePhotoFront: json['licencePhotoFront'] as String? ?? '',
      licencePhotoBack: json['licencePhotoBack'] as String? ?? '',
      notes: json['notes'] as String? ?? '',
    );

Map<String, dynamic> _$$DriverProfileImplToJson(_$DriverProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'licenceNumber': instance.licenceNumber,
      'licenceExpiry': instance.licenceExpiry,
      'licenceCategories': instance.licenceCategories,
      'address': instance.address,
      'emergencyContactName': instance.emergencyContactName,
      'emergencyContactPhone': instance.emergencyContactPhone,
      'bloodType': instance.bloodType,
      'photoPath': instance.photoPath,
      'licencePhotoFront': instance.licencePhotoFront,
      'licencePhotoBack': instance.licencePhotoBack,
      'notes': instance.notes,
    };
