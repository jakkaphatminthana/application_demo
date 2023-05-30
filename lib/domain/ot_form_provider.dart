import 'package:application_demo/data/models/file_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final startDateProvider =
    StateProvider.autoDispose<DateTime>((ref) => DateTime.now());

final endDateProvider =
    StateProvider.autoDispose<DateTime>((ref) => DateTime.now());

final startTimeProvider =
    StateProvider.autoDispose<TimeOfDay>((ref) => TimeOfDay.now());

final endTimeProvider = StateProvider.autoDispose<TimeOfDay>((ref) => TimeOfDay(
      hour: TimeOfDay.now().hour + 1,
      minute: TimeOfDay.now().minute,
    ));

final filePickProvider =
    StateProvider.autoDispose<FileDocument?>((ref) => null);
