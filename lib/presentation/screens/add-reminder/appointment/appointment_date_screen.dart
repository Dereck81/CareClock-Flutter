import 'package:flutter/material.dart';

class AppointmentDateScreen extends StatelessWidget {
  const AppointmentDateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Selecciona la fecha y hora')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(title: Text('Selecciona la fecha'), onTap: () {}),
          ListTile(title: Text('Selecciona la hora'), onTap: () {}),
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