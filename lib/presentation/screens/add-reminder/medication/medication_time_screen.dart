import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/core/utils/validators/date_validators.dart';
import 'package:careclock/core/utils/validators/time_validators.dart';
import 'package:careclock/domain/entities/medication.dart';
import 'package:careclock/presentation/widgets/Bars/progress_bar.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Inputs/date_input.dart';
import 'package:careclock/presentation/widgets/Inputs/time_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MedicationTimeScreen extends StatefulWidget {
  final MedicationEntity medicationEntity;
  const MedicationTimeScreen({super.key, required this.medicationEntity});

  @override
  State<MedicationTimeScreen> createState() => _MedicationTimeScreenState();
}

class _MedicationTimeScreenState extends State<MedicationTimeScreen> {
  final _formKey = GlobalKey<FormState>();
  TimeOfDay? _selectedTime;
  DateTime? _selectedDateTime;

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
                PhosphorIcons.alarm(PhosphorIconsStyle.duotone),
                size: 80.sp,
              ),
            ),
            Text(
              '¿A qué hora tomas este medicamento?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary.value,
                fontSize: FontScaler.fromSize(FontSize.xl3),
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
                          'Selecciona la hora',
                          style: TextStyle(
                            color: AppColors.textColor.value,
                            fontSize: FontScaler.fromSize(FontSize.lg),
                          ),
                        ),
                        TimeInput(
                          initialValue: _selectedTime,
                          onSaved: (newValue) =>
                              setState(() => _selectedTime = newValue),
                          validator: TimeValidators.combine([
                            TimeValidators.required,
                            TimeValidators.notPast,
                          ]),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            'Selecciona la fecha de inicio',
                            style: TextStyle(
                              color: AppColors.textColor.value,
                              fontSize: FontScaler.fromSize(FontSize.lg),
                            ),
                            softWrap: true,
                          ),
                        ),
                        DateInput(
                          initialValue: _selectedDateTime,
                          onSaved: (newValue) =>
                              setState(() => _selectedDateTime = newValue),
                          validator: DateValidators.combine([
                            DateValidators.required,
                            DateValidators.notPast,
                          ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Spacer(),
            PrimaryButton(
              marginX: 15.w,
              width: double.infinity,
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  _formKey.currentState!.save();
                  context.push(
                    AppGoRouter.medicationConfirm,
                    extra: widget.medicationEntity.copyWith(
                      time: _selectedTime,
                      date: _selectedDateTime,
                    ),
                  );
                }
              },
              text: 'Continuar',
            ),
            ProgressBar(
              height: 10.h,
              marginX: 15.w,
              width: double.infinity,
              color: AppColors.accent.value,
              progress: 66.66,
            ),
          ],
        ),
      ),
    );
  }
}
