import 'package:flutter/material.dart';

class DateValidators {
  //returns null when the value is valid (the validator was successful)

  static String? required(DateTime? value) {
    if (value == null) return 'Este campo es requerido';
    return null;
  }

  static bool isTheSameDate(DateTime x, DateTime y) {
    return x.year == y.year && x.month == y.month && x.day == y.day;
  }

  static String? notPast(DateTime? value) {
    if (value == null) return null;

    final now = DateTime.now();

    if (!isTheSameDate(value, now) && value.isBefore(now))
      // ignore: curly_braces_in_flow_control_structures
      return 'No puedes seleccionar una fecha pasada';

    return null;
  }

  static FormFieldValidator<DateTime> combine(
    List<FormFieldValidator<DateTime>> validators,
  ) {
    return (DateTime? value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
