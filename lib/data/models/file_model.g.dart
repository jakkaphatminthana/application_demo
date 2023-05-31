// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'file_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_FileDocument _$$_FileDocumentFromJson(Map<String, dynamic> json) =>
    _$_FileDocument(
      name: json['name'] as String? ?? '',
      size: (json['size'] as num?)?.toDouble() ?? 0,
      pathFile: json['pathFile'] as String? ?? '',
    );

Map<String, dynamic> _$$_FileDocumentToJson(_$_FileDocument instance) =>
    <String, dynamic>{
      'name': instance.name,
      'size': instance.size,
      'pathFile': instance.pathFile,
    };
