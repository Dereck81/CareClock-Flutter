import 'package:careclock/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      canvasColor: AppColors.background.value,
      scaffoldBackgroundColor: AppColors.background.value,
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.background.value,
        foregroundColor: Colors.black,
        elevation: 0,
        surfaceTintColor: Colors.transparent,
      ),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(useMaterial3: true);
  }

  static ThemeData getDatePickerLightTheme(context) {
    return Theme.of(context).copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: AppColors.primary.value,
        onPrimary: Colors.white,
        surface: Colors.white,
        onSurface: AppColors.textColor.value,
      ),
    );
  }

	static ThemeData getDatePickerDarkTheme(context) {
    return Theme.of(context).copyWith(
      colorScheme: Theme.of(context).colorScheme.copyWith(
        primary: AppColors.primary.value,
        onPrimary: Colors.white,
        surface: Colors.white,
        onSurface: AppColors.textColor.value,
      ),
    );
  }
}
