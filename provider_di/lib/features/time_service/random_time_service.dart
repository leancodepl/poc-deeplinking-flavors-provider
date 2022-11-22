import 'dart:math';

import 'package:provider_di/features/time_service/time_service.dart';

class RandomTimeService implements TimeService {
  final _random = Random();

  @override
  DateTime get now => DateTime.fromMillisecondsSinceEpoch(
        1000 * _random.nextInt(pow(2, 32).toInt()),
      );
}
