import 'package:careclock/domain/entities/medication.dart';
import 'package:careclock/domain/services/notification_services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:careclock/domain/repositories/medication_repository.dart';

class MedicationNotifier extends StateNotifier<List<MedicationEntity>> {
  final MedicationRepository _repo;
  final NotificationService _notificationService;

  MedicationNotifier(this._repo, this._notificationService) : super([]) {
    loadMedications();
  }

  Future<void> loadMedications() async {
    final meds = await _repo.getAllMedications();
    state = meds;
  }

  Future<void> addMedication(MedicationEntity medication) async {
    await _repo.addMedication(medication);
    await _notificationService.scheduleMedication(medication);

    state = [...state, medication];
  }
}
