import 'package:flutter/material.dart';

class ScreenSplash extends StatelessWidget {
  const ScreenSplash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 0.1, bottom: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Center(
                child: Padding(
                  padding: EdgeInsets.all(8.0),
                  child: SizedBox(height: 700.0),
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Color.fromARGB(233, 4, 109, 188),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
