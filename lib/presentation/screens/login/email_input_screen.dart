import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/app_go_router.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/core/utils/regex_patterns.dart';
import 'package:careclock/presentation/widgets/Bars/progress_bar.dart';
import 'package:careclock/presentation/widgets/Buttons/primary_button.dart';
import 'package:careclock/presentation/widgets/Buttons/secondary_button.dart';
import 'package:careclock/presentation/widgets/Inputs/custom_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:phosphor_flutter/phosphor_flutter.dart';

class EmailInputScreen extends StatefulWidget {
  const EmailInputScreen({super.key});

  @override
  State<EmailInputScreen> createState() => _EmailInputScreenState();
}

class _EmailInputScreenState extends State<EmailInputScreen> {
  final GlobalKey<FormState> _globalKey = GlobalKey();

  String? email;
  bool acceptTerms = false;

  Color terms = Colors.black;

  String? emailValidator(String? value) =>
      !RegexPatterns.email.hasMatch(value ?? '') ? 'Correo invalido' : null;

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.fromLTRB(20.w, 30.h, 20.w, 0),
          child: Form(
            autovalidateMode: AutovalidateMode.onUnfocus,
            key: _globalKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  'Ingresa tu correo',
                  style: TextStyle(
                    fontSize: FontScaler.fromSize(FontSize.xl4),
                    fontWeight: FontWeight.bold,
                  ),
                ),
                CustomInput(
                  width: double.infinity.w,
                  icon: PhosphorIcons.envelopeSimple(),
                  iconSize: 50.w,
                  labelText: 'Correo electrónico',
                  hintText: 'ejemplo@correo.com',
                  marginY: 10.h,
                  validator: emailValidator,
                  onSaved: (value) => setState(() => email = value ?? ''),
                ),
                Expanded(child: SizedBox()),
                FormField<bool>(
                  initialValue: acceptTerms,
                  onSaved: (value) =>
                    setState(() => acceptTerms = value ?? false),
                  validator: (value) {
                    if (!(value ?? false)) {
                      terms = AppColors.dangerBorder.value;
                    } else {
                      terms = Colors.black;
                    }
                    return null;
                  },
                  builder: (field) {
                    return Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            'Para continuar debes aceptar los términos y condiciones de CareClock.',
                            softWrap: true,
                            style: TextStyle(
                              color: terms,
                              fontSize: FontScaler.fromSize(FontSize.bs),
                            ),
                          ),
                        ),
                        Checkbox(
                          value: field.value ?? false,
                          activeColor: AppColors.primary.value,
                          onChanged: (value) {
                            if ((value ?? false)) terms = Colors.black;
                            field.didChange(value);
                          },
                        ),
                      ],
                    );
                  },
                ),
                SecondaryButton(
                  marginY: 15.h,
                  width: double.infinity,
                  onPressed: () {},
                  text: 'Leer términos y condiciones',
                ),
                PrimaryButton(
                  width: double.infinity,
                  text: 'Continuar',
                  onPressed: () {
                    if (_globalKey.currentState!.validate()) {
                      _globalKey.currentState!.save();
                      context.go(AppGoRouter.home);
                    }
                  },
                ),
                ProgressBar(
                  progress: 50,
                  width: double.infinity,
                  color: Colors.purple,
                  height: 10.h,
                  marginY: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
