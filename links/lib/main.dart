import 'package:flutter/material.dart';
import 'package:links/home_page.dart';
import 'package:links/links/handlers/logging_handler.dart';
import 'package:links/links/link_listener.dart';

void main() {
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
