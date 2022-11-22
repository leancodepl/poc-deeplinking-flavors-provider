import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_di/features/home/home_page.dart';
import 'package:provider_di/features/settings/app_settings.dart';
import 'package:provider_di/features/time_service/basic_time_service.dart';
import 'package:provider_di/features/time_service/random_time_service.dart';
import 'package:provider_di/features/time_service/time_service.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AppSettings()),
        Provider<TimeService>(create: (context) => BasicTimeService()),
        Provider<RandomTimeService>(create: (context) => RandomTimeService()),
      ],
      child: Builder(
        builder: (context) {
          final appSettings = context.read<AppSettings>();

          return AnimatedBuilder(
            animation: appSettings,
            builder: (context, child) => MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData.from(
                useMaterial3: true,
                colorScheme: ColorScheme.fromSeed(
                  seedColor: Colors.red,
                  brightness:
                      appSettings.darkMode ? Brightness.dark : Brightness.light,
                ),
              ),
              home: const HomePage(),
            ),
          );
        },
      ),
    );
  }
}
