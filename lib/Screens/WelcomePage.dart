import 'package:flutter/material.dart';
import 'package:sidsproject/Screens/Loginpage.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shadowColor: Colors.green,
        title: const Text(
          'WorkFinder',
          style: TextStyle(
              fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white),
        ),
        backgroundColor: Colors.red,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.1, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                  child: Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(height: 600.0),
              )),
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pushReplacement(MaterialPageRoute(
                      builder: (context) => const SignInPage()));
                },
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(200, 60),
                  backgroundColor: Colors.red,
                ),
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w900,
                      color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
