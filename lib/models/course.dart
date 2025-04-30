class Course {
  String title;
  String imagePath;
  String status;
  String duration;
  double progress;
  String thumbnailUrl;
  bool _isFavourite = true;
  String createdBy;

  Course({
    required this.title,
    required this.imagePath,
    required this.status,
    required this.duration,
    required this.progress,
    required this.thumbnailUrl,
    required this.createdBy,
  });

  bool get isFavourite => _isFavourite;
  set isFavourite(bool value) => _isFavourite = value;

  int get lessonNo => 10;
  double get rate => 4.5;

  @override
  String toString() => 'Course(title: $title, status: $status, progress: $progress)';
}


