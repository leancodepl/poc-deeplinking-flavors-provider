import 'package:config_flavors/app_config.dart' as AppConfig;
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
              subtitle: Text(AppConfig.flavorName),
            ),
            const ListTile(
              title: Text('App name'),
              subtitle: Text(AppConfig.appName),
            ),
            const ListTile(
              title: Text('API key'),
              subtitle: Text(AppConfig.apiKey),
            ),
            if (AppConfig.feature1Enabled)
              ElevatedButton(
                onPressed: () {},
                child: const Text('Go to feature 1'),
              ),
          ],
        ),
      ),
    );
  }
}
