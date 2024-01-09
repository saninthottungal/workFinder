import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          title: const Text(
            'WorkerFinder',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: Colors.red,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80), // Increased top padding
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 400), // Adjusted spacing for the buttons
              SizedBox(
                height: 50,
                width: 330,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/workcategory');
                  }, // Handle button functionality here
                  color: Colors.red,
                  child: const Text(
                    'Find a Worker',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20), // Spacing between buttons
              SizedBox(
                height: 50,
                width: 330,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  color: Colors.red,
                  child: const Text(
                    'Login as Worker',
                    style: TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
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
