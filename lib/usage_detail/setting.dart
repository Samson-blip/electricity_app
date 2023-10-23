import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 24.0),
              Expanded(
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    children: [
                      ListTile(
                        leading: const Icon(Icons.report),
                        title: Text(
                          'Ripoti ya Jumla',
                          style: GoogleFonts.openSans(fontSize: 16.0),
                        ),
                        onTap: () {
                          // Handle general report action
                        },
                      ),
                      const Divider(),
                      ListTile(
                        leading: const Icon(Icons.language),
                        title: Text(
                          'Badilisha Lugha',
                          style: GoogleFonts.openSans(fontSize: 16.0),
                        ),
                        onTap: () {
                          // Handle change language action
                        },
                      ),
                      const Divider(),
                      // Add more settings options here
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
