import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Inputs/custom_input.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'medication_frequency_screen.dart';

class MedicationSearchScreen extends StatefulWidget {
  const MedicationSearchScreen({super.key});

  @override
  State<MedicationSearchScreen> createState() => _MedicationSearchScreenState();
}

class _MedicationSearchScreenState extends State<MedicationSearchScreen> {
  String? selectedMedication;
  final List<String> medications = [
    'Paracetamol 500mg, Tabletas',
    'Ibuprofeno 400mg, Tabletas',
    'Amoxicilina 500mg, Cápsulas',
    'Otro',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Medicamento', style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            CustomInput(
              width: double.infinity,
              labelText: 'Buscar',
              marginY: 10.h,
            ),
            Expanded(
              child: ListView.separated(
                itemCount: medications.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final isSelected = selectedMedication == medications[index];
                  return GestureDetector(
                    onTap: () => setState(() => selectedMedication = medications[index]),
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
                            medications[index],
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
              onPressed: selectedMedication == null
                  ? () {}
                  : () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => MedicationFrequencyScreen(
                            medicationName: selectedMedication!,
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