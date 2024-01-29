import 'package:flutter/material.dart';

class ScreenWorkCategory extends StatefulWidget {
  const ScreenWorkCategory({super.key});

  @override
  State<ScreenWorkCategory> createState() => _ScreenWorkCategoryState();
}

class _ScreenWorkCategoryState extends State<ScreenWorkCategory> {
  List<String> workCategories = [
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
  void initState() {
    super.initState();
    workCategories.sort();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(56),
        child: AppBar(
          title: const Center(
            child: Text(
              'WorkFinder',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(233, 4, 109, 188),
          actions: [
            PopupMenuButton<String>(
              onSelected: (value) {
                // Handle profile and logout button presses
              },
              itemBuilder: (BuildContext context) => [
                const PopupMenuItem<String>(
                  value: 'Profile',
                  child: Text('Profile'),
                ),
                const PopupMenuItem<String>(
                  value: 'LogOut',
                  child: Text('LogOut'),
                ),
              ],
              icon: const Icon(Icons.menu, color: Colors.white, size: 30),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemCount: workCategories.length,
                itemBuilder: (context, index) {
                  final WorkCategory = workCategories[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: Colors.white70,
                      child: ListTile(
                        minVerticalPadding: 30,
                        dense: false,
                        leading: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 58, 94, 173),
                          radius: 30,
                          child: Icon(Icons.work),
                        ),
                        title: Text(
                          WorkCategory,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 6,
                    )),
          ),
        ],
      ),
    );
  }
}
