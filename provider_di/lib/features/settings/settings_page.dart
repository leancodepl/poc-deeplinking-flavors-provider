import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_di/features/settings/app_settings.dart';

class SettingsPage extends MaterialPageRoute<void> {
  SettingsPage() : super(builder: (context) => const SettingsScreen());
}

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final appSettings = context.watch<AppSettings>();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: appSettings.darkMode,
            activeColor: Theme.of(context).colorScheme.secondary,
            onChanged: (value) {
              appSettings.darkMode = value;
            },
          ),
        ],
      ),
    );
  }
}
