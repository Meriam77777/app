class Course {
  final String title;        // The name of the course
  final String imagePath;    // Path to the image asset (e.g., "manager", "developer")

  Course({required this.title, required this.imagePath});
}
List<Course> courses = [
  Course(title: "Manager", imagePath: "assets/manager.png"),
  Course(title: "Java", imagePath: "assets/java.png"),
  Course(title: "Design", imagePath: "assets/design.png"),
  // Add more courses here...
];
