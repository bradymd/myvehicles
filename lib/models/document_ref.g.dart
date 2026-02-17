// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'document_ref.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$DocumentRefImpl _$$DocumentRefImplFromJson(Map<String, dynamic> json) =>
    _$DocumentRefImpl(
      id: json['id'] as String,
      parentType: json['parentType'] as String? ?? 'vehicle',
      parentId: json['parentId'] as String? ?? '',
      filename: json['filename'] as String? ?? '',
      localPath: json['localPath'] as String? ?? '',
      fileType: json['fileType'] as String? ?? '',
      addedDate: json['addedDate'] as String? ?? '',
    );

Map<String, dynamic> _$$DocumentRefImplToJson(_$DocumentRefImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'parentType': instance.parentType,
      'parentId': instance.parentId,
      'filename': instance.filename,
      'localPath': instance.localPath,
      'fileType': instance.fileType,
      'addedDate': instance.addedDate,
    };
