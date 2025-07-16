import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/app_theme.dart';
import 'package:careclock/config/navbar_color.dart';
import 'package:careclock/presentation/screens/login/email_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() => runApp(CareClock());

class CareClock extends StatelessWidget {
  const CareClock({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(460, 880),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, child) {
        NavbarColor.configurationNavBarColor();
        return MaterialApp.router(
          title: 'CareClock',
          routerConfig: AppGoRouter.appRouter(),
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          darkTheme:
              AppTheme.getLightTheme(), //darkTheme: AppTheme.getDarkTheme(),
          theme: AppTheme.getLightTheme(),
        );
      },
    );
  }
}
