import 'dart:io';
import 'package:application_demo/data/models/file_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../utils/file_converter.dart';
import '../utils/time_coverter.dart';

part 'ot_form_entity.freezed.dart';
part 'ot_form_entity.g.dart';

@freezed
class OTFormEntity with _$OTFormEntity {

  factory OTFormEntity({
    @Default('') String id,
    DateTime? startDate,
    DateTime? endDate,

    @TimeOfDayConverter()
    TimeOfDay? startTime,

    @TimeOfDayConverter()
    TimeOfDay? endTime,

    @Default('') String description,

    @FileConverter()
    @Default([]) List<File> images,
    @Default(FileDocument()) FileDocument file,

  }) = _OTFormEntity;

  factory OTFormEntity.fromJson(Map<String, dynamic> json) =>
      _$OTFormEntityFromJson(json);
}



