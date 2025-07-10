import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Center(
          child: Image.asset(
            'lib/assets/images/careclock.png',
            height: 225.h,
            width: 232.w,
          ),
        ),
      ],
    );
  }
}
