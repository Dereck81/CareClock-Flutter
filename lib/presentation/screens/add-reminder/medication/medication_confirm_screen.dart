import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'medication_success_screen.dart';

class MedicationConfirmScreen extends StatelessWidget {
  final String medicationName;
  final String frequency;
  final DateTime scheduledTime;
  const MedicationConfirmScreen({super.key, required this.medicationName, required this.frequency, required this.scheduledTime});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¡Casi listo!', style: TextStyle(fontSize: 18.sp)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            SizedBox(height: 40.h),
            CustomContainer(
              width: double.infinity,
              paddingY: 20.h,
              paddingX: 16.w,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Confirma estos datos para guardar tu recordatorio', style: TextStyle(fontSize: 16.sp)),
                  SizedBox(height: 16.h),
                  Text('Medicamento: $medicationName', style: TextStyle(fontSize: 15.sp)),
                  Text('Frecuencia: $frequency', style: TextStyle(fontSize: 15.sp)),
                  Text('Hora: ${scheduledTime.hour.toString().padLeft(2, '0')}:${scheduledTime.minute.toString().padLeft(2, '0')}', style: TextStyle(fontSize: 15.sp)),
                ],
              ),
            ),
            const Spacer(),
            PrimaryButton(
              width: double.infinity,
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => MedicationSuccessScreen(
                    scheduledTime: scheduledTime,
                    medicationName: medicationName,
                  ),
                ),
              ),
              text: 'Continuar',
              marginY: 20.h,
            ),
          ],
        ),
      ),
    );
  }
} 