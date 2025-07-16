import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/core/utils/number%20utils/no_leading_zero_formatter.dart';
import 'package:careclock/presentation/widgets/Bars/progress_bar.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Buttons/secondary_button.dart';
import 'package:careclock/presentation/widgets/Inputs/number_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MedicationConfirmScreen extends StatefulWidget {
  const MedicationConfirmScreen({super.key});

  @override
  State<MedicationConfirmScreen> createState() =>
      _MedicationConfirmScreenState();
}

class _MedicationConfirmScreenState extends State<MedicationConfirmScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController _controllerStock = TextEditingController(
    text: '0',
  );
  final TextEditingController _controllerNotifyWhen = TextEditingController(
    text: '0',
  );

  double? _stock = 0;
  double? _notifyWhen = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15.h,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 50.h),
              child: PhosphorIcon(
                PhosphorIcons.pill(PhosphorIconsStyle.duotone),
                duotoneSecondaryOpacity: 1,
                duotoneSecondaryColor: Colors.red,
                size: 80.sp,
              ),
            ),
            Text(
              '¡Casi listo!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary.value,
                fontSize: FontScaler.fromSize(FontSize.xl3),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Completa estos datos para avisarte cuando tu medicación está por acabarse',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.accent.value,
                fontSize: FontScaler.fromSize(FontSize.lg),
                fontWeight: FontWeight.bold,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30.w),
              child: Form(
                key: _formKey,
                child: Column(
                  spacing: 15.h,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Existencias',
                          style: TextStyle(
                            color: AppColors.textColor.value,
                            fontSize: FontScaler.fromSize(FontSize.lg),
                          ),
                        ),
                        NumberInput(
                          width: 70.w,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            NoLeadingZeroFormatter(),
                          ],
                          controller: _controllerStock,
                          onSaved: (newValue) => setState(
                            () => _stock = double.tryParse(newValue ?? ''),
                          ),
                          minValue: 0,
                          maxValue: 100,
                          validator: (value) {
                            if (value != null) return null;
                            return 'Este campo es requerido';
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Avisar cuando',
                          style: TextStyle(
                            color: AppColors.textColor.value,
                            fontSize: FontScaler.fromSize(FontSize.lg),
                          ),
                          softWrap: true,
                        ),
                        NumberInput(
                          width: 70.w,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            NoLeadingZeroFormatter(),
                          ],
                          controller: _controllerNotifyWhen,
                          validator: (value) {
                            if (value != null) return null;
                            return 'Este campo es requerido';
                          },
                          onSaved: (newValue) => setState(
                            () => _notifyWhen = double.tryParse(newValue ?? ''),
                          ),
                          minValue: 0,
                          maxValue: 100,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            SecondaryButton(
              marginX: 15.w,
              width: double.infinity,
              onPressed: () => AppGoRouter.medicationSuccess,
              text: 'Omitir',
            ),
            PrimaryButton(
              marginX: 15.w,
              width: double.infinity,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  print(_stock);
                  print(_notifyWhen);
                  context.push(AppGoRouter.medicationSuccess);
                }
              },
              text: 'Continuar',
            ),
            ProgressBar(
              height: 10.h,
              marginX: 15.w,
              width: double.infinity,
              color: AppColors.accent.value,
              progress: 100,
            ),
          ],
        ),
      ),
    );
  }
}
