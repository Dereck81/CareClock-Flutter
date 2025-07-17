import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/domain/entities/medication.dart';
import 'package:careclock/presentation/widgets/Cards/medication/medication_item_card.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeMedicationCard extends StatelessWidget {
  final MedicationEntity medicationEntity;
  const TimeMedicationCard({super.key, required this.medicationEntity});

  @override
  Widget build(BuildContext context) {
    //final isTheSameDate = DateValidators.isTheSameDate(
    //  medicationEntity.date!,
    //  DateTime.now(),
    //);

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
              '${medicationEntity.time!.hour}:${medicationEntity.time!.minute}',
              style: TextStyle(
                color: AppColors.textColor.value,
                fontSize: FontScaler.fromSize(FontSize.xl3),
              ),
            ),
          ),
          MedicationItemCard(medication: medicationEntity),
        ],
      ),
    );
  }
}
