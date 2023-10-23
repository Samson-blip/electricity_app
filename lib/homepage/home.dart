import 'package:flutter/material.dart';

import '../usage_detail/control.dart';
import '../usage_detail/detail.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false, 
        backgroundColor: const Color.fromARGB(255, 7, 5, 52),
        title: const Text('Dashboard'),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Usage Detail'),
            Tab(text: 'Control Usage'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          UsageDetailsPage(),
          const ControlUsagePage(),
        ],
      ),
    );
  }
}

