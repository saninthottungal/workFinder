import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreenResults extends StatelessWidget {
  List<Map<String, dynamic>> workersList;

  ScreenResults({super.key, required this.workersList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'WorkFinder',
          style: TextStyle(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 209, 27, 14),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView.separated(
          itemCount: workersList.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              leading: const CircleAvatar(
                child: Icon(Icons.work_rounded),
              ),
              title: Text(workersList[index]['name']),
              subtitle: Text(workersList[index]['phone']),
              trailing: Text(
                workersList[index]['place'],
                style: const TextStyle(fontSize: 16),
              ),
              // Add any other widgets or customization for each list item
            );
          },
        ),
      ),
    );
  }
}
