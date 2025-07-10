import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Cards/medication_item_card.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeMedicationCard extends StatelessWidget {
  const TimeMedicationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      marginX: 15.w,
      marginY: 10.w,
      paddingY: 15.w,
      paddingX: 12.w,
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Text(
              '8:00',
              style: TextStyle(
                color: AppColors.textColor.value,
                fontSize: FontScaler.fromSize(FontSize.xl3),
              ),
            ),
          ),
          MedicationItemCard(),
          MedicationItemCard(),
          MedicationItemCard(),
        ],
      ),
    );
  }
}
