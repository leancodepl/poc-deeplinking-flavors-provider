import 'package:config_flavors/app_config.dart' as app_config;
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flavor test'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const ListTile(
              title: Text('Flavor'),
              subtitle: Text(app_config.flavorName),
            ),
            const ListTile(
              title: Text('App name'),
              subtitle: Text(app_config.appName),
            ),
            const ListTile(
              title: Text('API key'),
              subtitle: Text(app_config.apiKey),
            ),
            if (app_config.feature1Enabled)
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context)
                    ..clearSnackBars()
                    ..showSnackBar(
                      const SnackBar(
                        behavior: SnackBarBehavior.floating,
                        content: Text('Feature 1 is enabled'),
                      ),
                    );
                },
                child: const Text('Go to feature 1'),
              ),
          ],
        ),
      ),
    );
  }
}
