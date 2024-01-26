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
        backgroundColor: Colors.red,
        title: const Text(
          'Worker Profile',
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
                suffixText: '/day', 
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                ),
              ),
              keyboardType: TextInputType.number, 
              inputFormatters: [
                FilteringTextInputFormatter
                    .digitsOnly, 
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
              onPressed: () {Navigator.pushNamedAndRemoveUntil(context, '/workerprofile', (route) => false);
              },
              child: const Text('Save Data'),
            ),
          ],
        ),
      ),
    );
  }
}
