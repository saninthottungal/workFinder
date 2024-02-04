import 'package:flutter/material.dart';

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Coolie',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(233, 4, 109, 188),
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
                width: 330,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/workcategory');
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(233, 4, 109, 188),
                  )),
                  child: const Text(
                    'Find a Worker',
                    style: TextStyle(
                      fontSize: 26,
                      color: Color.fromARGB(255, 255, 255, 255),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 50,
                width: 330,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/signin');
                  },
                  style: const ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                    Color.fromARGB(233, 4, 109, 188),
                  )),
                  child: const Text(
                    'Login as Worker',
                    style: TextStyle(
                      fontSize: 26,
                      color: Color.fromARGB(255, 255, 255, 255),
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
