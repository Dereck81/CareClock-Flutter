import 'package:flutter/foundation.dart';

class NumberValidators {

	/*
 if (value == null) return false;

    if (minValue != null && value < minValue!) return false;

    if (maxValue != null && value > maxValue!) return false;

    return true;
	*/

	static String? required(String? value) {
		if(value == null || value.trim().isEmpty) return 'Este campo es requerido';
		return null;
	}

	static String? range(String? value, {double? min, double? max}) {
    String? required = NumberValidators.required(value);
		if(required != null) return required;

		final dynamic newValue; 

		// ignore: curly_braces_in_flow_control_structures
		if(value!.contains('.')) newValue = double.tryParse(value);
		// ignore: curly_braces_in_flow_control_structures
		else newValue = int.tryParse(value);

    if (newValue == null) return 'Debe ingresar un número válido';

    if (min != null && newValue < min) return 'El número no puede ser menor que $min';
    if (max != null && newValue > max) return 'El número no puede ser mayor que $max';

    return null;
  }

}