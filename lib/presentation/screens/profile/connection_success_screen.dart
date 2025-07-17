import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Bars/progress_bar.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ConnectionSuccessScreen extends StatelessWidget {
  const ConnectionSuccessScreen({super.key});

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
                PhosphorIcons.checkCircle(PhosphorIconsStyle.duotone),
                duotoneSecondaryColor: Colors.green,
                duotoneSecondaryOpacity: 1,
                color: Colors.white,
                size: 190.sp,
              ),
            ),
            Text(
              '¡Se ha conectado con tu nuevo contacto!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary.value,
                fontSize: FontScaler.fromSize(FontSize.xl3),
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Ahora tu nuevo contacto recibira tus recordatorios y podra dar seguimiento a tu medicación',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.accent.value,
                fontSize: FontScaler.fromSize(FontSize.lg),
                fontWeight: FontWeight.bold,
              ),
            ),
            Spacer(),
            PrimaryButton(
              marginX: 15.w,
              width: double.infinity,
              onPressed: () => context.go(AppGoRouter.home),
              text: 'Finalizar',
            ),
            ProgressBar(
              marginX: 15.w,
              progress: 100,
              width: double.infinity,
              color: AppColors.accent.value,
              height: 10.h,
            ),
          ],
        ),
      ),
    );
  }
}
