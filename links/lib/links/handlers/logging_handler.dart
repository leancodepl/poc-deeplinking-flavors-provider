import 'package:links/links/link_handler.dart';
import 'package:logging/logging.dart';

class LoggingHandler extends LinkHandler {
  final logger = Logger('LoggingHandler');

  @override
  bool handle(Uri link) {
    logger.info('Link received: $link');
    return false;
  }
}
