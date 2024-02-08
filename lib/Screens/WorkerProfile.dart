import 'package:flutter/material.dart';
import 'package:sidsproject/Screens/SignUpData.dart';

class ScreenWorkerProfile extends StatelessWidget {
  const ScreenWorkerProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(233, 4, 109, 188),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 60,
                width: 350,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Text(
                  'Name: John Doe',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 60,
                width: 350,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Text(
                  'Phone Number: +1234567890',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 60,
                width: 350,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Text(
                  'Location: New York',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 60,
                width: 350,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Text(
                  'Wage: 100/day',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 200,
                width: 350,
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: const Text(
                  'Description: Experienced web developer with 5+ years of experience in building dynamic and responsive websites.',
                  style: TextStyle(fontSize: 18),
                ),
              ),
              const SizedBox(height: 20),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ScreenSignUpData(),
                        ));
                      },
                      child: const Text("Edit")),
                  const SizedBox(
                    height: 35,
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamedAndRemoveUntil(
                          context, '/home', (route) => false);
                    },
                    child: const Text(
                      'LOGOUT',
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.red),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
