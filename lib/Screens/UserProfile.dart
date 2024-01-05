import 'package:flutter/material.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Center(
            child: Text(
              'USER Profile',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 209, 27, 14),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Assuming you have the user data available
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
              const SizedBox(height: 16),
              TextButton(
                onPressed: () {
                  // Implement edit functionality here (e.g., navigate to edit screen, open a dialog)
                  print('Editing profile...');
                },
                child: const Text(
                  'Edit',
                  style: TextStyle(fontSize: 18, color: Colors.blue),
                ),
              ),
              const SizedBox(height: 70),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {
                      // Implement functionality for the first button
                      print('Button 1 pressed!');
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
