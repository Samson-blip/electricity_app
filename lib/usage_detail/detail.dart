import 'package:flutter/material.dart';

class UsageDetailsPage extends StatelessWidget {
  final List<GridItem> gridItems = [
    GridItem(
      icon: Icons.data_usage,
      title: 'Current Usage ',
      description: '2 units',
    ),
    GridItem(
      icon: Icons.notifications,
      title: 'Notification',
      description: 'Sasa',
      hasBadge: true,
    ),
    GridItem(
      icon: Icons.calendar_today,
      title: 'Total usage per day',
      description: '10 units',
    ),
    GridItem(
      icon: Icons.money,
      title: 'Cost per day',
      description: '5Tsh',
    ),
  ];

   UsageDetailsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0), 
        child: GridView.count(
          crossAxisCount: 2,
          children: gridItems.map((item) {
            return Container(
              padding: const EdgeInsets.all(8.0),
              child: GridTile(
                child: Container(
                  color: Colors.grey[200],
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        item.icon,
                        size: 48,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        item.description,
                        style: const TextStyle(fontSize: 14),
                        textAlign: TextAlign.center,
                      ),
                      if (item.hasBadge) ...[
                        const SizedBox(height: 8),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                          decoration: BoxDecoration(
                            color: Colors.green, // Change the badge color here
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Text(
                            'New',
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ],
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class GridItem {
  final IconData icon;
  final String title;
  final String description;
  final bool hasBadge;

  GridItem({
    required this.icon,
    required this.title,
    required this.description,
    this.hasBadge = false,
  });
}
