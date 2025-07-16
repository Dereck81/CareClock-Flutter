import 'package:careclock/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomInput extends StatelessWidget {
  final double width;
  final double? marginX;
  final double? marginY;
  final IconData? icon;
  final double? iconSize;
  final String? labelText;
  final String? hintText;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final FormFieldSetter<String>? onSaved;
  final bool? enable;
  final String? initialValue;
  final TextInputType? keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final BorderSide? borderSide;
  final ValueChanged<String>? onChanged;

  const CustomInput({
    super.key,
    required this.width,
    this.marginX = 0,
    this.marginY = 0,
    this.icon,
    this.iconSize = 0,
    this.labelText = '',
    this.hintText = '',
    this.validator,
    this.controller,
    this.onSaved,
    this.enable = true,
    this.initialValue,
    this.keyboardType,
    this.inputFormatters,
    this.borderSide,
    this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    final OutlineInputBorder outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.r),
      borderSide:
          borderSide ?? BorderSide(width: 2.w, color: AppColors.stroke.value),
    );

    final OutlineInputBorder errorInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(50.r),
      borderSide:
          borderSide ??
          BorderSide(width: 2.w, color: AppColors.dangerBorder.value),
    );

    final FocusNode focusNode = FocusNode();

    return Container(
      width: width,
      margin: EdgeInsets.symmetric(vertical: marginY!, horizontal: marginX!),
      child: TextFormField(
        initialValue: initialValue,
        focusNode: focusNode,
        onTapOutside: (event) => focusNode.unfocus(),
        onChanged: onChanged,
        validator: validator,
        controller: controller,
        onSaved: onSaved,
        enabled: enable,
        keyboardType: keyboardType,
        inputFormatters: inputFormatters,
        decoration: InputDecoration(
          icon: (icon != null)
              ? Icon(icon, size: (icon == null) ? 0 : iconSize)
              : null,
          contentPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 20.w),
          labelText: labelText,
          hintText: hintText,
          border: outlineInputBorder,
          errorBorder: errorInputBorder,
          focusedErrorBorder: errorInputBorder,
          disabledBorder: outlineInputBorder,
          enabledBorder: outlineInputBorder,
          focusedBorder: outlineInputBorder,
        ),
      ),
    );
  }
}
