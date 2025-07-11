import 'package:flutter/material.dart';
import 'package:careclock/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class ActivitySuccessScreen extends StatelessWidget {
  final DateTime? scheduledTime;
  final String? activityName;
  const ActivitySuccessScreen({super.key, this.scheduledTime, this.activityName});

  Future<void> scheduleNotification(BuildContext context) async {
    if (scheduledTime != null && activityName != null) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        1,
        'Hora de tu actividad física',
        'Recuerda realizar $activityName',
        tz.TZDateTime.from(scheduledTime!, tz.local),
        const NotificationDetails(
          android: AndroidNotificationDetails('careclock_channel', 'Recordatorios'),
        ),
        androidAllowWhileIdle: true,
        uiLocalNotificationDateInterpretation:
            UILocalNotificationDateInterpretation.absoluteTime,
        matchDateTimeComponents: DateTimeComponents.time,
      );
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('¡Alarma programada correctamente!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(Icons.check_circle, color: Colors.green, size: 100),
            const SizedBox(height: 24),
            const Text('¡Tu recordatorio se ha guardado!', style: TextStyle(fontSize: 20)),
            const SizedBox(height: 24),
            ElevatedButton(
              onPressed: () {
                scheduleNotification(context);
                Navigator.of(context).popUntil((route) => route.isFirst);
              },
              child: const Text('Ir al calendario'),
            ),
            ElevatedButton(
              onPressed: () {
                scheduleNotification(context);
                Navigator.of(context).pop();
              },
              child: const Text('Crear otro recordatorio'),
            ),
          ],
        ),
      ),
    );
  }
} 