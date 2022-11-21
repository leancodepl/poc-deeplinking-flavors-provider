import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:links/home_page.dart';
import 'package:links/links/handlers/logging_handler.dart';
import 'package:links/links/link_listener.dart';
import 'package:logging/logging.dart';

void main() async {
  await _setupLogger();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Links Demo',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
      ),
      home: LinkListener(
        handlers: [
          LoggingHandler(),
        ],
        child: const MyHomePage(),
      ),
    );
  }
}

Future<void> _setupLogger() async {
  if (kDebugMode) {
    Logger.root.level = Level.ALL;
    // ignore: avoid_print
    Logger.root.onRecord.listen(print);
  } else {
    // Add custom logging in release mode
  }

  final flutterErrorLogger = Logger('FlutterError');

  FlutterError.onError = (details) {
    if (kDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {
      flutterErrorLogger.warning(
        details.summary.name,
        details.exception,
        details.stack,
      );
    }
  };
}
