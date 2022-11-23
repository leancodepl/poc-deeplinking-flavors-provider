import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_di/features/settings/app_settings.dart';
import 'package:provider_di/features/time_service/basic_time_service.dart';
import 'package:provider_di/features/time_service/random_time_service.dart';
import 'package:provider_di/features/time_service/time_service.dart';

class GlobalProviders extends StatelessWidget {
  const GlobalProviders({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
        Provider<TimeService>(create: (context) => BasicTimeService()),
        Provider<RandomTimeService>(create: (context) => RandomTimeService()),
      ],
      child: child,
    );
  }
}
