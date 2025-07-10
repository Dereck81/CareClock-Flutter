import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class PrimaryButton extends StatelessWidget {
  final double width;
  final VoidCallback onPressed;
  final String text;
  final double marginX;
  final double marginY;

  const PrimaryButton({
    super.key,
    required this.width,
    required this.onPressed,
    required this.text,
    this.marginX = 0,
    this.marginY = 0,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      backgroundColor: AppColors.primary.value,
      borderRadius: 50.r,
      width: width,
      marginY: marginY,
      marginX: marginX,
      paddingY: 10.h,
      onPressed: onPressed,
      childAlignment: Alignment.center,
      child: Text(
        text,
        style: TextStyle(
          color: Colors.white,
          fontSize: FontScaler.fromSize(FontSize.lg),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
