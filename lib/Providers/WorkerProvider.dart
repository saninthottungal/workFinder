import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class WorkerProvider extends ChangeNotifier {
  List<Map<String, dynamic>> workersList = [];

  Future<void> getWorkers() async {
    workersList = [];
    // workCategory = workCategories[index];
    final workersQuery = await FirebaseFirestore.instance
        .collection('Worker')
        .get()
        .then((value) => value);
    workersList = workersQuery.docs.map((doc) => doc.data()).toList();
    notifyListeners();
  }
}
