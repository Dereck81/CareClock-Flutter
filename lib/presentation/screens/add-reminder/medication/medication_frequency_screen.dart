import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'medication_time_screen.dart';

class MedicationFrequencyScreen extends StatefulWidget {
  final String medicationName;
  const MedicationFrequencyScreen({super.key, required this.medicationName});

  @override
  State<MedicationFrequencyScreen> createState() => _MedicationFrequencyScreenState();
}

class _MedicationFrequencyScreenState extends State<MedicationFrequencyScreen> {
  String? selectedFrequency;
  final List<String> frequencies = [
    '2 al día',
    'Cada ciertas horas',
    'Cuando sea necesario',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¿Con qué frecuencia tomas este medicamento?', style: TextStyle(fontSize: 18.sp)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                itemCount: frequencies.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final isSelected = selectedFrequency == frequencies[index];
                  return GestureDetector(
                    onTap: () => setState(() => selectedFrequency = frequencies[index]),
                    child: CustomContainer(
                      width: double.infinity,
                      marginY: 0,
                      marginX: 0,
                      paddingY: 16.h,
                      paddingX: 16.w,
                      child: Row(
                        children: [
                          Icon(
                            isSelected ? Icons.radio_button_checked : Icons.radio_button_off,
                            color: isSelected ? Theme.of(context).primaryColor : Colors.grey,
                            size: 28.w,
                          ),
                          SizedBox(width: 16.w),
                          Text(
                            frequencies[index],
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            PrimaryButton(
              width: double.infinity,
              onPressed: selectedFrequency == null
                  ? () {}
                  : () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MedicationTimeScreen(
                            medicationName: widget.medicationName,
                            frequency: selectedFrequency!,
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