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
        primaryColor: Colors.blue,
      ),
      home: const ScreenSplash(),
      routes: {
        '/home':(context) => ScreenHome(),
        '/signin':(context) => ScreenSignIn(),
        '/signupdata':(context) => ScreenSignUpData(),
        '/signupid':(context) => ScreenSignUpId(),
        '/workcategory':(context) => ScreenWorkCategory(),
        '/workerslist':(context) => ScreenWorkersList(),
        '/workerprofile':(context) => ScreenWorkerProfile(),      },
    );
  }
}
