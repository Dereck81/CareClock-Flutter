import 'package:careclock/config/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class NavbarColor {

 static void configurationNavBarColor () {
	WidgetsBinding.instance.addPostFrameCallback((_) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        systemNavigationBarColor: AppColors.background.value,
        systemNavigationBarIconBrightness: Brightness.dark,
        //statusBarColor: Colors.transparent,
        //statusBarIconBrightness: Brightness.dark,
      ),
    );
  });
	}
	
}