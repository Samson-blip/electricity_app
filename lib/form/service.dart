import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ServiceRegistrationPage extends StatefulWidget {
  @override
  _ServiceRegistrationPageState createState() => _ServiceRegistrationPageState();
}

class _ServiceRegistrationPageState extends State<ServiceRegistrationPage> {
  String name = '';
  String email = '';
  String description = '';
  String selectedService = 'Service 1';
  List<String> services = ['Service 1', 'Service 2', 'Service 3'];
 // Orodha ya huduma

  void registerService() async {
    // Endpoint ya API ya kuhifadhi taarifa ya usajili kwenye database
    var url = Uri.parse('https://example.com/register_service');

    // Tuma data ya usajili kwenye server
    var response = await http.post(url, body: {'name': name, 'email': email, 'service': selectedService});

    if (response.statusCode == 200) {
      // Usajili umefanikiwa
      print('Usajili umekamilika!');
    } else {
      // Hitilafu katika usajili
      print('Hitilafu katika usajili. Tafadhali jaribu tena.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usajili wa Huduma'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                labelText: 'Jina',
              ),
              onChanged: (value) {
                setState(() {
                  name = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            TextField(
              decoration: const InputDecoration(
                labelText: 'Barua pepe',
              ),
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
            ),
            const SizedBox(height: 16.0),
            DropdownButtonFormField(
              value: selectedService,
              items: services.map((service) {
                return DropdownMenuItem(
                  value: service,
                  child: Text(service),
                );
              }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedService = value.toString();
                });
              },
              decoration: const InputDecoration(
                labelText: 'Huduma',
              ),
            ),
  TextFormField(
  
  maxLines: 3,
  decoration: InputDecoration(
    labelText: 'Description',
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.blue, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: const BorderSide(color: Colors.red, width: 2),
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  validator: (value) {
    if (value!.isEmpty) {
      return 'Please enter a description';
    }
    return null;
  },
  
),

            const SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                registerService();
              },
              child: const Text('Register'),
            ),
          ],
        ),
      ),
    );
  }
}
