import 'package:careclock/config/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData getLightTheme() {
    return ThemeData(
      useMaterial3: true,
      canvasColor: AppColors.background.value,
      scaffoldBackgroundColor: AppColors.background.value,
      appBarTheme: AppBarTheme(backgroundColor: AppColors.background.value),
    );
  }

  static ThemeData getDarkTheme() {
    return ThemeData(useMaterial3: true);
  }
}
