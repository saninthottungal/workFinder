import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sidsproject/Providers/WorkerProvider.dart';

class ScreenSignUpData extends StatefulWidget {
  const ScreenSignUpData({super.key, this.worker});
  final Map<String, dynamic>? worker;

  @override
  State<ScreenSignUpData> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUpData> {
  final String? workerId = FirebaseAuth.instance.currentUser?.uid;
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  // final _workDescriptionController = TextEditingController();
  // final _wageController = TextEditingController();
  final _placeController = TextEditingController();
  String? _selectedWork;

  final _workOptions = [
    'Carpenter',
    'Driver',
    'House keeper',
    'Chef',
    'Personal Trainer',
    'Gardener',
    'Mechanic',
    'Pet Grooming',
    'MakeUp Artist',
    'Grocery Delivery',
    'PC Technician',
    'AC Technician',
    'Photographer',
    'Lights & Sounds',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Profile Setup',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(233, 4, 109, 188),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 16, left: 16, right: 16),
        child: SingleChildScrollView(
          child: Column(
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(
                  labelText: 'name',
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 148, 148, 148),
                    // fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _placeController,
                decoration: InputDecoration(
                  labelText: 'location',
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 148, 148, 148),
                    // fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  prefixText: "+91 ",
                  labelText: 'phone number',
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 148, 148, 148),
                    // fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                keyboardType: TextInputType.phone,
              ),
              const SizedBox(height: 16),
              DropdownButtonFormField<String>(
                value: _selectedWork,
                items: _workOptions.map((work) {
                  return DropdownMenuItem(
                    value: work,
                    child: Text(work),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _selectedWork = value;
                  });
                },
                decoration: InputDecoration(
                  labelText: 'work name',
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 148, 148, 148),
                    // fontWeight: FontWeight.bold,
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                onPressed: () async {
                  final name = _nameController.text.trim();
                  final place = _placeController.text.trim();
                  final phone = _phoneNumberController.text.trim();
                  final id = workerId;
                  if (name.isEmpty ||
                      phone.isEmpty ||
                      _selectedWork == null ||
                      // wage.isEmpty ||
                      // description.isEmpty ||
                      place.isEmpty ||
                      id == null) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Fields cannot be empty")));
                    return;
                  } else if (phone.length != 10) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Phone Number is not valid")));
                    return;
                  }
                  try {
                    if (widget.worker != null) {
                      CollectionReference collectionRef =
                          FirebaseFirestore.instance.collection('Worker');
                      final id = widget.worker?['id'];
                      final resultReference =
                          await collectionRef.where('id', isEqualTo: id).get();
                      final results = resultReference.docs;
                      Future.forEach(results, (result) {
                        result.reference.delete();
                      });
                    }
                    CollectionReference workers =
                        FirebaseFirestore.instance.collection('Worker');
                    await workers.add({
                      "id": id,
                      "name": name,
                      "phone": phone,
                      // "wage": wage,
                      "place": place,
                      // "description": description,
                      "work": _selectedWork,
                    });
                    await Provider.of<WorkerProvider>(context, listen: false)
                        .getWorkers();
                  } on FirebaseException catch (_) {
                    //  print(e.message);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Couldn't add data, please try again later. ")));
                  } on PlatformException catch (_) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Network error, try again later.")));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Couldn't add data, please try again later. ")));
                  }
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/home', (route) => false);
                },
                child: const Text('Create Profile'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
