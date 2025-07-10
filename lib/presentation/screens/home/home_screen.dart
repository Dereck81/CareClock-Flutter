import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/screens/calendar/calendar_screen.dart';
import 'package:careclock/presentation/screens/profile/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;

  final List<Widget> _screens = [
    CalendarScreen(),
    Center(child: Text("Progreso")),
    Center(child: Text("Agregar")),
    ProfileScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Hoy',
          style: TextStyle(
            color: AppColors.textColor.value,
            fontSize: FontScaler.fromSize(FontSize.xl3),
          ),
        ),
      ),
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        onTap: (idx) => setState(() => _currentIndex = idx),
        selectedItemColor: AppColors.primary.value,
        currentIndex: _currentIndex,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: Icon(
              PhosphorIcons.calendarDot(PhosphorIconsStyle.fill),
              size: 35.w,
            ),
            icon: Icon(PhosphorIcons.calendarDot(), size: 35.w),
            label: 'Hoy',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              PhosphorIcons.chartLineUp(PhosphorIconsStyle.fill),
              size: 35.w,
            ),
            icon: Icon(PhosphorIcons.chartLineUp(), size: 35.w),
            label: 'Progreso',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              PhosphorIcons.plusCircle(PhosphorIconsStyle.fill),
              size: 35.w,
            ),
            icon: Icon(PhosphorIcons.plusCircle(), size: 35.w),
            label: 'Agregar',
          ),
          BottomNavigationBarItem(
            activeIcon: Icon(
              PhosphorIcons.user(PhosphorIconsStyle.fill),
              size: 35.w,
            ),
            icon: Icon(PhosphorIcons.user(), size: 35.w),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
