import 'package:electricity_app/usage_detail/setting.dart';
import 'package:flutter/material.dart';
import 'limit.dart';

class ControlUsagePage extends StatefulWidget {
  const ControlUsagePage({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _ControlUsagePageState createState() => _ControlUsagePageState();
}

class _ControlUsagePageState extends State<ControlUsagePage> {
  int _selectedIndex = 0;

  static  final List<Widget> _widgetOptions = <Widget>[
 
    SettingsPage(),
    const UsageLimitPage(),
    ProfilePage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add),
            label: 'Set limit',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: const Color.fromARGB(255, 7, 5, 52),
        onTap: _onItemTapped,
      ),
    );
  }
}



class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Profile Page'),
      ),
    );
  }
}
