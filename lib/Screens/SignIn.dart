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
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Center(
            child: Text(
              'sign in',
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: Color.fromARGB(233, 4, 109, 188),
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
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 148, 148, 148),
                      width: 2.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: 'E-mail',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 148, 148, 148),
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.email,
                    color: Color.fromARGB(233, 4, 109, 188),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              TextField(
                controller: _passwordController,
                obscureText: true,
                obscuringCharacter: "*",
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15),
                    borderSide: BorderSide(
                      color: Color.fromARGB(255, 148, 148, 148),
                      width: 2.0,
                    ),
                  ),
                  filled: true,
                  fillColor: Colors.grey[200],
                  labelText: 'Password',
                  labelStyle: TextStyle(
                    color: Color.fromARGB(255, 148, 148, 148),
                    fontSize: 16,
                    // fontWeight: FontWeight.bold,
                  ),
                  prefixIcon: Icon(
                    Icons.key,
                    color: Color.fromARGB(233, 4, 109, 188),
                  ),
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
                color: Color.fromARGB(233, 4, 109, 188),
                minWidth: 150,
                height: 50,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
                child: const Text(
                  'sign in',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 5),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, '/signupid');
                },
                child: const Text(
                  'New to Worker Finder? Sign up',
                  style: TextStyle(
                    color: Color.fromARGB(233, 4, 109, 188),
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
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
