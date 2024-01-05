import 'package:flutter/material.dart';
import 'package:sidsproject/Screens/WelcomePage.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Colors.blue),
      home: const WelcomePage(),
    );
  }
}
