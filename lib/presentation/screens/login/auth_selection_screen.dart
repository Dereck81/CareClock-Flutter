import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Buttons/secondary_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class AuthSelectionScreen extends StatelessWidget {
  const AuthSelectionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Column(
        children: <Widget>[
          Container(
            width: double.infinity,
            height: 330.h,
            margin: EdgeInsets.only(bottom: 30.h),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: <Color>[
                  AppColors.primary.value,
                  AppColors.accent.value,
                ],
              ),
              color: AppColors.primary.value,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20.r),
                bottomRight: Radius.circular(20.r),
              ),
            ),
            child: Center(
              child: Image.asset(
                'lib/assets/images/careclock.png',
                height: 225.h,
                width: 232.w,
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Text(
              'Elige cómo deseas ingresar',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: FontScaler.fromSize(FontSize.xl3),
              ),
            ),
          ),
          SecondaryButton(
            marginY: 15.h,
            marginX: 10.w,
            width: double.infinity,
            onPressed: () {},
            text: 'Continuar con Google',
          ),
          PrimaryButton(
            marginY: 3.h,
            marginX: 10.w,
            width: double.infinity,
            onPressed: () => context.push('/email-input'),
            text: 'Continuar con correo',
          ),
        ],
      ),
    );
  }
}
