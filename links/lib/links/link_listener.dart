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
    useEffect(
      () {
        void linkListener(Uri? link) {
          if (link == null) {
            return;
          }

          for (final handler in handlers) {
            if (handler.handle(link)) {
              break;
            }
          }
        }

        getInitialUri().then(linkListener);

        final sub = uriLinkStream.listen(linkListener);
        return sub.cancel;
      },
      [],
    );

    return child;
  }
}
