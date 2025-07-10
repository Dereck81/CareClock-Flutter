import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProgressBar extends StatelessWidget {
  final double progress;
  final double width;
  final double height;
  final Color color;
  final double? marginX;
  final double? marginY;

  const ProgressBar({
    super.key,
    required this.progress,
    required this.width,
    required this.color,
    required this.height,
    this.marginX = 0,
    this.marginY = 0,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double fullWidth = (width == double.infinity)
            ? constraints.maxWidth
            : width;

        double calculatedProgress = -1;

        if (progress >= 100) calculatedProgress = fullWidth.w;
        if (progress <= 0) calculatedProgress = 0;
        if (calculatedProgress == -1) calculatedProgress = (fullWidth * (progress / 100)).w;

        return Container(
          width: fullWidth,
          height: height,
          clipBehavior: Clip.hardEdge,
          margin: EdgeInsets.symmetric(
            vertical: marginY!,
            horizontal: marginX!,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(50.r),
            border: BoxBorder.all(width: 2.w, color: color),
          ),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Container(width: calculatedProgress, color: color),
          ),
        );
      },
    );
  }
}
