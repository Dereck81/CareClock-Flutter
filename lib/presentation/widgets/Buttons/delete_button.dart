import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteButton extends StatelessWidget {
  final void Function() onPress;
  final double? width;
  final double? heigh;

  const DeleteButton({
    super.key,
    this.width,
    this.heigh,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      width: width ?? 50.w,
      onPressed: onPress,
      childAlignment: Alignment.center,
      backgroundColor: AppColors.danger.value,
      borderRadius: 50.r,
      child: Text(
        'X',
        style: TextStyle(
          color: Colors.white,
          fontSize: FontScaler.fromSize(FontSize.xl),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
