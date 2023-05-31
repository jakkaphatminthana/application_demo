//TODO : FileConverter JSON
import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

class FileConverter implements JsonConverter<List<File>, List<String>> {
  const FileConverter();

  @override
  List<File> fromJson(List<String> json) {
    return json.map((e) => File(e)).toList();
  }

  @override
  List<String> toJson(List<File> files) {
    return files.map((e) => e.path).toList();
  }
}