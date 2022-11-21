import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:links/links/link_handler.dart';
import 'package:uni_links/uni_links.dart';

class LinkListener extends HookWidget {
  const LinkListener({
    super.key,
    required this.handlers,
    required this.child,
  });

  final List<LinkHandler> handlers;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    useEffect(() {
      final sub = uriLinkStream.listen((link) {
        if (link == null) {
          return;
        }

        for (final handler in handlers) {
          if (handler.handle(link)) {
            break;
          }
        }
      });
      return sub.cancel;
    });

    return child;
  }
}
