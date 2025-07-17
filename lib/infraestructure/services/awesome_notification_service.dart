// lib/infrastructure/services/awesome_notification_service.dart
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:careclock/data/models/medication_model.dart';
import 'package:careclock/domain/entities/medication.dart';
import 'package:careclock/domain/services/notification_services.dart';
import 'package:hive/hive.dart';

class AwesomeNotificationService implements NotificationService {
  @override
  Future<void> scheduleMedication(MedicationEntity med) async {
    final now = DateTime.now();
    final notificationDate = DateTime(
      med.date!.year,
      med.date!.month,
      med.date!.day,
      med.time!.hour,
      med.time!.minute,
    );

    if (notificationDate.isBefore(now)) return;

    await AwesomeNotifications().createNotification(
      content: NotificationContent(
        id: notificationDate.millisecondsSinceEpoch ~/ 1000,
        channelKey: 'meds_channel',
        title: '⏰💊 Recordatorio de Medicamento',
        body: '💊 Es hora de tomar: ${med.medication}',
        notificationLayout: NotificationLayout.Default,
      ),
      schedule: NotificationCalendar(
        year: notificationDate.year,
        month: notificationDate.month,
        day: notificationDate.day,
        hour: notificationDate.hour,
        minute: notificationDate.minute,
        second: 0,
        millisecond: 0,
        timeZone: await AwesomeNotifications().getLocalTimeZoneIdentifier(),
        repeats: false,
      ),
    );
  }

  @override
  Future<void> reprogramAll(List<MedicationEntity> medications) async {
    for (final med in medications) {
      await scheduleMedication(med);
    }
  }
}

Future<void> reprogramAllNotifications() async {
  final box = Hive.box<MedicationModel>('medications');

  final medications = box.values.map((model) => model.toEntity()).toList();

  final service = AwesomeNotificationService();
  await service.reprogramAll(medications);
}
