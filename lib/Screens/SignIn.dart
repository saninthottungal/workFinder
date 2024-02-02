import 'package:flutter/material.dart';

class ScreenSignIn extends StatelessWidget {
  const ScreenSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'SignIn',
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
                onPressed: () {},
                child: const Text(
                  'Sign in',
                ),
              ),
              const SizedBox(height: 10),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signupid');
                },
                child: const Text('Didnt have an Account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
