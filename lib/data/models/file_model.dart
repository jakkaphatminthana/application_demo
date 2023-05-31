import 'package:freezed_annotation/freezed_annotation.dart';

part 'file_model.freezed.dart';
part 'file_model.g.dart';

@freezed
class FileDocument with _$FileDocument {
  const factory FileDocument({
    @Default('') String name,
    @Default(0) double size,
    @Default('') String pathFile,
  }) = _FileDocument;

  factory FileDocument.fromJson(Map<String, dynamic> json) =>
      _$FileDocumentFromJson(json);
}
