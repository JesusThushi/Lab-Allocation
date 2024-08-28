import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _selectedOption = 'Information Communication Technology';
  List<String> _lectureDetails = [];

  @override
  void initState() {
    super.initState();
    _updateLectureContent(_selectedOption);
  }

  void _updateLectureContent(String option) {
    setState(() {
      _selectedOption = option;
      switch (option) {
        case 'Information Communication Technology':
          _lectureDetails = [
            'Introduction to ICT',
            'Networking Basics',
            'Software Development',
            'Database Management',
          ];
          break;
        case 'Engineering Technology':
          _lectureDetails = [
            'Mechanics',
            'Thermodynamics',
            'Material Science',
            'Engineering Drawing',
          ];
          break;
        case 'Bio System Technology':
          _lectureDetails = [
            'Plant Biotechnology',
            'Environmental Engineering',
            'Food Processing',
            'Microbiology',
          ];
          break;
        default:
          _lectureDetails = [];
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        forceMaterialTransparency: true,
        automaticallyImplyLeading: false,
        title: Text('Lecture Selection'),
      ),
      body: Column(
        children: [
          Container(
            color: Colors.grey.shade300,
            padding: EdgeInsets.symmetric(horizontal: 16),
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
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Today Schedule',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Wed 12th May 2021",
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey[600],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Expanded(
                    child: ListView.builder(
                      itemCount: _lectureDetails.length,
                      itemBuilder: (context, index) {
                        return SubjectCard(
                            lectureDetails: _lectureDetails, index: index);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class SubjectCard extends StatelessWidget {
  const SubjectCard({
    super.key,
    required int index,
    required List<String> lectureDetails,
  })  : _lectureDetails = lectureDetails,
        _index = index;

  final List<String> _lectureDetails;
  final int _index;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            _lectureDetails[_index],
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            '8.00am-10.00am',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Text(
            'SF02',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Add navigation or details action here
            },
            child: Text(
              'View Details',
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
            style: ElevatedButton.styleFrom(
              minimumSize: Size(100, 30),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              backgroundColor: const Color.fromARGB(255, 161, 33, 24),
            ),
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
    );
  }
}

class ScheduleCard extends StatelessWidget {
  final String subject;
  final String time;
  final String location;

  ScheduleCard(
      {required this.subject, required this.time, required this.location});

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
