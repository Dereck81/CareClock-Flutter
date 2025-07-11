import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'activity_time_screen.dart';

class ActivityFrequencyScreen extends StatefulWidget {
  final String activityName;
  const ActivityFrequencyScreen({super.key, required this.activityName});

  @override
  State<ActivityFrequencyScreen> createState() => _ActivityFrequencyScreenState();
}

class _ActivityFrequencyScreenState extends State<ActivityFrequencyScreen> {
  String? selectedFrequency;
  final List<String> frequencies = [
    'Diario',
    'Semanal',
    'Mensual',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('¿Con qué frecuencia realizas esta actividad?', style: TextStyle(fontSize: 18.sp)),
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
              onPressed: selectedFrequency == null ? () {} : () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ActivityTimeScreen(

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