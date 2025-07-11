import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

enum MedicationItemCardStatus { overdue, pending, taken }

class MedicationItemCard extends StatelessWidget {
  final MedicationItemCardStatus status;

  const MedicationItemCard({
    super.key,
    this.status = MedicationItemCardStatus.overdue,
  });

  ({
    IconData iconData,
    Color iconColor,
    Color borderColor,
    Color backgroundColor,
    Color textColor,
  })
  _getIconAndColor(MedicationItemCardStatus status) {
    switch (status) {
      case MedicationItemCardStatus.overdue:
        return (
          iconData: PhosphorIcons.warningCircle(PhosphorIconsStyle.fill),
          iconColor: AppColors.danger.value,
          borderColor: AppColors.dangerBorder.value,
          backgroundColor: AppColors.danger.value,
          textColor: AppColors.textColorSecondary.value,
        );
      case MedicationItemCardStatus.pending:
        return (
          iconData: PhosphorIcons.circle(PhosphorIconsStyle.fill),
          iconColor: AppColors.background.value,
          borderColor: AppColors.primary.value,
          backgroundColor: AppColors.background.value,
          textColor: AppColors.textColor.value,
        );
      default: //taken
        return (
          iconData: PhosphorIcons.circle(PhosphorIconsStyle.fill),
          iconColor: AppColors.primary.value,
          borderColor: AppColors.primary.value,
          backgroundColor: AppColors.background.value,
          textColor: AppColors.textColor.value,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final (:iconData, :iconColor, :borderColor, :backgroundColor, :textColor) =
        _getIconAndColor(status);

    return CustomButton(
      onPressed: () => {},
      child: CustomContainer(
        marginY: 5.h,
        paddingY: 5.h,
        color: backgroundColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              width: 54.w,
              height: 54.w,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.stroke.value,
              ),
              child: Icon(PhosphorIcons.pill(), size: 35.w),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Paracetamol, Tabletas',
                  style: TextStyle(
                    color: textColor,
                    fontSize: FontScaler.fromSize(FontSize.lg),
                  ),
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 5.w,
                  children: <Widget>[
                    Text(
                      '2',
                      style: TextStyle(
                        color: textColor,
                        fontSize: FontScaler.fromSize(FontSize.bs),
                      ),
                    ),
                    Text(
                      'pildoras',
                      style: TextStyle(
                        color: AppColors.accent.value,
                        fontSize: FontScaler.fromSize(FontSize.bs),
                      ),
                    ),
                    Text(
                      'toma libre',
                      style: TextStyle(
                        color: AppColors.primary.value,
                        fontSize: FontScaler.fromSize(FontSize.bs),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Spacer(),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 10.w),
              padding: EdgeInsets.all(2.dm),
              alignment: Alignment.center,
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                color: AppColors.background.value,
                shape: BoxShape.circle,
                border: BoxBorder.all(color: borderColor),
              ),
              child: Icon(iconData, color: iconColor, size: 40.sp),
            ),
          ],
        ),
      ),
    );
  }
}
