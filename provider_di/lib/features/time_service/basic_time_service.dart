import 'package:provider_di/features/time_service/time_service.dart';

class BasicTimeService implements TimeService {
  @override
  DateTime get now => DateTime.now();
}
