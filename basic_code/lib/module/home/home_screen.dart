import 'package:basic_code/module/home/models/lecture_detail.dart';
import 'package:flutter/material.dart';

import 'lecture_details_page.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _selectedOption = 'Information Communication Technology';
  List<LectureDetail> _lectureDetails = [];

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
            LectureDetail(
                title: 'Introduction to ICT',
                time: '8.00am-10.00am',
                location: 'SF02',
                imageUrl:
                    "https://cdn-blog.novoresume.com/articles/networking-statistics/bg.png"),
            LectureDetail(
                title: 'Networking Basics',
                time: '10.00am-12.00pm',
                location: 'SF03',
                imageUrl:
                    'https://media.licdn.com/dms/image/D5612AQFL8W1goz6qrQ/article-cover_image-shrink_720_1280/0/1679967164325?e=2147483647&v=beta&t=Naqebp4UD8aom_MsjcvSgKanFddmFuu0M1M0v0tPMJ8'),
            LectureDetail(
              title: 'Software Development',
              time: '12.00pm-2.00pm',
              location: 'SF04',
              imageUrl:
                  "https://cdn-blog.novoresume.com/articles/networking-statistics/bg.png",
            ),
            LectureDetail(
              title: 'Database Management',
              time: '2.00pm-4.00pm',
              location: 'SF05',
              imageUrl:
                  "https://cdn-blog.novoresume.com/articles/networking-statistics/bg.png",
            ),
          ];
          break;
        case 'Engineering Technology':
          _lectureDetails = [
            LectureDetail(
                title: 'Mechanics', time: '8.00am-10.00am', location: 'ET01'),
            LectureDetail(
              title: 'Thermodynamics',
              time: '10.00am-12.00pm',
              location: 'ET02',
              imageUrl:
                  "https://cdn-blog.novoresume.com/articles/networking-statistics/bg.png",
            ),
            LectureDetail(
              title: 'Material Science',
              time: '12.00pm-2.00pm',
              location: 'ET03',
              imageUrl:
                  "https://cdn-blog.novoresume.com/articles/networking-statistics/bg.png",
            ),
            LectureDetail(
              title: 'Engineering Drawing',
              time: '2.00pm-4.00pm',
              location: 'ET04',
              imageUrl:
                  "https://cdn-blog.novoresume.com/articles/networking-statistics/bg.png",
            ),
          ];
          break;
        case 'Bio System Technology':
          _lectureDetails = [
            LectureDetail(
                title: 'Plant Biotechnology',
                time: '8.00am-10.00am',
                location: 'BT01'),
            LectureDetail(
                title: 'Environmental Engineering',
                time: '10.00am-12.00pm',
                location: 'BT02'),
            LectureDetail(
                title: 'Food Processing',
                time: '12.00pm-2.00pm',
                location: 'BT03'),
            LectureDetail(
                title: 'Microbiology', time: '2.00pm-4.00pm', location: 'BT04'),
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
                          lectureDetail: _lectureDetails[index],
                        );
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
  final LectureDetail lectureDetail;

  const SubjectCard({
    Key? key,
    required this.lectureDetail,
  }) : super(key: key);

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
            lectureDetail.title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            lectureDetail.time,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          Text(
            lectureDetail.location,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      LectureDetailsPage(lectureDetail: lectureDetail),
                ),
              );
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
