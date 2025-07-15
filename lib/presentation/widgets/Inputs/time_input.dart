import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_theme.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class TimeInput extends StatelessWidget {
  final TimeOfDay? initialValue;
  final FormFieldSetter<TimeOfDay>? onSaved;
  final FormFieldValidator<TimeOfDay>? validator;
  final bool? enabled;
  final String? hintText;

  const TimeInput({
    super.key,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.enabled = true,
    this.hintText,
  });

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
    return FormField<TimeOfDay>(
      key: key,
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator,
      enabled: enabled!,
      builder: (FormFieldState<TimeOfDay> state) {
        final (:borderColor, :textColor) = _color(state.hasError);
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomButton(
              borderColor: borderColor,
              borderWidth: 2.w,
              borderRadius: 40.r,
              onPressed: () async {
                if (!enabled!) return;
                final TimeOfDay? picked = await showTimePicker(
                  context: state.context,
                  initialTime: state.value ?? TimeOfDay.now(),
                  builder: (context, child) {
                    return Theme(
                      data: AppTheme.getDatePickerLightTheme(context),
                      //timePickerTheme: TimePickerThemeData(
                      //  dialHandColor: AppColors.primary.value,
                      //  hourMinuteTextColor: AppColors.textColor.value,
                      //  entryModeIconColor: AppColors.primary.value,
                      //),
                      child: child!,
                    );
                  },
                );
                if (picked != null) {
                  state.didChange(picked);
                }
              },
              paddingX: 15.w,
              paddingY: 10.h,
              child: Row(
                spacing: 40.w,
                children: <Widget>[
                  Text(
                    state.value != null
                        ? '${state.value!.hour.toString().padLeft(2, '0')}:${state.value!.minute.toString().padLeft(2, '0')}'
                        : hintText ?? '--:--',
                    style: TextStyle(
                      color: textColor,
                      fontSize: FontScaler.fromSize(FontSize.lg),
                    ),
                  ),
                  Icon(PhosphorIcons.clock(), size: 30.sp, color: textColor),
                ],
              ),
            ),
            //if (state.hasError)
            //  Text(
            //      state.errorText!,
            //      style: TextStyle(
            //        color: AppColors.danger.value,
            //        fontSize: FontScaler.fromSize(FontSize.sm),
            //      ),
            //    ),
          ],
        );
      },
    );
  }
}
