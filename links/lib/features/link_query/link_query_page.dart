import 'package:flutter/material.dart';

class LinkQueryPage extends MaterialPageRoute<void> {
  LinkQueryPage({
    required Map<String, String> queryParameters,
  }) : super(
          builder: (context) => LinkQueryScreen(
            queryParameters: queryParameters,
          ),
        );
}

class LinkQueryScreen extends StatelessWidget {
  const LinkQueryScreen({
    super.key,
    required this.queryParameters,
  });

  final Map<String, String> queryParameters;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Link Query'),
      ),
      body: Center(
        child: ListView(
          children: [
            for (final entry in queryParameters.entries)
              ListTile(
                title: Text(entry.key),
                subtitle: Text(entry.value.isEmpty ? '<empty>' : entry.value),
              ),
          ],
        ),
      ),
    );
  }
}
