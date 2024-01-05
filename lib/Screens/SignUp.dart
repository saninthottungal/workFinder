import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _nameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _workDescriptionController = TextEditingController();
  final _wageController = TextEditingController(); // Added for wage input
  String? _selectedWork;

  final _workOptions = [
    'Web Development',
    'Mobile Development',
    'Graphic Design',
    'Marketing',
    'Other',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: const Text(
          'User Profile',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
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
                suffixText: '/day', // Automatically append "/day"
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              keyboardType: TextInputType.number, // Restrict input to numbers
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, // Enforce number-only input
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
            const SizedBox(height: 180),
            ElevatedButton(
              onPressed: () {
                // Handle saving data here
                // Access values using controllers:
                // _nameController.text, _phoneNumberController.text, _selectedWork, _wageController.text, _workDescriptionController.text
              },
              child: const Text('Save Data'),
            ),
          ],
        ),
      ),
    );
  }
}
