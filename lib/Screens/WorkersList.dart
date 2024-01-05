import 'package:flutter/material.dart';

class WorkersList extends StatefulWidget {
  const WorkersList({super.key});

  @override
  State<WorkersList> createState() => _WorkersListState();
}

class _WorkersListState extends State<WorkersList> {
  List<Map<String, dynamic>> workListings = [
    {
      'logo': Icons.work,
      'name': 'John Doe',
      'place': 'Kozhikode',
      'wage': '+91 1234567890', // Phone number displayed here
      'contactNumber': '₹500/day', // Wage displayed here
    },
    {
      'logo': Icons.work,
      'name': 'Jane Doe',
      'place': 'Thrissur',
      'wage': '+91 9876543210',
      'contactNumber': '₹450/day',
    },
    {
      'logo': Icons.work,
      'name': 'Peter Smith',
      'place': 'Kochi',
      'wage': '+91 4567891230',
      'contactNumber': '₹600/day',
    },
    {
      'logo': Icons.work,
      'name': 'Abhin',
      'place': 'Vengara',
      'wage': '+91 4567891230',
      'contactNumber': '₹600/day',
    },
    {
      'logo': Icons.work,
      'name': 'Hari',
      'place': 'Koppam',
      'wage': '+91 4567891230',
      'contactNumber': '₹400/day',
    },
    {
      'logo': Icons.work,
      'name': 'Hari',
      'place': 'Koppam',
      'wage': '+91 4567891230',
      'contactNumber': '₹400/day',
    },
    {
      'logo': Icons.work,
      'name': 'Hari',
      'place': 'Koppam',
      'wage': '+91 4567891230',
      'contactNumber': '₹400/day',
    },
    {
      'logo': Icons.work,
      'name': 'Hari',
      'place': 'Koppam',
      'wage': '+91 4567891230',
      'contactNumber': '₹400/day',
    },
    {
      'logo': Icons.work,
      'name': 'Hari',
      'place': 'Koppam',
      'wage': '+91 4567891230',
      'contactNumber': '₹400/day',
    },
    {
      'logo': Icons.work,
      'name': 'Hari',
      'place': 'Koppam',
      'contactNumber': '+91 4567891230',
      'wage': '₹400/day',
    },
    {
      'logo': Icons.work,
      'name': 'Hari',
      'place': 'Koppam',
      'wage': '+91 4567891230',
      'contactNumber': '₹400/day',
    },

    // Add more listings here with the same structure
  ];
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
              itemCount: workListings.length,
              itemBuilder: (context, index) {
                final listing = workListings[index];

                return Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color:
                            const Color.fromARGB(255, 0, 0, 0).withOpacity(0.3),
                        blurRadius: 8,
                        spreadRadius: 3,
                        offset: const Offset(0, 0),
                      ),
                    ],
                  ),
                  child: ListTile(
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          listing['name'],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          listing['place'],
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 94, 94, 94),
                              fontWeight: FontWeight.w500),
                        ),
                        Text(
                          listing['wage'],
                          style: const TextStyle(
                              fontSize: 14,
                              color: Color.fromARGB(255, 94, 94, 94),
                              fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                    trailing: Text(
                      listing['contactNumber'],
                      style: const TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 94, 94, 94),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const Divider(
                height: 8,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
