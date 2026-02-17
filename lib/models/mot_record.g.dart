// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mot_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MOTRecordImpl _$$MOTRecordImplFromJson(Map<String, dynamic> json) =>
    _$MOTRecordImpl(
      id: json['id'] as String,
      vehicleId: json['vehicleId'] as String,
      testDate: json['testDate'] as String? ?? '',
      expiryDate: json['expiryDate'] as String? ?? '',
      testCentre: json['testCentre'] as String? ?? '',
      mileage: (json['mileage'] as num?)?.toInt() ?? 0,
      result: json['result'] as String? ?? 'pass',
      advisories: json['advisories'] as String? ?? '',
    );

Map<String, dynamic> _$$MOTRecordImplToJson(_$MOTRecordImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'testDate': instance.testDate,
      'expiryDate': instance.expiryDate,
      'testCentre': instance.testCentre,
      'mileage': instance.mileage,
      'result': instance.result,
      'advisories': instance.advisories,
    };
