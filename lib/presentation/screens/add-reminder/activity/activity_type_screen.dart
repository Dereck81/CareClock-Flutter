import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'activity_frequency_screen.dart';

class ActivityTypeScreen extends StatefulWidget {
  const ActivityTypeScreen({super.key});

  @override
  State<ActivityTypeScreen> createState() => _ActivityTypeScreenState();
}

class _ActivityTypeScreenState extends State<ActivityTypeScreen> {
  String? selectedActivity;
  final List<String> activities = [
    'Caminata',
    'Ciclismo',
    'Natación',
    'Otro',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Agregar Actividad Física', style: TextStyle(fontSize: 20.sp)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
        child: Column(
          children: [
            SizedBox(height: 20.h),
            Expanded(
              child: ListView.separated(
                itemCount: activities.length,
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemBuilder: (context, index) {
                  final isSelected = selectedActivity == activities[index];
                  return GestureDetector(
                    onTap: () => setState(() => selectedActivity = activities[index]),
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
                            activities[index],
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
              onPressed: selectedActivity == null ? () {} : () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => ActivityFrequencyScreen(activityName: selectedActivity!),
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