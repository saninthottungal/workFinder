import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sidsproject/Screens/WorkerProfile.dart';

class ScreenSignIn extends StatelessWidget {
  Map<String, dynamic>? thisWorker;
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  ScreenSignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: const Center(
            child: Text(
              'SignIn',
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
                controller: _passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: 'Password',
                ),
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
                    await FirebaseAuth.instance.signInWithEmailAndPassword(
                        email: email, password: password);
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'invalid-email') {
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text("Invalid E mail")));
                      return;
                    } else if (e.code == 'invalid-credential') {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("Invalid User Credentials")));
                      return;
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                          content: Text("An Unknown Error Occured")));
                      return;
                    }
                  } catch (_) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("An Unknown Error Occured")));
                    return;
                  }

                  // final sharedPref = await SharedPreferences.getInstance();
                  // sharedPref.setBool("key", true);

                  //need to check if the form is filled or not???
                  //then only redirect to Worker Profile
                  final workersQuery = await FirebaseFirestore.instance
                      .collection('Worker')
                      .get()
                      .then((value) => value);
                  final workers = workersQuery.docs.map((doc) => doc.data());
                  final userId = FirebaseAuth.instance.currentUser!.uid;

                  Future.forEach(workers, (worker) {
                    if (worker['id'] == userId) {
                      thisWorker = worker;
                    }
                  });
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) =>
                          ScreenWorkerProfile(worker: thisWorker)));
                },
                color: Colors.red,
                minWidth: 220,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
                child: const Text(
                  'Sign in',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signupid');
                },
                child: const Text('Don\'t have an Account? Sign up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
