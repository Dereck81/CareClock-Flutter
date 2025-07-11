import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'medication_confirm_screen.dart';

class MedicationTimeScreen extends StatefulWidget {
  final String medicationName;
  final String frequency;
  const MedicationTimeScreen({super.key, required this.medicationName, required this.frequency});

  @override
  State<MedicationTimeScreen> createState() => _MedicationTimeScreenState();
}

class _MedicationTimeScreenState extends State<MedicationTimeScreen> {
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¿A qué hora tomas este medicamento?', style: TextStyle(fontSize: 18.sp)),
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
              child: GestureDetector(
                onTap: () async {
                  final picked = await showTimePicker(
                    context: context,
                    initialTime: TimeOfDay.now(),
                  );
                  if (picked != null) setState(() => selectedTime = picked);
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.access_time, size: 28.w),
                    SizedBox(width: 16.w),
                    Text(
                      selectedTime == null
                          ? 'Selecciona la hora'
                          : selectedTime!.format(context),
                      style: TextStyle(fontSize: 18.sp),
                    ),
                  ],
                ),
              ),
            ),
            const Spacer(),
            PrimaryButton(
              width: double.infinity,
              onPressed: selectedTime == null
                  ? () {}
                  : () {
                      final now = DateTime.now();
                      final scheduledDate = DateTime(
                        now.year,
                        now.month,
                        now.day,
                        selectedTime!.hour,
                        selectedTime!.minute,
                      );
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MedicationConfirmScreen(
                            medicationName: widget.medicationName,
                            frequency: widget.frequency,
                            scheduledTime: scheduledDate,
                          ),
                        ),
                      );
                    },
              text: 'Continuar',
              marginY: 20.h,
            ),
          ],
        ),
      ),
    );
  }
} 