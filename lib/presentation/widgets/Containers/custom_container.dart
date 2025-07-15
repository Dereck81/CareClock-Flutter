import 'package:careclock/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomContainer extends StatelessWidget {
  final Widget child;
  final double? marginX;
  final double? marginY;
  final double? paddingX;
  final double? paddingY;
  final double? width;
  final double? height;
  final Color? color;
  final double? borderRadius;
	final Color? borderColor;

  const CustomContainer({
    super.key,
    required this.child,
    this.color,
    this.marginX = 0,
    this.marginY = 0,
    this.paddingX = 0,
    this.paddingY = 0,
    this.height,
    this.width,
    this.borderRadius,
		this.borderColor
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      padding: EdgeInsets.symmetric(vertical: paddingY!, horizontal: paddingX!),
      margin: EdgeInsets.symmetric(vertical: marginY!, horizontal: marginX!),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(borderRadius ?? 40.r),
        border: BoxBorder.all(color: borderColor ?? AppColors.stroke.value, width: 2.w),
      ),
      child: child,
    );
  }
}
