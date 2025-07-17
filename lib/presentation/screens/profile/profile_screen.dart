import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Cards/family/family_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 10.h,
      children: <Widget>[
        Center(
          child: ClipOval(
            child: Image.network(
              'https://media.licdn.com/dms/image/v2/C5103AQHVNY8S-7B6QQ/profile-displayphoto-shrink_200_200/profile-displayphoto-shrink_200_200/0/1517493863945?e=2147483647&v=beta&t=cv9ao8HcOwGFd0BAhoB8ZLNA1v3eDRJtBY0R0rBuAZs', // <-- tu URL aquí
              width: 200.w,
              height: 200.w,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return const CircularProgressIndicator();
              },
              errorBuilder: (context, error, stackTrace) {
                return Icon(
                  PhosphorIcons.userCircle(PhosphorIconsStyle.fill),
                  size: 225.sp,
                ); // o imagen por defecto
              },
            ),
          ),
        ),
        Text(
          'Roberto Celis',
          style: TextStyle(
            color: AppColors.textColor.value,
            fontWeight: FontWeight.bold,
            fontSize: FontScaler.fromSize(FontSize.xl2),
          ),
          overflow: TextOverflow.ellipsis,
        ),
        FamilyCard(),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 20.h),
          margin: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(25.r),
            gradient: LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: [Color(0XFF7FFF63), Color(0XFF007200)],
            ),
          ),
          child: Row(
            spacing: 10.w,
            children: <Widget>[
              Text(
                '93%',
                style: TextStyle(
                  color: Color(0XFF343434),
                  fontSize: FontScaler.fromSize(FontSize.xl3),
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'de adherencia esta semana',
                style: TextStyle(
                  color: Color(0XFF343434),
                  fontSize: FontScaler.fromSize(FontSize.lg),
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
