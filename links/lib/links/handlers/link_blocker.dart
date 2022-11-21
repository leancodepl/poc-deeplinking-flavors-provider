import 'package:links/links/link_handler.dart';
import 'package:logging/logging.dart';

class LinkBlocker extends LinkHandler {
  final logger = Logger('LinkBlocker');

  @override
  bool handle(Uri link) {
    final blocked = link.queryParameters['blocked'] == 'true';
    if (blocked) {
      logger.warning('Link blocked: $link');
    }
    return blocked;
  }
}
