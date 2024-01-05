import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: const Center(
            child: Text(
              'WorkerFinder',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Colors.red,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                labelText: 'Enter your Email',
              ),
            ),
            const SizedBox(height: 30),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15),
                  borderSide: const BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Colors.grey[200],
                labelText: 'Enter your Password',
              ),
              obscureText: true,
            ),
            const SizedBox(height: 100),
            MaterialButton(
              onPressed: () {},
              color: Colors.red,
              minWidth: 220,
              height: 50,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(18), // Adjust corner rounding
              ),
              child: const Text(
                'Sign in',
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 5),
            TextButton(
              onPressed: () {},
              child: const Text('Didnt have an Account? Sign in'),
            ),
          ],
        ),
      ),
    );
  }
}
