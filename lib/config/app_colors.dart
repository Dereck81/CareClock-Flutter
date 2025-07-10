import 'package:flutter/material.dart';

enum AppColors {
	primary(Color(0xFF0060E6)),
	primaryAccent(Color(0xFF0054C9)),
	accent(Color(0XFF5E00D4)),
	secondary(Color(0XFFFF7439)),
  stroke(Color(0XFFE9E9E9)),
	background(Color(0XFFFFFFFF)),
	dangerBorder(Color(0XFFA70000)),
	textColor(Color(0XFF000000));

	final Color value;
	
	const AppColors(this.value);
}