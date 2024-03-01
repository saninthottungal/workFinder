import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sidsproject/Screens/ScreenResults.dart';

class ScreenWorkCategory extends StatefulWidget {
  const ScreenWorkCategory({super.key});

  @override
  State<ScreenWorkCategory> createState() => _ScreenWorkCategoryState();
}

class _ScreenWorkCategoryState extends State<ScreenWorkCategory> {
  String? workCategory;
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
  }

  @override
  void dispose() {
    workersList = [];
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            'Worker Finder',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
        backgroundColor: const Color.fromARGB(233, 4, 109, 188),
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
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Card(
                      color: Colors.white,
                      child: ListTile(
                        onTap: () async {
                          workersList = [];
                          workCategory = workCategories[index];
                          final workersQuery = await FirebaseFirestore.instance
                              .collection('Worker')
                              .get()
                              .then((value) => value);
                          final workers =
                              workersQuery.docs.map((doc) => doc.data());
                          await Future.forEach(workers, (worker) {
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
                          backgroundColor: Color.fromARGB(233, 4, 109, 188),
                          radius: 32,
                          child: Icon(
                            Icons.work_outline,
                            size: 32,
                            color: Colors.white,
                          ),
                        ),
                        title: Text(
                          workCategories[index],
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  );
                },
                separatorBuilder: (context, index) => const SizedBox(
                      height: 4,
                    )),
          ),
        ],
      ),
    );
  }
}
