// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_entry.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServiceEntryImpl _$$ServiceEntryImplFromJson(Map<String, dynamic> json) =>
    _$ServiceEntryImpl(
      id: json['id'] as String,
      vehicleId: json['vehicleId'] as String,
      date: json['date'] as String? ?? '',
      type: json['type'] as String? ?? 'service',
      description: json['description'] as String? ?? '',
      cost: (json['cost'] as num?)?.toDouble() ?? 0,
      garage: json['garage'] as String? ?? '',
      mileage: (json['mileage'] as num?)?.toInt() ?? 0,
      nextServiceDate: json['nextServiceDate'] as String? ?? '',
      nextServiceMileage: (json['nextServiceMileage'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$ServiceEntryImplToJson(_$ServiceEntryImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'vehicleId': instance.vehicleId,
      'date': instance.date,
      'type': instance.type,
      'description': instance.description,
      'cost': instance.cost,
      'garage': instance.garage,
      'mileage': instance.mileage,
      'nextServiceDate': instance.nextServiceDate,
      'nextServiceMileage': instance.nextServiceMileage,
    };
