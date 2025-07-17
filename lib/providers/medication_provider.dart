import 'package:careclock/domain/entities/medication.dart';
import 'package:careclock/domain/services/notification_services.dart';
import 'package:careclock/infraestructure/services/awesome_notification_service.dart';
import 'package:careclock/providers/medication_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:careclock/data/models/medication_model.dart';
import 'package:careclock/data/repositories_impl/medication_repository_impl.dart';
import 'package:careclock/domain/repositories/medication_repository.dart';
import 'package:hive/hive.dart';

final medicationRepositoryProvider = Provider<MedicationRepository>((ref) {
  final box = Hive.box<MedicationModel>('medications');
  return MedicationRepositoryImpl(box);
});

final notificationServiceProvider = Provider<NotificationService>((ref) {
  return AwesomeNotificationService();
});

final medicationListProvider =
    StateNotifierProvider<MedicationNotifier, List<MedicationEntity>>((ref) {
      final repo = ref.watch(medicationRepositoryProvider);
      final notification = ref.read(notificationServiceProvider);
      return MedicationNotifier(repo, notification);
    });
