import 'package:careclock/data/models/medication_model.dart';
import 'package:careclock/data/repositories_impl/medication_repository_impl.dart';
import 'package:careclock/domain/repositories/medication_repository.dart';
import 'package:careclock/domain/services/notification_services.dart';
import 'package:careclock/infraestructure/services/awesome_notification_service.dart';
import 'package:hive/hive.dart';

late final MedicationRepository medicationRepository;

late final NotificationService notificationService;

Future<void> initDependencies() async {
  final medicationBox = await Hive.openBox<MedicationModel>('medications');
  medicationRepository = MedicationRepositoryImpl(medicationBox);
  notificationService = AwesomeNotificationService();
}

void initHiveAdapters() {
  Hive.registerAdapter(MedicationModelAdapter());
}
