import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/delete_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class FamilyItem extends StatelessWidget {
  const FamilyItem({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomContainer(
      paddingX: 10.w,
      paddingY: 5.h,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        spacing: 10.w,
        children: <Widget>[
          ClipOval(
            child: Image.network(
              'https://avatars.githubusercontent.com/u/63680208?v=4', // <-- tu URL aquí
              width: 50.w,
              height: 50.w,
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
          Expanded(
            child: Text(
              'Diego Alexis Llacsahuanga Buques',
              style: TextStyle(
                color: AppColors.textColor.value,
                fontSize: FontScaler.fromSize(FontSize.lg),
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ),
          DeleteButton(onPress: () {}),
        ],
      ),
    );
  }
}
