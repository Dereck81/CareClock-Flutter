import 'package:careclock/data/models/medication_model.dart';
import 'package:careclock/domain/entities/medication.dart';
import 'package:careclock/domain/repositories/medication_repository.dart';
import 'package:hive/hive.dart';

class MedicationRepositoryImpl implements MedicationRepository {
  final Box<MedicationModel> hiveBox;

  MedicationRepositoryImpl(this.hiveBox);

  @override
  Future<void> addMedication(MedicationEntity medication) async {
    final model = MedicationModel.fromEntity(medication);
    await hiveBox.add(model);
  }

  @override
  Future<List<MedicationEntity>> getAllMedications() async {
    return hiveBox.values.map((element) => element.toEntity()).toList();
  }
}
