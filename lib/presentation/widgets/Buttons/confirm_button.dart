import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ConfirmButton extends StatelessWidget {
  final void Function() onPress;
  final double? width;
  final double? heigh;

  const ConfirmButton({
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
      backgroundColor: Colors.green,
      borderRadius: 50.r,
      child: Text(
        'Confirmar',
        style: TextStyle(
          color: Colors.white,
          fontSize: FontScaler.fromSize(FontSize.bs),
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
