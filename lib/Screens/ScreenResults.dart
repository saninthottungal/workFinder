import 'package:flutter/material.dart';

class ScreenResults extends StatelessWidget {
  final String workCategory;
  final List<String> items = List.generate(50, (index) => 'Item $index');

  ScreenResults({super.key, required this.workCategory});

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
          itemCount: items.length,
          separatorBuilder: (context, index) => const Divider(),
          itemBuilder: (context, index) {
            return ListTile(
              title: Text(items[index]),
              // Add any other widgets or customization for each list item
            );
          },
        ),
      ),
    );
  }
}
