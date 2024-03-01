import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ScreenResults extends StatefulWidget {
  final List<Map<String, dynamic>> workersList;

  ScreenResults({Key? key, required this.workersList}) : super(key: key);

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
            'Worker Finder',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(233, 4, 109, 188),
        ),
        body: const Center(
          child: Text(
            "Sorry, Currently no workers Available",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Worker Finder',
            style: TextStyle(
              fontSize: 26,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
          backgroundColor: const Color.fromARGB(233, 4, 109, 188),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: widget.workersList.length,
            itemBuilder: (context, index) {
              return Column(
                children: [
                  Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            backgroundColor: Color.fromARGB(233, 4, 109, 188),
                            radius: 32,
                            child: Icon(
                              Icons.person_outlined,
                              size: 40,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 26),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.workersList[index]['name'],
                                  style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                Text(
                                  widget.workersList[index]['phone'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 126, 126, 126),
                                  ),
                                ),
                                Text(
                                  widget.workersList[index]['place'],
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: const Color.fromARGB(
                                        255, 126, 126, 126),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.call,
                              size: 32,
                              color: const Color.fromARGB(255, 0, 164, 5),
                            ),
                            onPressed: () async {
                              String phone =
                                  '+91${widget.workersList[index]['phone']}';
                              Uri phoneUri = Uri(scheme: 'tel', path: phone);
                              await launchUrl(phoneUri);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 4), // Adjust the height as needed
                ],
              );
            },
          ),
        ),
      );
    }
  }

  // Function to launch URL
  Future<void> launchUrl(Uri uri) async {
    if (await canLaunch(uri.toString())) {
      await launch(uri.toString());
    } else {
      throw 'Could not launch ${uri.toString()}';
    }
  }
}
