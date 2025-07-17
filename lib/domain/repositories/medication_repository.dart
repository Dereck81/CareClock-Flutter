import 'package:careclock/domain/entities/medication.dart';

abstract class MedicationRepository {
  Future<void> addMedication(MedicationEntity medication);
  Future<List<MedicationEntity>> getAllMedications();
}
