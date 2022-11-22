import 'package:flutter/material.dart';
import 'package:provider_di/features/bloc_demo/current_time_page.dart';
import 'package:provider_di/features/settings/settings_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Provider DI Demo'),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.of(context).push<void>(SettingsPage());
            },
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push<void>(CurrentTimePage.basic());
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Time service 1 (basic)'),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push<void>(CurrentTimePage.random());
              },
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Text('Time service 2 (random)'),
                  SizedBox(width: 8),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
