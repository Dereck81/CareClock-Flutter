import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_theme.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:intl/intl.dart';

class DateInput extends StatelessWidget {
  final DateTime? initialValue;
  final FormFieldSetter<DateTime>? onSaved;
  final FormFieldValidator<DateTime>? validator;
  final bool? enabled;
  final String? hintText;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? dateFormat; // Formato personalizado para mostrar la fecha
  final String? helpText; // Texto de ayuda en el picker
  final String? cancelText; // Texto del botón cancelar
  final String? confirmText; // Texto del botón confirmar

  const DateInput({
    super.key,
    this.initialValue,
    this.onSaved,
    this.validator,
    this.enabled = true,
    this.hintText,
    this.firstDate,
    this.lastDate,
    this.dateFormat,
    this.helpText,
    this.cancelText,
    this.confirmText,
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

  String _formatDate(DateTime date) {
    if (dateFormat != null) {
      return DateFormat(dateFormat).format(date);
    }
    // Formato por defecto: dd/MM/yyyy
    return DateFormat('dd/MM/yyyy').format(date);
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTime>(
      key: key,
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator,
      enabled: enabled!,
      builder: (FormFieldState<DateTime> state) {
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

                final DateTime? picked = await showDatePicker(
                  context: state.context,
                  initialDate: state.value ?? DateTime.now(),
                  firstDate: firstDate ?? DateTime(1900),
                  lastDate: lastDate ?? DateTime(2100),
                  helpText: helpText ?? 'Seleccionar fecha',
                  cancelText: cancelText ?? 'Cancelar',
                  confirmText: confirmText ?? 'Confirmar',
                  builder: (context, child) {
                    return Theme(
                      data: AppTheme.getDatePickerLightTheme(context),
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
                        ? _formatDate(state.value!)
                        : hintText ?? 'dd/mm/aaaa',
                    style: TextStyle(
                      color: textColor,
                      fontSize: FontScaler.fromSize(FontSize.lg),
                    ),
                  ),
                  Icon(PhosphorIcons.calendar(), size: 30.sp, color: textColor),
                ],
              ),
            ),
            //if (state.hasError)
            //  Padding(
            //    padding: EdgeInsets.only(top: 4.h, left: 15.w),
            //    child: Text(
            //      state.errorText!,
            //      style: TextStyle(
            //        color: AppColors.danger.value,
            //        fontSize: FontScaler.fromSize(FontSize.sm),
            //      ),
            //    ),
            //  ),
          ],
        );
      },
    );
  }
}
