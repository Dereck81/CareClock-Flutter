import 'package:careclock/domain/entities/medication.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

part 'medication_model.g.dart';

@HiveType(typeId: 0)
class MedicationModel extends HiveObject {
  @HiveField(0)
  String medication;

  @HiveField(1)
  String time; // HH:mm

  @HiveField(2)
  DateTime date;

  MedicationModel({
    required this.medication,
    required this.time,
    required this.date,
  });

  factory MedicationModel.fromEntity(MedicationEntity entity) {
    return MedicationModel(
      medication: entity.medication!, //check
      time: '${entity.time!.hour}:${entity.time!.minute}', //check
      date: entity.date!, //check
    );
  }

  MedicationEntity toEntity() {
    final parts = time.split(':');
    return MedicationEntity(
      medication: medication,
      time: TimeOfDay(hour: int.parse(parts[0]), minute: int.parse(parts[1])),
      date: date,
    );
  }
}
