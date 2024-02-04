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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: const Center(
            child: Text(
              'Sign Up',
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
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 30),
              TextField(
                obscuringCharacter: '*',
                controller: _passwordController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: 'Password',
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
                color: Colors.red,
                minWidth: 220,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  'NEXT',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signin');
                },
                child: const Text('Already have an Account? Sign in'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
