import 'package:flutter/material.dart';

class AppointmentConfirmScreen extends StatelessWidget {
  const AppointmentConfirmScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('¡Casi listo!')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Confirma estos datos para guardar tu recordatorio'),
          // Aquí irían los datos a confirmar
          SizedBox(height: 24),
          ElevatedButton(
            onPressed: () {},
            child: const Text('Continuar'),
          ),
        ],
      ),
    );
  }
} 