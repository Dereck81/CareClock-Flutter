import 'package:careclock/config/app_colors.dart';
import 'package:careclock/config/font_scaler.dart';
import 'package:careclock/presentation/widgets/Cards/medication/time_medication_card.dart';
import 'package:careclock/providers/medication_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CalendarScreen extends ConsumerStatefulWidget {
  const CalendarScreen({super.key});

  @override
  ConsumerState<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends ConsumerState<CalendarScreen> {
  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      ref.read(medicationListProvider.notifier).loadMedications();
    });
  }

  @override
  Widget build(BuildContext context) {
    final medications = ref.watch(medicationListProvider);

    if (medications.isEmpty) {
      return Center(
        child: Text(
          'No tienes medicamentos registrados',
          style: TextStyle(
            color: AppColors.textColor.value,
            fontSize: FontScaler.fromSize(FontSize.lg),
          ),
          softWrap: true,
        ),
      );
    }

    return ListView.builder(
      itemCount: medications.length,
      itemBuilder: (context, index) {
        final medication = medications[index];
        return TimeMedicationCard(
          medicationEntity: medication,
        ); // 👈 le pasas la entidad
      },
    );
  }
}
