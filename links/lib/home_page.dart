import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static final Uri _sharingLink = Uri(
    scheme: 'https',
    host: 'links.example.com',
    path: '/path/to/a/shared/resource',
  );

  @override
  Widget build(BuildContext context) {
    Future<void> share() async {
      final result = await Share.shareWithResult(
        _sharingLink.toString(),
        subject: 'Check out this link!',
      );

      ScaffoldMessenger.of(context)
        ..clearSnackBars()
        ..showSnackBar(
          SnackBar(
            content: Text(result.status.toString()),
          ),
        );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Links Demo'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Links schemas that can be opened in this app:',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 16),
            Text(
              'https://links.example.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 8),
            Text(
              'links://example.com',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Text(
              'Available routes:',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 16),
            Text(
              'links://example.com/query?...',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Shows the query parameters of the link',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 16),
            Text(
              'links://example.com/path/...',
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Text(
              'Shows the path segments of the link',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Text(
              'All links can be blocked by setting the query parameter "blocked" to "true".',
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            const SizedBox(height: 32),
            Text(
              'Share a deeplink to this app:',
              style: Theme.of(context).textTheme.headline4,
            ),
            const SizedBox(height: 4),
            ElevatedButton(
              onPressed: share,
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: const [
                  Icon(Icons.share),
                  SizedBox(width: 8),
                  Text('Share'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
