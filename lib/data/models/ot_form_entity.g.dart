// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ot_form_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_OTFormEntity _$$_OTFormEntityFromJson(Map<String, dynamic> json) =>
    _$_OTFormEntity(
      id: json['id'] as String? ?? '',
      startDate: json['startDate'] == null
          ? null
          : DateTime.parse(json['startDate'] as String),
      endDate: json['endDate'] == null
          ? null
          : DateTime.parse(json['endDate'] as String),
      startTime: _$JsonConverterFromJson<Map<String, dynamic>, TimeOfDay?>(
          json['startTime'], const TimeOfDayConverter().fromJson),
      endTime: _$JsonConverterFromJson<Map<String, dynamic>, TimeOfDay?>(
          json['endTime'], const TimeOfDayConverter().fromJson),
      description: json['description'] as String? ?? '',
      images: json['images'] == null
          ? const []
          : const FileConverter().fromJson(json['images'] as List<String>),
      file: json['file'] == null
          ? const FileDocument()
          : FileDocument.fromJson(json['file'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_OTFormEntityToJson(_$_OTFormEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'startDate': instance.startDate?.toIso8601String(),
      'endDate': instance.endDate?.toIso8601String(),
      'startTime': const TimeOfDayConverter().toJson(instance.startTime),
      'endTime': const TimeOfDayConverter().toJson(instance.endTime),
      'description': instance.description,
      'images': const FileConverter().toJson(instance.images),
      'file': instance.file,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);
