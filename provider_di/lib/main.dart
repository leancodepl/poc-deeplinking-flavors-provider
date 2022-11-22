import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_di/features/home/home_page.dart';
import 'package:provider_di/features/settings/app_settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppSettings(),
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
              home: const HomePage(title: 'Flutter Demo Home Page'),
            ),
          );
        },
      ),
    );
  }
}
