//TODO : TimeOfDayConverter JSON
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

class TimeOfDayConverter implements JsonConverter<TimeOfDay?, Map<String, dynamic>> {
  const TimeOfDayConverter();

  @override
  TimeOfDay? fromJson(Map<String, dynamic> json) {
    return json != null ? TimeOfDay(hour: json['hour'], minute: json['minute']) : null;
  }

  @override
  Map<String, dynamic> toJson(TimeOfDay? time) {
    return time != null ? {'hour': time.hour, 'minute': time.minute} : {};
  }
}