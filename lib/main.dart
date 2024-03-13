import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sidsproject/Providers/WorkerProvider.dart';
import 'package:sidsproject/Screens/Home.dart';
import 'package:sidsproject/Screens/SignIn.dart';

import 'package:sidsproject/Screens/SignUpId.dart';
import 'package:sidsproject/Screens/Splash.dart';
import 'package:sidsproject/Screens/WorkCategory.dart';
import 'package:sidsproject/firebase_options.dart';

void main(List<String> args) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WorkerProvider())
      ],
      child: MaterialApp(
        theme: ThemeData(primaryColor: const Color.fromARGB(233, 4, 109, 188)),
        home: const ScreenSplash(),
        routes: {
          '/home': (context) => const ScreenHome(),
          '/signin': (context) => ScreenSignIn(),
          '/signupid': (context) => ScreenSignUpId(),
          '/workcategory': (context) => const ScreenWorkCategory(),
        },
      ),
    );
  }
}
