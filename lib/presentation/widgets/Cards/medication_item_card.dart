import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MedicationItemCard extends StatelessWidget {
  const MedicationItemCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      onPressed: () => {},
      child: CustomContainer(
        marginY: 5.h,
        paddingY: 5.h,
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
                    color: AppColors.textColor.value,
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
                        color: AppColors.textColor.value,
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
          ],
        ),
      ),
    );
  }
}
