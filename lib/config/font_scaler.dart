import 'dart:math';

import 'package:flutter_screenutil/flutter_screenutil.dart';

enum FontSize {
	xs(-2),
	sm(-1),
	bs(0),
	lg(1),
	xl(2),
	xl2(3),
	xl3(4),
	xl4(5),
	xl5(6),
	xl6(7),
	xl7(8),
	xl8(9),
	xl9(10);

	final int level;
	const FontSize(this.level);
}


class FontScaler {

	static const double _base = 16;
	static const double _scale = 1.2; //minor-third

	static double fromSize(FontSize fontSize) {
	 final raw = _base * pow(_scale, fontSize.level);
	 return raw.sp;
	 
  }

}