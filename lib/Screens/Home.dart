import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Koolie',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 80), 
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const SizedBox(height: 400), 
              SizedBox(
                height: 50,
                width: 320,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/workcategory');
                  }, 
                  color: Color.fromARGB(233, 4, 109, 188),
                  child: const Text(
                    'Find a Worker',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 320,
                child: MaterialButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  color: Color.fromARGB(233, 4, 109, 188),
                  child: const Text(
                    'Login as Worker',
                    style: TextStyle(
                      fontSize: 24,
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
