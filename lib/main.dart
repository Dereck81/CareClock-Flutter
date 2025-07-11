import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/app_theme.dart';
import 'package:careclock/config/navbar_color.dart';
import 'package:careclock/presentation/screens/login/email_input_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:timezone/data/latest.dart' as tz;
import 'package:timezone/timezone.dart' as tz;

final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  tz.initializeTimeZones();
  const AndroidInitializationSettings initializationSettingsAndroid =
      AndroidInitializationSettings('@mipmap/ic_launcher');
  final InitializationSettings initializationSettings = InitializationSettings(
    android: initializationSettingsAndroid,
  );
  await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  runApp(const CareClock());
}

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
          theme: AppTheme.getLightTheme(),
          darkTheme: AppTheme.getDarkTheme(),
        );
      },
      child: const EmailInputScreen(),
    );
  }
}
