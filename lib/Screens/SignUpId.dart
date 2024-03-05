import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ScreenSignUpId extends StatelessWidget {
  final _emailController = TextEditingController();

  final _passwordController = TextEditingController();
  ScreenSignUpId({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Center(
          child: Text(
            'sign up',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: Color.fromARGB(233, 4, 109, 188),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Add image container
              const SizedBox(height: 50.0),
              Container(
                height: 200,
                width: 200,
                child: Image.asset(
                    'C:/Users/ASUS/OneDrive/Desktop/workFinder/lib/Assets/img/logo.jpg'), // Replace with your image
              ),
              const SizedBox(height: 60.0),
              // Existing email and password fields
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 148, 148, 148),
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color.fromARGB(233, 4, 109, 188),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                obscuringCharacter: '*',
                controller: _passwordController,
                decoration: const InputDecoration(
                  filled: true,
                  fillColor: Colors.white,
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 148, 148, 148),
                    fontSize: 16,
                  ),
                  prefixIcon: Icon(
                    Icons.key,
                    color: Color.fromARGB(233, 4, 109, 188),
                  ),
                ),
                obscureText: true,
              ),
              const SizedBox(height: 100),
              MaterialButton(
                onPressed: () async {
                  final email = _emailController.text;
                  final password = _passwordController.text;
                  if (email.trim().isEmpty || password.trim().isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("E-mail or Password Cannot be Empty")));
                    return;
                  }
                  try {
                    await FirebaseAuth.instance.createUserWithEmailAndPassword(
                        email: email, password: password);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content:
                              Text("Password Must be atleast 6 Characters")));

                      return;
                    } else if (e.code == 'invalid-email') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid E mail")));

                      return;
                    } else if (e.code == 'email-already-in-use') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("E mail already in use")));
                      return;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("An unknown Error Occured")));
                      return;
                    }
                  } catch (_) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("An unknown Error Occured")));
                    return;
                  }

                  final sharedPref = await SharedPreferences.getInstance();
                  sharedPref.setBool("key", true);
                  Navigator.pushNamed(context, '/signupdata');
                },
                color: const Color.fromARGB(233, 4, 109, 188),
                minWidth: 150,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'sign up',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text(
                  'Already have an Account? sign in',
                  style: TextStyle(
                      color: Color.fromARGB(233, 4, 109, 188),
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
