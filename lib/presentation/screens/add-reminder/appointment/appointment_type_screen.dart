import 'package:flutter/material.dart';

class AppointmentTypeScreen extends StatelessWidget {
  const AppointmentTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar Cita Médica')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(title: Text('Consulta General'), onTap: () {}),
          ListTile(title: Text('Especialista'), onTap: () {}),
          ListTile(title: Text('Examen'), onTap: () {}),
          ListTile(title: Text('Otro'), onTap: () {}),
        ],
      ),
    );
  }
} 