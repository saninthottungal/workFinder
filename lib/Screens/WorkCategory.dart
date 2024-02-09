import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sidsproject/Screens/ScreenResults.dart';

class ScreenWorkCategory extends StatefulWidget {
  const ScreenWorkCategory({super.key});

  @override
  State<ScreenWorkCategory> createState() => _ScreenWorkCategoryState();
}

class _ScreenWorkCategoryState extends State<ScreenWorkCategory> {
  List<Map<String, dynamic>> workersList = [];
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
    'Grocery Delivery',
    'PC Technician',
    'AC Technician',
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
      appBar: AppBar(
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
          IconButton(
            onPressed: () {
              Navigator.of(context).pushNamed('/signin');
            },
            icon: const Icon(Icons.person_2_outlined),
            color: Colors.white,
          )
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
                itemCount: workCategories.length,
                itemBuilder: (context, index) {
                  final workCategory = workCategories[index];

                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Card(
                      color: Colors.white70,
                      child: ListTile(
                        onTap: () async {
                          final workersQuery = await FirebaseFirestore.instance
                              .collection('Worker')
                              .get()
                              .then((value) => value);
                          final workers =
                              workersQuery.docs.map((doc) => doc.data());

                          Future.forEach(workers, (worker) {
                            if (worker['work'] == workCategory) {
                              workersList.add(worker);
                            }
                          });
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ScreenResults(
                                    workersList: workersList,
                                  )));
                        },
                        minVerticalPadding: 30,
                        dense: false,
                        leading: const CircleAvatar(
                          backgroundColor: Color.fromARGB(255, 58, 94, 173),
                          radius: 30,
                          child: Icon(Icons.work),
                        ),
                        title: Text(
                          workCategory,
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
