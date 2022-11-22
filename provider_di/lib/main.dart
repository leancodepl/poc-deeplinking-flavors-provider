import 'package:flutter/material.dart';
import 'package:provider_di/features/home/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        useMaterial3: true,
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
      ),
      home: const HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
