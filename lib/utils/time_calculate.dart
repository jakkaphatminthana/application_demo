import 'package:flutter/material.dart';

String calculateDuration({
  required DateTime startDate,
  required DateTime endDate,
  required TimeOfDay startTime,
  required TimeOfDay endTime,
}) {
  DateTime startDateTime = DateTime(
    startDate.year,
    startDate.month,
    startDate.day,
    startTime.hour,
    startTime.minute,
  );

  DateTime endDateTime = DateTime(
    endDate.year,
    endDate.month,
    endDate.day,
    endTime.hour,
    endTime.minute,
  );

  Duration duration = endDateTime.difference(startDateTime);
  int hours = duration.inHours;
  int minutes = duration.inMinutes.remainder(60);

  return '$hours ชั่วโมง $minutes นาที';
}
