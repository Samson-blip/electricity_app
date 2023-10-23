import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';


class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _isLoading = false;

 


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            color: const Color.fromARGB(255, 7, 5, 52),
            child: const SizedBox.expand(),
          ),
          Center(
            child: SingleChildScrollView(
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10.0),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.3),
                      spreadRadius: 3,
                      blurRadius: 5,
                     
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    const Text(
                      'Create Account',
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 20.0),
                    _buildTextField(fullNameController, 'Full name', Icons.person),
                    const SizedBox(height: 10.0),
                    _buildTextField(emailController, 'Email', Icons.email),
                    const SizedBox(height: 10.0),
                    _buildTextField(phoneController, 'Phone Number', Icons.phone),
                    const SizedBox(height: 10.0),
                    _buildTextField(passwordController, 'Password', Icons.lock, obscureText: true),
                    const SizedBox(height: 20.0),
                    const SizedBox(height: 30.0),
                    if (_isLoading)
                      const CircularProgressIndicator() // Show loading indicator if _isLoading is true
                    else
                      ElevatedButton(
                          onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text('Cancel'),
          ),
          ElevatedButton(
            onPressed: () async {
              String fullname = fullNameController.text; // Get the value from the full name field
              String email = emailController.text;
              String phone_number = phoneController.text;
              String password = passwordController.text;

              // Create a JSON payload to send to the API
              Map<String, String> payload = {
                'fullname': fullname, // Add the full name to the payload
                'email': email,
                'phone_number':phone_number,
                'password': password,
              };

              // Convert the payload to JSON string
              String payloadJson = json.encode(payload);

              try {
                // Make the API request
                Uri url = Uri.parse('http://192.168.43.17/monitoring_api/user/register.php');
                http.Response response = await http.post(
                  url,
                  body: payloadJson,
                  headers: {'Content-Type': 'application/json'},
                );

                // Check the response status
                if (response.statusCode == 200) {
                  // Successful API call
                  print('Admin added successfully!');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Admin added successfully!'),
                      backgroundColor: Color.fromARGB(255, 6, 117, 9), // Set background color to green
                      duration: Duration(seconds: 3),
                    ),
                  );
                } else {
                  // Error in API call
                  print('Failed to add admin. Please try again.');
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text('Failed to add admin. Please try again.'),
                      backgroundColor: Colors.red, // Set background color to red
                      duration: Duration(seconds: 3),
                    ),
                  );
                }
              } catch (e) {
                // Exception occurred during API call
                print('Error: $e');
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('An error occurred. Please try again.'),
                    backgroundColor: Colors.red, // Set background color to red
                    duration: Duration(seconds: 3),
                  ),
                );
              }

              Navigator.of(context).pop();
            },
                        
                        child: const Text('Submit'),
                      ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(TextEditingController controller, String labelText, IconData icon, {bool obscureText = false}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
        labelText: labelText,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
      obscureText: obscureText,
    );
  }
}
