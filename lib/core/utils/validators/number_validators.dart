class NumberValidators {
  static String? required(String? value) {
    if (value == null || value.trim().isEmpty) return 'Este campo es requerido';
    return null;
  }

  static String? range(String? value, {double? min, double? max}) {
    String? required = NumberValidators.required(value);
    if (required != null) return required;

    final dynamic newValue;

    if (value!.contains('.'))
      // ignore: curly_braces_in_flow_control_structures
      newValue = double.tryParse(value);
    else
      // ignore: curly_braces_in_flow_control_structures
      newValue = int.tryParse(value);

    if (newValue == null) return 'Debe ingresar un número válido';

    if (min != null && newValue < min)
      // ignore: curly_braces_in_flow_control_structures
      return 'El número no puede ser menor que $min';
    if (max != null && newValue > max)
      // ignore: curly_braces_in_flow_control_structures
      return 'El número no puede ser mayor que $max';

    return null;
  }
}
