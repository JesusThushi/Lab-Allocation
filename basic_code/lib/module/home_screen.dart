// Home Screen Widget
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedOption = 'Information Communication Technology';
  String _lectureContent = '';

  void _updateLectureContent(String option) {
    setState(() {
      _selectedOption = option;
      switch (option) {
        case 'Information Communication Technology':
          _lectureContent = 'Today\'s ICT Lecture';
          break;
        case 'Engineering Technology':
          _lectureContent = 'Today\'s Engineering Technology Lecture';
          break;
        case 'Bio System Technology':
          _lectureContent = 'Today\'s Bio System Technology Lecture';
          break;
        default:
          _lectureContent = '';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lecture Selection'),
        backgroundColor: Colors.red, // Background color of AppBar
      ),
      body: Column(
        children: [
          Container(
            color: Colors.red, // Background color of Dropdown container
            padding: EdgeInsets.all(16.0),
            child: DropdownButton<String>(
              value: _selectedOption,
              icon: Icon(Icons.arrow_drop_down),
              isExpanded: true,
              underline: SizedBox(),
              onChanged: (String? newValue) {
                if (newValue != null) {
                  _updateLectureContent(newValue);
                }
              },
              items: <String>[
                'Information Communication Technology',
                'Engineering Technology',
                'Bio System Technology'
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Text(
                    value,
                    style: TextStyle(
                      color: Colors.black, // Text color of Dropdown options
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          Text(
            _lectureContent,
            style: TextStyle(fontSize: 20),
          ),
        ],
      ),
    );
  }
}
class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Communication Technology'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Today Schedule',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 16),
            ScheduleCard(
              subject: 'Computer Organization And Architecture',
              time: '8.00am-10.00am',
              location: 'SF02',
            ),
            ScheduleCard(
              subject: 'Communication Skills I',
              time: '10.00am-12.00pm',
              location: 'SF02',
            ),
            ScheduleCard(
              subject: 'Mathematics I',
              time: '1.00pm-3.00pm',
              location: 'SF02',
            ),
            ScheduleCard(
              subject: 'Mathematics I (Tutorial)',
              time: '3.00pm-4.00pm',
              location: 'SF02',
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.support_agent),
            label: 'Support',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.local_offer),
            label: 'My Offers',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'Notifications',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.menu),
            label: 'Menu',
          ),
        ],
        selectedItemColor: Colors.red,
      ),
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String subject;
  final String time;
  final String location;

  ScheduleCard({required this.subject, required this.time, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.symmetric(vertical: 8),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              subject,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 8),
            Text(
              time,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 4),
            Text(
              location,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
            ),
            SizedBox(height: 8),
            Align(
              alignment: Alignment.centerRight,
              child: ElevatedButton(
                onPressed: () {
                  // Add navigation or details action here
                },
                child: Text('View Details'),
                style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red, 
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
