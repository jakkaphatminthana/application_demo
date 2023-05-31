// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'file_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FileDocument _$FileDocumentFromJson(Map<String, dynamic> json) {
  return _FileDocument.fromJson(json);
}

/// @nodoc
mixin _$FileDocument {
  String get name => throw _privateConstructorUsedError;
  double get size => throw _privateConstructorUsedError;
  String get pathFile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileDocumentCopyWith<FileDocument> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileDocumentCopyWith<$Res> {
  factory $FileDocumentCopyWith(
          FileDocument value, $Res Function(FileDocument) then) =
      _$FileDocumentCopyWithImpl<$Res, FileDocument>;
  @useResult
  $Res call({String name, double size, String pathFile});
}

/// @nodoc
class _$FileDocumentCopyWithImpl<$Res, $Val extends FileDocument>
    implements $FileDocumentCopyWith<$Res> {
  _$FileDocumentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? size = null,
    Object? pathFile = null,
  }) {
    return _then(_value.copyWith(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      pathFile: null == pathFile
          ? _value.pathFile
          : pathFile // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_FileDocumentCopyWith<$Res>
    implements $FileDocumentCopyWith<$Res> {
  factory _$$_FileDocumentCopyWith(
          _$_FileDocument value, $Res Function(_$_FileDocument) then) =
      __$$_FileDocumentCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String name, double size, String pathFile});
}

/// @nodoc
class __$$_FileDocumentCopyWithImpl<$Res>
    extends _$FileDocumentCopyWithImpl<$Res, _$_FileDocument>
    implements _$$_FileDocumentCopyWith<$Res> {
  __$$_FileDocumentCopyWithImpl(
      _$_FileDocument _value, $Res Function(_$_FileDocument) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? name = null,
    Object? size = null,
    Object? pathFile = null,
  }) {
    return _then(_$_FileDocument(
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as double,
      pathFile: null == pathFile
          ? _value.pathFile
          : pathFile // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_FileDocument implements _FileDocument {
  const _$_FileDocument({this.name = '', this.size = 0, this.pathFile = ''});

  factory _$_FileDocument.fromJson(Map<String, dynamic> json) =>
      _$$_FileDocumentFromJson(json);

  @override
  @JsonKey()
  final String name;
  @override
  @JsonKey()
  final double size;
  @override
  @JsonKey()
  final String pathFile;

  @override
  String toString() {
    return 'FileDocument(name: $name, size: $size, pathFile: $pathFile)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_FileDocument &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.pathFile, pathFile) ||
                other.pathFile == pathFile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, name, size, pathFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_FileDocumentCopyWith<_$_FileDocument> get copyWith =>
      __$$_FileDocumentCopyWithImpl<_$_FileDocument>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_FileDocumentToJson(
      this,
    );
  }
}

abstract class _FileDocument implements FileDocument {
  const factory _FileDocument(
      {final String name,
      final double size,
      final String pathFile}) = _$_FileDocument;

  factory _FileDocument.fromJson(Map<String, dynamic> json) =
      _$_FileDocument.fromJson;

  @override
  String get name;
  @override
  double get size;
  @override
  String get pathFile;
  @override
  @JsonKey(ignore: true)
  _$$_FileDocumentCopyWith<_$_FileDocument> get copyWith =>
      throw _privateConstructorUsedError;
}
