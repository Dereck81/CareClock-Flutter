import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class DateRangeInput extends StatelessWidget {
  final DateTimeRange? initialValue;
  final FormFieldSetter<DateTimeRange>? onSaved;
  final FormFieldValidator<DateTimeRange>? validator;
  final bool? enabled;
  final String? hintText;
  final DateTime? firstDate;
  final DateTime? lastDate;
  final String? dateFormat;
  final String? helpText;
  final String? cancelText;
  final String? confirmText;
  final String? saveText;

  const DateRangeInput({
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
    this.saveText,
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

  String _formatDateRange(DateTimeRange range) {
    final format = dateFormat != null
        ? DateFormat(dateFormat)
        : DateFormat('dd/MM/yyyy');
    return '${format.format(range.start)} - ${format.format(range.end)}';
  }

  @override
  Widget build(BuildContext context) {
    return FormField<DateTimeRange>(
      key: key,
      initialValue: initialValue,
      onSaved: onSaved,
      validator: validator,
      enabled: enabled!,
      builder: (FormFieldState<DateTimeRange> state) {
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

                final DateTimeRange? picked = await showDateRangePicker(
                  context: state.context,
                  initialDateRange: state.value,
                  firstDate: firstDate ?? DateTime(1900),
                  lastDate: lastDate ?? DateTime(2100),
                  helpText: helpText ?? 'Seleccionar rango de fechas',
                  cancelText: cancelText ?? 'Cancelar',
                  confirmText: confirmText ?? 'Confirmar',
                  saveText: saveText ?? 'Guardar',
                  builder: (context, child) {
                    return Theme(
                      data: Theme.of(context).copyWith(
                        colorScheme: Theme.of(context).colorScheme.copyWith(
                          primary: AppColors.primary.value,
                          onPrimary: Colors.white,
                          surface: Colors.white,
                          onSurface: AppColors.textColor.value,
                        ),
                      ),
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
                  Expanded(
                    child: Text(
                      state.value != null
                          ? _formatDateRange(state.value!)
                          : hintText ?? 'dd/mm/aaaa - dd/mm/aaaa',
                      style: TextStyle(
                        color: textColor,
                        fontSize: FontScaler.fromSize(FontSize.lg),
                      ),
                    ),
                  ),
                  Icon(
                    PhosphorIcons.calendarBlank(),
                    size: 30.sp,
                    color: textColor,
                  ),
                ],
              ),
            ),
            if (state.hasError)
              Padding(
                padding: EdgeInsets.only(top: 4.h, left: 15.w),
                child: Text(
                  state.errorText!,
                  style: TextStyle(
                    color: AppColors.danger.value,
                    fontSize: FontScaler.fromSize(FontSize.sm),
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
