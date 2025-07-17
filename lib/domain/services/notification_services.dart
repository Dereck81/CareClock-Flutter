import 'package:careclock/domain/entities/medication.dart';

abstract class NotificationService {
  Future<void> scheduleMedication(MedicationEntity medication);
  Future<void> reprogramAll(List<MedicationEntity> medications);
}
