import 'package:flutter/material.dart';

class UsageLimitPage extends StatefulWidget {
  const UsageLimitPage({super.key});

  @override
  _UsageLimitPageState createState() => _UsageLimitPageState();
}

class _UsageLimitPageState extends State<UsageLimitPage> {
  int usageLimit = 0; // Kikomo cha matumizi ya vitengo vya umeme
  int selectedDuration = 0;
  List<int> durations = [1, 2, 3, 4, 5, 6, 7, 8]; // Angalau thamani 8 ili kuepuka makosa

  @override
  void initState() {
    super.initState();
    selectedDuration = durations[0]; // Initialize selectedDuration here
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Chagua Kikomo cha Matumizi ya Vitengo vya Umeme:'),
            DropdownButton<int>(
              value: selectedDuration,
              onChanged: (int? newValue) {
                setState(() {
                  selectedDuration = newValue!;
                });
              },
              items: durations.map<DropdownMenuItem<int>>((int value) {
                return DropdownMenuItem<int>(
                  value: value,
                  child: Text('$value Hours'),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            Text('usage limit: $usageLimit Units'),
            ElevatedButton(
              onPressed: () {
                showUsageLimitDialog();
              },
              child: const Text('Set limit'),
            ),
          ],
        ),
      ),
    );
  }

  void showUsageLimitDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('set your limit per hours'),
          content: TextField(
            keyboardType: TextInputType.number,
            onChanged: (String value) {
              setState(() {
                usageLimit = int.parse(value);
              });
            },
            decoration: const InputDecoration(hintText: 'Enter limit (Units)'),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }
}
