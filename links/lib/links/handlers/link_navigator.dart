import 'package:flutter/material.dart';
import 'package:links/features/link_path/link_path_page.dart';
import 'package:links/features/link_query/link_query_page.dart';
import 'package:links/home_page.dart';
import 'package:links/links/link_handler.dart';

class LinkNavigator extends LinkHandler {
  const LinkNavigator({
    required this.context,
  });

  final BuildContext context;

  @override
  bool handle(Uri link) {
    final route = _routeForLink(link);
    Navigator.of(context).push<dynamic>(route);
    return true;
  }

  Route<dynamic> _routeForLink(Uri link) {
    switch (link.path) {
      case '/':
        return MaterialPageRoute<void>(
          builder: (context) => const HomePage(),
        );
      case '/query':
        return LinkQueryPage(queryParameters: link.queryParameters);
      default:
        return LinkPathPage(pathSegments: link.pathSegments);
    }
  }
}
