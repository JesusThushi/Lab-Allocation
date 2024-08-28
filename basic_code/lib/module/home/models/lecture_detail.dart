class LectureDetail {
  final String title;
  final String time;
  final String location;
  final String? imageUrl;

  LectureDetail({
    required this.title,
    required this.time,
    required this.location,
    this.imageUrl,
  });
}
