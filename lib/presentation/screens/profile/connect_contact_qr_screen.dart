import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Bars/progress_bar.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Buttons/secondary_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';
import 'package:qr_flutter/qr_flutter.dart';

class ConnectContactQrScreen extends StatelessWidget {
  const ConnectContactQrScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final String data = 'https://careclock.com/c/402645';

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
                PhosphorIcons.userPlus(PhosphorIconsStyle.duotone),
                duotoneSecondaryColor: Colors.lightGreenAccent,
                size: 120.sp,
              ),
            ),
            Text(
              'Escanea este QR en el dispositivo del contacto que desees conectar',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primary.value,
                fontSize: FontScaler.fromSize(FontSize.xl3),
                fontWeight: FontWeight.bold,
              ),
            ),
            CustomContainer(
              paddingX: 15.w,
              paddingY: 15.h,
              color: AppColors.stroke.value,
              child: QrImageView(
                data: data,
                backgroundColor: AppColors.background.value,
                version: QrVersions.auto,
                size: 170.0,
              ),
            ),
            SecondaryButton(
              marginX: 15.w,
              width: double.infinity,
              onPressed: () {},
              text: 'Escanear QR',
            ),
            Spacer(),
            PrimaryButton(
              marginX: 15.w,
              width: double.infinity,
              onPressed: () => context.push(AppGoRouter.confirmConnection),
              text: 'Ya escaneé el QR',
            ),
            ProgressBar(
              height: 10.h,
              marginX: 15.w,
              color: AppColors.accent.value,
              progress: 33.33,
              width: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
