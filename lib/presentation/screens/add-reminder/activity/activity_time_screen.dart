import 'package:flutter/material.dart';

class ActivityTimeScreen extends StatelessWidget {
  const ActivityTimeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('¿A qué hora realizas esta actividad?')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
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