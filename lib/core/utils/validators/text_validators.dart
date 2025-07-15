import 'dart:core';
import 'package:careclock/core/utils/regex/regex_patterns.dart';
import 'package:flutter/material.dart';

class TextValidators {
  //returns null when the value is valid (the validator was successful)

  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) return 'Este campo es requerido';
    return null;
  }

  static String? email(String? value) {
    if (!RegexPatterns.email.hasMatch(value ?? '')) return 'Correo invalido';
    return null;
  }

  static FormFieldValidator<String> combine(
    List<FormFieldValidator<String>> validators,
  ) {
    return (String? value) {
      for (final validator in validators) {
        final result = validator(value);
        if (result != null) return result;
      }
      return null;
    };
  }
}
