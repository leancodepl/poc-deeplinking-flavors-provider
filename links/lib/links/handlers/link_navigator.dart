import 'package:flutter/material.dart';
import 'package:links/features/link_path/link_path_page.dart';
import 'package:links/features/link_query/link_query_page.dart';
import 'package:links/home_page.dart';
import 'package:links/links/link_handler.dart';
import 'package:logging/logging.dart';

class LinkNavigator extends LinkHandler {
  LinkNavigator({
    required this.context,
  });

  final BuildContext context;

  final logger = Logger('LinkNavigator');

  @override
  bool handle(Uri link) {
    final route = _routeForLink(link);
    if (route != null) {
      Navigator.of(context).push<dynamic>(route);
    } else {
      logger.warning('No route found for link: $link');
    }

    return true;
  }

  Route<dynamic>? _routeForLink(Uri link) {
    if (link.pathSegments.isEmpty) {
      return MaterialPageRoute<void>(
        builder: (context) => const HomePage(),
      );
    }

    switch (link.pathSegments.first) {
      case 'query':
        return LinkQueryPage(queryParameters: link.queryParameters);
      case 'path':
        return LinkPathPage(pathSegments: link.pathSegments);
      default:
        return null;
    }
  }
}
