// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'ot_form_entity.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

OTFormEntity _$OTFormEntityFromJson(Map<String, dynamic> json) {
  return _OTFormEntity.fromJson(json);
}

/// @nodoc
mixin _$OTFormEntity {
  String get id => throw _privateConstructorUsedError;
  DateTime? get startDate => throw _privateConstructorUsedError;
  DateTime? get endDate => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get startTime => throw _privateConstructorUsedError;
  @TimeOfDayConverter()
  TimeOfDay? get endTime => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  @FileConverter()
  List<File> get images => throw _privateConstructorUsedError;
  FileDocument get file => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OTFormEntityCopyWith<OTFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OTFormEntityCopyWith<$Res> {
  factory $OTFormEntityCopyWith(
          OTFormEntity value, $Res Function(OTFormEntity) then) =
      _$OTFormEntityCopyWithImpl<$Res, OTFormEntity>;
  @useResult
  $Res call(
      {String id,
      DateTime? startDate,
      DateTime? endDate,
      @TimeOfDayConverter() TimeOfDay? startTime,
      @TimeOfDayConverter() TimeOfDay? endTime,
      String description,
      @FileConverter() List<File> images,
      FileDocument file});

  $FileDocumentCopyWith<$Res> get file;
}

/// @nodoc
class _$OTFormEntityCopyWithImpl<$Res, $Val extends OTFormEntity>
    implements $OTFormEntityCopyWith<$Res> {
  _$OTFormEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? description = null,
    Object? images = null,
    Object? file = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileDocument,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileDocumentCopyWith<$Res> get file {
    return $FileDocumentCopyWith<$Res>(_value.file, (value) {
      return _then(_value.copyWith(file: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_OTFormEntityCopyWith<$Res>
    implements $OTFormEntityCopyWith<$Res> {
  factory _$$_OTFormEntityCopyWith(
          _$_OTFormEntity value, $Res Function(_$_OTFormEntity) then) =
      __$$_OTFormEntityCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      DateTime? startDate,
      DateTime? endDate,
      @TimeOfDayConverter() TimeOfDay? startTime,
      @TimeOfDayConverter() TimeOfDay? endTime,
      String description,
      @FileConverter() List<File> images,
      FileDocument file});

  @override
  $FileDocumentCopyWith<$Res> get file;
}

/// @nodoc
class __$$_OTFormEntityCopyWithImpl<$Res>
    extends _$OTFormEntityCopyWithImpl<$Res, _$_OTFormEntity>
    implements _$$_OTFormEntityCopyWith<$Res> {
  __$$_OTFormEntityCopyWithImpl(
      _$_OTFormEntity _value, $Res Function(_$_OTFormEntity) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? startTime = freezed,
    Object? endTime = freezed,
    Object? description = null,
    Object? images = null,
    Object? file = null,
  }) {
    return _then(_$_OTFormEntity(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      startDate: freezed == startDate
          ? _value.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _value.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      startTime: freezed == startTime
          ? _value.startTime
          : startTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      endTime: freezed == endTime
          ? _value.endTime
          : endTime // ignore: cast_nullable_to_non_nullable
              as TimeOfDay?,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      images: null == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<File>,
      file: null == file
          ? _value.file
          : file // ignore: cast_nullable_to_non_nullable
              as FileDocument,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_OTFormEntity implements _OTFormEntity {
  _$_OTFormEntity(
      {this.id = '',
      this.startDate,
      this.endDate,
      @TimeOfDayConverter() this.startTime,
      @TimeOfDayConverter() this.endTime,
      this.description = '',
      @FileConverter() final List<File> images = const [],
      this.file = const FileDocument()})
      : _images = images;

  factory _$_OTFormEntity.fromJson(Map<String, dynamic> json) =>
      _$$_OTFormEntityFromJson(json);

  @override
  @JsonKey()
  final String id;
  @override
  final DateTime? startDate;
  @override
  final DateTime? endDate;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? startTime;
  @override
  @TimeOfDayConverter()
  final TimeOfDay? endTime;
  @override
  @JsonKey()
  final String description;
  final List<File> _images;
  @override
  @JsonKey()
  @FileConverter()
  List<File> get images {
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_images);
  }

  @override
  @JsonKey()
  final FileDocument file;

  @override
  String toString() {
    return 'OTFormEntity(id: $id, startDate: $startDate, endDate: $endDate, startTime: $startTime, endTime: $endTime, description: $description, images: $images, file: $file)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_OTFormEntity &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.startTime, startTime) ||
                other.startTime == startTime) &&
            (identical(other.endTime, endTime) || other.endTime == endTime) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.file, file) || other.file == file));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      startDate,
      endDate,
      startTime,
      endTime,
      description,
      const DeepCollectionEquality().hash(_images),
      file);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_OTFormEntityCopyWith<_$_OTFormEntity> get copyWith =>
      __$$_OTFormEntityCopyWithImpl<_$_OTFormEntity>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_OTFormEntityToJson(
      this,
    );
  }
}

abstract class _OTFormEntity implements OTFormEntity {
  factory _OTFormEntity(
      {final String id,
      final DateTime? startDate,
      final DateTime? endDate,
      @TimeOfDayConverter() final TimeOfDay? startTime,
      @TimeOfDayConverter() final TimeOfDay? endTime,
      final String description,
      @FileConverter() final List<File> images,
      final FileDocument file}) = _$_OTFormEntity;

  factory _OTFormEntity.fromJson(Map<String, dynamic> json) =
      _$_OTFormEntity.fromJson;

  @override
  String get id;
  @override
  DateTime? get startDate;
  @override
  DateTime? get endDate;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get startTime;
  @override
  @TimeOfDayConverter()
  TimeOfDay? get endTime;
  @override
  String get description;
  @override
  @FileConverter()
  List<File> get images;
  @override
  FileDocument get file;
  @override
  @JsonKey(ignore: true)
  _$$_OTFormEntityCopyWith<_$_OTFormEntity> get copyWith =>
      throw _privateConstructorUsedError;
}
