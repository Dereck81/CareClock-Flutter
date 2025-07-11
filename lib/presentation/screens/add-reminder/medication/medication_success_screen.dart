import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:careclock/main.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/timezone.dart' as tz;

class MedicationSuccessScreen extends StatelessWidget {
  final DateTime? scheduledTime;
  final String? medicationName;
  const MedicationSuccessScreen({super.key, this.scheduledTime, this.medicationName});

  Future<void> scheduleNotification(BuildContext context) async {
    if (scheduledTime != null && medicationName != null) {
      await flutterLocalNotificationsPlugin.zonedSchedule(
        0,
        'Hora de tomar tu medicamento',
        'Recuerda tomar $medicationName',
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
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.check_circle, color: Colors.green, size: 100.w),
              SizedBox(height: 24.h),
              CustomContainer(
                width: double.infinity,
                paddingY: 20.h,
                paddingX: 16.w,
                child: Column(
                  children: [
                    Text('¡Tu recordatorio se ha guardado!', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8.h),
                    Text('Recibirás una notificación a la hora indicada.', style: TextStyle(fontSize: 15.sp)),
                  ],
                ),
              ),
              SizedBox(height: 24.h),
              PrimaryButton(
                width: double.infinity,
                onPressed: () {
                  scheduleNotification(context);
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                text: 'Ir al calendario',
                marginY: 10.h,
              ),
              PrimaryButton(
                width: double.infinity,
                onPressed: () {
                  scheduleNotification(context);
                  Navigator.of(context).pop();
                },
                text: 'Crear otro recordatorio',
                marginY: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
} 