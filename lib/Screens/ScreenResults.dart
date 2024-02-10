import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ScreenResults extends StatefulWidget {
  List<Map<String, dynamic>> workersList = [];

  ScreenResults({super.key, required this.workersList});

  @override
  State<ScreenResults> createState() => _ScreenResultsState();
}

class _ScreenResultsState extends State<ScreenResults> {
  @override
  Widget build(BuildContext context) {
    if (widget.workersList.isEmpty) {
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
          body: const Center(
              child: Text(
            "Sorry, No workers Available",
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          )));
    } else {
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
              itemCount: widget.workersList.length,
              separatorBuilder: (context, index) => const Divider(),
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const CircleAvatar(
                    child: Icon(Icons.work_rounded),
                  ),
                  title: Text(widget.workersList[index]['name']),
                  subtitle: Text(widget.workersList[index]['phone']),
                  trailing: Text(
                    widget.workersList[index]['place'],
                    style: const TextStyle(fontSize: 16),
                  ),
                );
              }),
        ),
      );
    }
  }
}
