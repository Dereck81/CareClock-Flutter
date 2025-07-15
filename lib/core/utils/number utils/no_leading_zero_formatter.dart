import 'package:flutter/services.dart';

class NoLeadingZeroFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
    TextEditingValue oldValue,
    TextEditingValue newValue,
  ) {
    String text = newValue.text;

    if (text.isEmpty) return newValue;

    String sanitized = text.replaceFirst(RegExp(r'^0+(?!$)'), '');

    if (sanitized != text) {
      final newOffset = sanitized.length;
      return TextEditingValue(
        text: sanitized,
        selection: TextSelection.collapsed(offset: newOffset),
      );
    }

    return newValue;
  }
}
