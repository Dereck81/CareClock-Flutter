import 'package:flutter/material.dart';
import 'medication/medication_search_screen.dart';
import 'activity/activity_type_screen.dart';
import 'appointment/appointment_type_screen.dart';

class AddReminderTypeScreen extends StatelessWidget {
  const AddReminderTypeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Agregar recordatorio')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const MedicationSearchScreen()),
            ),
            child: const Text('Medicación'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const ActivityTypeScreen()),
            ),
            child: const Text('Actividad Física'),
          ),
          ElevatedButton(
            onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(builder: (_) => const AppointmentTypeScreen()),
            ),
            child: const Text('Cita Médica'),
          ),
        ],
      ),
    );
  }
} 