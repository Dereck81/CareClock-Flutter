import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Cards/family/family_item.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FamilyCard extends StatelessWidget {
  const FamilyCard({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      width: double.infinity,
      paddingX: 15.w,
      marginX: 15.w,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.symmetric(vertical: 15.h, horizontal: 10.w),
            child: Text(
              'Familiares',
              style: TextStyle(
                color: AppColors.textColor.value,
                fontSize: FontScaler.fromSize(FontSize.xl),
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          FamilyItem(),
          PrimaryButton(
            marginY: 10.h,
            width: double.infinity,
            onPressed: () {},
            text: 'Conectar',
          ),
        ],
      ),
    );
  }
}
