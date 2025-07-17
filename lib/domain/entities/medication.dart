import 'package:flutter/material.dart';

class MedicationEntity {
  final String? medication;
  final TimeOfDay? time;
  final DateTime? date;

  MedicationEntity({this.medication, this.time, this.date});

  MedicationEntity copyWith({
    String? medication,
    TimeOfDay? time,
    DateTime? date,
  }) {
    return MedicationEntity(
      medication: medication ?? this.medication,
      time: time ?? this.time,
      date: date ?? this.date,
    );
  }

  bool get isCompleted => medication != null && time != null && date != null;
}
