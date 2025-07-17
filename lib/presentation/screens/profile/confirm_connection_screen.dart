import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Bars/progress_bar.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Cards/family/family_item_confirm.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class ConfirmConnectionScreen extends StatelessWidget {
  const ConfirmConnectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          spacing: 15.h,
          children: <Widget>[
            Text(
              'Acepta la conexión',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary.value,
                fontSize: FontScaler.fromSize(FontSize.xl4),
                fontWeight: FontWeight.bold,
              ),
            ),
            FamilyItemConfirm(marginX: 15.w),
            FamilyItemConfirm(marginX: 15.w),
            Spacer(),
            PrimaryButton(
              marginX: 15.w,
              width: double.infinity,
              onPressed: () => context.push(AppGoRouter.connectionSuccess),
              text: 'Continuar',
            ),
            ProgressBar(
              height: 10.h,
              marginX: 15.w,
              color: AppColors.accent.value,
              progress: 66.66,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
