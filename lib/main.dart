import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/app_theme.dart';
import 'package:careclock/config/navbar_color.dart';
import 'package:careclock/injection_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:careclock/infraestructure/services/awesome_notification_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Hive.initFlutter();

  initHiveAdapters();

  await initDependencies();

  await AwesomeNotifications().initialize(null, [
    NotificationChannel(
      channelKey: 'meds_channel',
      channelName: 'Medicamentos',
      channelDescription: 'Notificaciones de medicamentos',
      defaultColor: Colors.blue,
      ledColor: Colors.blue,
      importance: NotificationImportance.High,
    ),
  ], debug: true);

  runApp(const ProviderScope(child: CareClock()));
  //Future.microtask(() async {
  //  await reprogramAllNotifications();
  //});
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
          darkTheme:
              AppTheme.getLightTheme(), //darkTheme: AppTheme.getDarkTheme(),
          theme: AppTheme.getLightTheme(),
        );
      },
    );
  }
}
