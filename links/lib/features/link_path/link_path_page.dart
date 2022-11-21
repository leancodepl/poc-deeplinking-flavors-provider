import 'package:flutter/material.dart';

class LinkPathPage extends MaterialPageRoute<void> {
  LinkPathPage({
    required List<String> pathSegments,
  }) : super(
          builder: (context) => LinkPathScreen(
            pathSegments: pathSegments,
          ),
        );
}

class LinkPathScreen extends StatelessWidget {
  const LinkPathScreen({
    super.key,
    required this.pathSegments,
  });

  final List<String> pathSegments;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Link Path'),
      ),
      body: Center(
        child: _LinkSegments(
          pathSegments: pathSegments,
        ),
      ),
    );
  }
}

class _LinkSegments extends StatelessWidget {
  const _LinkSegments({
    required this.pathSegments,
  });

  final List<String> pathSegments;

  @override
  Widget build(BuildContext context) {
    return pathSegments.isEmpty
        ? const SizedBox()
        : Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: Theme.of(context)
                  .colorScheme
                  .primaryContainer
                  .withOpacity(0.1),
            ),
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pathSegments.first,
                  style: Theme.of(context).textTheme.headline6,
                ),
                if (pathSegments.length > 1) ...[
                  const SizedBox(
                    height: 16,
                    width: 100,
                  ),
                  _LinkSegments(
                    pathSegments: pathSegments.sublist(1),
                  ),
                ],
              ],
            ),
          );
  }
}
