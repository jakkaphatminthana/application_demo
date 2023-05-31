import 'package:application_demo/data/models/file_model.dart';
import 'package:application_demo/data/models/ot_form_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

class OTFormNotifier extends StateNotifier<List<OTFormEntity>> {
  OTFormNotifier() : super([]);

  void addData(OTFormEntity otFormEntity) {
    state = [...state, otFormEntity];
  }
}
//======================================================================================================================

// final startDateProvider =
//     StateProvider.autoDispose<DateTime>((ref) => DateTime.now());

// final endDateProvider =
//     StateProvider.autoDispose<DateTime>((ref) => DateTime.now());

// final startTimeProvider =
//     StateProvider.autoDispose<TimeOfDay>((ref) => TimeOfDay.now());

// final endTimeProvider = StateProvider.autoDispose<TimeOfDay>((ref) => TimeOfDay(
//       hour: TimeOfDay.now().hour + 1,
//       minute: TimeOfDay.now().minute,
//     ));
final uuid = const Uuid().v4();

//Data List Notifier
final otFormNotifierProvider =
    StateNotifierProvider<OTFormNotifier, List<OTFormEntity>>(
  (ref) => OTFormNotifier(),
);

//Entity
final otFormProvider = StateProvider.autoDispose<OTFormEntity>(
  (ref) => OTFormEntity(
    id: uuid,
    startDate: DateTime.now(),
    endDate: DateTime.now(),
    startTime: TimeOfDay.now(),
    endTime: TimeOfDay(
      hour: TimeOfDay.now().hour + 1,
      minute: TimeOfDay.now().minute,
    ),
  ),
);

//FilePick
final filePickProvider =
    StateProvider.autoDispose<FileDocument?>((ref) => null);
