import 'package:flutter/material.dart';

class WorkCategoryPage extends StatefulWidget {
  const WorkCategoryPage({super.key});

  @override
  State<WorkCategoryPage> createState() => _WorkCategoryPageState();
}

class _WorkCategoryPageState extends State<WorkCategoryPage> {
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
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          title: const Center(
            child: Text(
              'WorkFinder',
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          backgroundColor: const Color.fromARGB(255, 209, 27, 14),
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

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.4),
                        blurRadius: 10,
                        spreadRadius: 2,
                        offset: const Offset(0, 5),
                      ),
                    ],
                  ),
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
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 18,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
