import 'package:flutter/material.dart';
import 'package:sidsproject/Screens/Home.dart';
import 'package:sidsproject/Screens/SignIn.dart';
import 'package:sidsproject/Screens/SignUpData.dart';
import 'package:sidsproject/Screens/SignUpId.dart';
import 'package:sidsproject/Screens/Splash.dart';
import 'package:sidsproject/Screens/WorkerProfile.dart';
import 'package:sidsproject/Screens/WorkCategory.dart';
import 'package:sidsproject/Screens/WorkersList.dart';

void main(List<String> args) {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          appBarTheme:
              const AppBarTheme(color: Color.fromARGB(233, 4, 109, 188)),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue)),
      home: const ScreenSplash(),
      routes: {
        '/home': (context) => const ScreenHome(),
        '/signin': (context) => const ScreenSignIn(),
        '/signupdata': (context) => const ScreenSignUpData(),
        '/signupid': (context) => const ScreenSignUpId(),
        '/workcategory': (context) => const ScreenWorkCategory(),
        '/workerslist': (context) => const ScreenWorkersList(),
        '/workerprofile': (context) => const ScreenWorkerProfile(),
      },
    );
  }
}
