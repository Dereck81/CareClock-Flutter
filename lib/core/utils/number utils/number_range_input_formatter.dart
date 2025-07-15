import 'package:careclock/core/utils/validators/number_validators.dart';
import 'package:flutter/services.dart';

class NumberRangeInputFormatter extends TextInputFormatter {
  final double? min;
  final double? max;

  NumberRangeInputFormatter({this.min, this.max});

  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
		if(newValue.text.trim().isEmpty) return newValue;

    String? result = NumberValidators.range(newValue.text, min: min, max: max);

    if (result != null) return oldValue;
    return newValue;
  }
}
