import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Perfil', style: TextStyle(fontSize: 22.sp))),
      body: Padding(
        padding: EdgeInsets.all(16.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 60.r,
              backgroundImage: AssetImage('lib/assets/images/careclock.png'),
            ),
            SizedBox(height: 16.h),
            Text('Sandro Nole', style: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.bold)),
            SizedBox(height: 24.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text('Familiares', style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w600)),
            ),
            SizedBox(height: 8.h),
            Expanded(
              child: ListView(
                children: [
                  ListTile(
                    leading: Icon(Icons.person, size: 32.w),
                    title: Text('Benjamín Nole', style: TextStyle(fontSize: 16.sp)),
                    trailing: Icon(Icons.check_circle, color: Colors.green, size: 24.w),
                  ),
                  // Aquí puedes agregar más familiares
                ],
              ),
            ),
            PrimaryButton(
              width: double.infinity,
              onPressed: () {
                // Navegar a pantalla de conectar familiar (QR)
              },
              text: 'Conectar',
              marginY: 12.h,
            ),
          ],
        ),
      ),
    );
  }
}
