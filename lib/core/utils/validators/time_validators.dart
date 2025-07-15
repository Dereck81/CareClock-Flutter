import 'package:flutter/material.dart';

class TimeValidators {
  //returns null when the value is valid (the validator was successful)

  static String? required(TimeOfDay? value) {
    if (value == null) return 'Este campo es requerido';
    return null;
  }

  static String? notPast(TimeOfDay? value) {
    if (value == null) return null;

    final now = TimeOfDay.now();
    final selectedMinutes = value.hour * 60 + value.minute;
    final currentMinutes = now.hour * 60 + now.minute;

    if (selectedMinutes < currentMinutes)
      // ignore: curly_braces_in_flow_control_structures
      return 'No puedes seleccionar una hora pasada';

    return null;
  }

  static FormFieldValidator<TimeOfDay> combine(
    List<FormFieldValidator<TimeOfDay>> validators,
  ) {
    return (TimeOfDay? value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
