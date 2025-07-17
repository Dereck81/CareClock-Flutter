import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/domain/entities/medication.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Buttons/secondary_button.dart';
import 'package:careclock/providers/medication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class MedicationSuccessScreen extends ConsumerWidget {
  final MedicationEntity medicationEntity;
  const MedicationSuccessScreen({super.key, required this.medicationEntity});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final controller = ref.read(medicationListProvider.notifier);

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (medicationEntity.isCompleted) {
        controller.addMedication(medicationEntity);
      }
    });

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
                PhosphorIcons.checkCircle(PhosphorIconsStyle.duotone),
                duotoneSecondaryColor: Colors.green,
                duotoneSecondaryOpacity: 1,
                color: Colors.white,
                size: 190.sp,
              ),
            ),
            Text(
              '¡Tu recordatorio se ha guardado!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary.value,
                fontSize: FontScaler.fromSize(FontSize.xl3),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Puedes revisar tus recordatorios en la sección “Calendario”',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.accent.value,
                fontSize: FontScaler.fromSize(FontSize.lg),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            SecondaryButton(
              marginX: 15.w,
              width: double.infinity,
              onPressed: () {
                context.go(AppGoRouter.home);

                WidgetsBinding.instance.addPostFrameCallback((_) {
                  context.push(AppGoRouter.medicationSearch);
                });
              },
              text: 'Crear otro recordatorio',
            ),
            PrimaryButton(
              marginX: 15.w,
              width: double.infinity,
              onPressed: () => context.go(AppGoRouter.home),
              text: 'Ir al calendario',
            ),
          ],
        ),
      ),
    );
  }
}
