import 'dart:io';

import 'package:application_demo/data/models/file_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

class DataModel {
  DateTime startDate;
  DateTime endDate;
  TimeOfDay startTime;
  TimeOfDay endTime;
  String description;
  List<File> images;
  FileDocument file;

  DataModel({
    required this.startDate,
    required this.endDate,
    required this.startTime,
    required this.endTime,
    required this.description,
    required this.images,
    required this.file,
  });
}
