import 'package:flutter/material.dart';

class ScreenSignUpId extends StatelessWidget {
  const ScreenSignUpId({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SignUp',
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(233, 4, 109, 188),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 200, left: 20, right: 20),
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            // crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    //  borderSide: const BorderSide(color: Colors.blue),
                  ),
                  labelText: 'Password',
                ),
                obscureText: true,
              ),
              const SizedBox(height: 25),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signupdata');
                },
                child: const Text(
                  'Sign Up',
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text('Already have an Account? Sign In'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
