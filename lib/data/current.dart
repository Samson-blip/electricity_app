import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';

class RealtimeDataPage extends StatefulWidget {
  const RealtimeDataPage({Key? key}) : super(key: key);

  @override
  _RealtimeDataPageState createState() => _RealtimeDataPageState();
}

class _RealtimeDataPageState extends State<RealtimeDataPage> {
  final databaseReference = FirebaseDatabase.instance.reference();
  String? currentData;

  @override
  void initState() {
    super.initState();
    listenToDataChanges();
  }

  void listenToDataChanges() {
    databaseReference.child('current_data').onValue.listen((event) {
      setState(() {
        if (event.snapshot.value != null) {
          currentData = event.snapshot.value.toString();
        } else {
          currentData = 'No data available';
        }
      });
    }, onError: (error) {
      // Handle any error that occurs during data retrieval
      print("Error occurred: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Realtime Data'),
      ),
      body: Center(
        child: GridView.count(
          crossAxisCount: 2,
          padding: const EdgeInsets.all(10),
          children: [
            Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.data_usage),
                  const SizedBox(height: 10),
                  const Text(
                    'Current Data',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Center(
                    child: Text(currentData ?? 'No data available'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
