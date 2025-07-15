import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Bars/progress_bar.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MedicationFrequencyScreen extends StatelessWidget {
  const MedicationFrequencyScreen({super.key});

  CustomButton _button(String title, String content, void Function() onPress) {
    return CustomButton(
      width: double.infinity,
      marginX: 15.w,
      borderWidth: 2.w,
      paddingX: 18.w,
      paddingY: 15.w,
      borderColor: AppColors.stroke.value,
      borderRadius: 40.r,
      onPressed: onPress,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        spacing: 5.h,
        children: <Widget>[
          Text(
            title,
            style: TextStyle(
              color: AppColors.textColor.value,
              fontSize: FontScaler.fromSize(FontSize.xl),
              fontWeight: FontWeight.bold,
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
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15.h,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50.h),
              child: PhosphorIcon(
                PhosphorIcons.bellRinging(PhosphorIconsStyle.duotone),
                duotoneSecondaryColor: Colors.yellow,
                duotoneSecondaryOpacity: 1,
                size: 80.sp,
              ),
            ),
            Text(
              '¿Con qué frecuencia tomas este medicamento?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary.value,
                fontSize: FontScaler.fromSize(FontSize.xl3),
                fontWeight: FontWeight.bold,
              ),
            ),
            Column(
              spacing: 10.h,
              children: <Widget>[
                _button(
                  'Una vez al día',
                  'Elige la hora para tomar tu medicación.',
                  () {
                    context.push(AppGoRouter.medicationTime);
                  },
                ),
                _button(
                  'Cada ciertas horas',
                  'Elige la cantidad de horas entre cada toma.',
                  () {},
                ),
                _button(
                  'Cuando sea necesario',
                  'Tú eliges en qué momento tomar tu medicación.',
                  () {},
                ),
              ],
            ),
            Spacer(),
            ProgressBar(
              height: 10.h,
              marginX: 15.w,
              color: AppColors.accent.value,
              progress: 33.33,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
