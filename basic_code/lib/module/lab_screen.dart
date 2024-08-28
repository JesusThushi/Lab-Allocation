// Laboratory Screen Widget
import 'package:flutter/material.dart';

// Laboratory Screen with TabBar
class LaboratoryScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Laboratory'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Semester 1'),
              Tab(text: 'Semester 2'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Semester1Screen(),
            Semester2Screen(),
          ],
        ),
      ),
    );
  }
}

// Semester 1 Data
class Semester1Screen extends StatelessWidget {
  final List<String> semester1Data = [
    'Physics Lab 1',
    'Chemistry Lab 1',
    'Biology Lab 1',
    'Computer Science Lab 1',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: semester1Data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.science),
          title: Text(semester1Data[index]),
        );
      },
    );
  }
}

// Semester 2 Data
class Semester2Screen extends StatelessWidget {
  final List<String> semester2Data = [
    'Physics Lab 2',
    'Chemistry Lab 2',
    'Biology Lab 2',
    'Computer Science Lab 2',
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: semester2Data.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.science),
          title: Text(semester2Data[index]),
        );
      },
    );
  }
}
