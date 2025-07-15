import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AddReminderTypeScreen extends StatelessWidget {
  const AddReminderTypeScreen({super.key});

  Widget _button(
    String imagePath,
    String title,
    String content,
    void Function() onPress,
  ) {
    return CustomButton(
      onPressed: onPress,
      child: CustomContainer(
        paddingX: 15.w,
        paddingY: 10.h,
        marginX: 15.w,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          spacing: 10.w,
          children: <Widget>[
            ClipRRect(
              borderRadius: BorderRadiusGeometry.circular(35.r),
              child: Image.asset(
                imagePath,
                height: 100.h,
                width: 130.w,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    title,
                    style: TextStyle(
                      color: AppColors.textColor.value,
                      fontSize: FontScaler.fromSize(FontSize.xl),
                    ),
                  ),
                  Text(
                    content,
                    style: TextStyle(
                      color: AppColors.textColor.value,
                      fontSize: FontScaler.fromSize(FontSize.lg),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      spacing: 15.w,
      children: <Widget>[
        _button(
          'lib/assets/images/medication.jpg',
          'Medicación',
          'Agrega recordatorios para pastillas, ampollas, jarabes, etc.',
          () {
            context.push(AppGoRouter.medicationSearch);
          },
        ),
        _button(
          'lib/assets/images/activity.png',
          'Actividad Física',
          'Programa una actividad física que desees realizar.',
          () {},
        ),
        _button(
          'lib/assets/images/appointment.png',
          'Cita Médica',
          'Programa una cita médica y ten un recordatorio para no olvidarla.',
          () {},
        ),
      ],
    );
  }
}
