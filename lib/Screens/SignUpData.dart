import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ScreenSignUpData extends StatefulWidget {
  const ScreenSignUpData({super.key});

  @override
  State<ScreenSignUpData> createState() => _ScreenSignUpState();
}

class _ScreenSignUpState extends State<ScreenSignUpData> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _workDescriptionController = TextEditingController();
  final _wageController = TextEditingController();
  final _placeController = TextEditingController();
  String? _selectedWork;

  final _workOptions = [
    'Carpenter',
    'Driver',
    'House keeper',
    'Cook',
    'Personal Trainer',
    'Gardener',
    'Mechanic',
    'Pet Grooming',
    'MakeUp Artist',
    'Grocery Delivary',
    'PC Technition',
    'AC Technition',
    'Photographer',
    'Lights & Sounds'
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
            fontSize: 28,
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
                  labelText: 'Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _placeController,
                decoration: InputDecoration(
                  labelText: 'Place',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneNumberController,
                decoration: InputDecoration(
                  labelText: 'Phone Number',
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
                  labelText: 'Work Name',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _wageController,
                decoration: InputDecoration(
                  labelText: 'Wage',
                  suffixText: '/day',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                keyboardType: TextInputType.number,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _workDescriptionController,
                decoration: InputDecoration(
                  labelText: 'Work Description',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                ),
                maxLines: 4,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () async {
                  final name = _nameController.text.trim();
                  final place = _placeController.text.trim();
                  final phone = _phoneNumberController.text.trim();
                  final wage = _wageController.text.trim();
                  final description = _workDescriptionController.text.trim();

                  if (name.isEmpty ||
                      phone.isEmpty ||
                      _selectedWork == null ||
                      wage.isEmpty ||
                      description.isEmpty ||
                      place.isEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Fields cannot be empty")));
                    return;
                  }
                  try {
                    CollectionReference workers =
                        FirebaseFirestore.instance.collection('Worker');
                    await workers.add({
                      "name": name,
                      "phone": phone,
                      "wage": wage,
                      "place": place,
                      "description": description,
                      "work": _selectedWork,
                    });
                  } on FirebaseException catch (_) {
                    //  print(e.message);
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Couldn't add data, please try again later. ")));
                  } on PlatformException catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text("Network error, try again later.")));
                  } catch (e) {
                    ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                        content: Text(
                            "Couldn't add data, please try again later. ")));
                  }
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/workerprofile', (route) => false);
                },
                child: const Text('Save Data'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
