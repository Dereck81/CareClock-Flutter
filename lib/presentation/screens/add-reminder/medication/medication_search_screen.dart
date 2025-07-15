import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Buttons/custom_button.dart';
import 'package:careclock/presentation/widgets/Containers/custom_container.dart';
import 'package:careclock/presentation/widgets/Inputs/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class MedicationSearchScreen extends StatefulWidget {
  const MedicationSearchScreen({super.key});

  @override
  State<MedicationSearchScreen> createState() => _MedicationSearchScreenState();
}

class _MedicationSearchScreenState extends State<MedicationSearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Agregar',
          style: TextStyle(
            color: AppColors.primary.value,
            fontSize: FontScaler.fromSize(FontSize.xl3),
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          CustomInput(
            labelText: 'Buscar',
            marginX: 15.w,
            marginY: 10.h,
            width: double.infinity,
          ),
          Expanded(
            child: CustomScrollView(
              slivers: <Widget>[
                SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    return CustomButton(
                      borderColor: AppColors.stroke.value,
                      borderWidth: 2.w,
                      onPressed: () {
                        context.push(AppGoRouter.medicationFrequency);
                      },
                      marginX: 15.w,
                      paddingX: 10.w,
                      paddingY: 10.h,
                      child: Text(
                        'Paracetamol',
                        style: TextStyle(
                          color: AppColors.textColor.value,
                          fontSize: FontScaler.fromSize(FontSize.bs),
                        ),
                      ),
                    );
                  }, childCount: 10),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
