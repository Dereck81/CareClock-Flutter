import 'package:careclock/config/app_colors.dart';
import 'package:careclock/core/utils/number%20utils/number_range_input_formatter.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:careclock/presentation/widgets/Inputs/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class NumberInput extends StatelessWidget {
  final FormFieldSetter<String>? onSaved;
  final bool? enabled;
  final double? minValue;
  final double? maxValue;
  final TextEditingController controller;
  final List<TextInputFormatter>? inputFormatters;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onChanged;
  final double width;

  const NumberInput({
    super.key,
    required this.width,
    required this.controller,
    this.onSaved,
    this.enabled,
    this.minValue,
    this.maxValue,
    this.inputFormatters = const [],
    this.validator,
    this.onChanged,
  });

  static String _increment(
    String? value, {
    double step = 1,
    double? min,
    double? max,
  }) {
    final double current = double.tryParse(value ?? '') ?? 0;
    double next = current + step;

    if (max != null && next > max) next = max;
    if (min != null && next < min) next = min;

    return next.toStringAsFixed(next % 1 == 0 ? 0 : 2);
  }

  static String _decrement(
    String? value, {
    double step = 1,
    double? min,
    double? max,
  }) {
    final double current = double.tryParse(value ?? '') ?? 0;
    double next = current - step;

    if (max != null && next > max) next = max;
    if (min != null && next < min) next = min;

    return next.toStringAsFixed(next % 1 == 0 ? 0 : 2);
  }

  // ignore: unused_element
  ({Color borderColor, Color textColor}) _color(bool state) {
    if (state)
      // ignore: curly_braces_in_flow_control_structures
      return (
        borderColor: AppColors.danger.value,
        textColor: AppColors.danger.value,
      );
    else
      // ignore: curly_braces_in_flow_control_structures
      return (
        borderColor: AppColors.stroke.value,
        textColor: AppColors.textColor.value,
      );
  }

  @override
  Widget build(BuildContext context) {
    inputFormatters!.add(
      NumberRangeInputFormatter(min: minValue, max: maxValue),
    );

    return CustomContainer(
      child: Row(
        children: <Widget>[
          CustomButton(
            child: Icon(PhosphorIcons.caretLeft(), size: 35.sp),
            onPressed: () {
              controller.text = _decrement(
                controller.text,
                max: maxValue,
                min: minValue,
              );
              if (onChanged != null) onChanged!(controller.text);
            },
          ),
          CustomInput(
            width: width,
            borderSide: BorderSide.none,
            keyboardType: TextInputType.number,
            inputFormatters: inputFormatters,
            validator: validator,
            controller: controller,
            onSaved: onSaved,
            onChanged: onChanged,
          ),
          CustomButton(
            child: Icon(PhosphorIcons.caretRight(), size: 35.sp),
            onPressed: () {
              controller.text = _increment(
                controller.text,
                max: maxValue,
                min: minValue,
              );
              if (onChanged != null) onChanged!(controller.text);
            },
          ),
        ],
      ),
    );

    //if (state.hasError)
    //  Text(
    //      state.errorText!,
    //      style: TextStyle(
    //        color: AppColors.danger.value,
    //        fontSize: FontScaler.fromSize(FontSize.sm),
    //      ),
    //    ),
  }
}
