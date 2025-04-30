import 'course.dart';  // Import the Course class

class MyCourseDataProvider {
  // You can remove the static var courseList if not needed
  static List<Course> get myCourses {
    return [
      Course(
        title: "Excel avec tableau de bord Excel interactif",
        imagePath: "assets/flutter.png",
        status: "In Progress",
        duration: "5 heures",
        progress: 0.7,
        thumbnailUrl: 'assets/java.png',
        createdBy: 'Marie claire',
      ),
      Course(
        title: "Anglais des affaires essentiel ",
        imagePath: "assets/advanced_flutter.png",
        status: "Completed",
        duration: "6 heures",
        progress: 1,
        thumbnailUrl: 'assets/java.png',
        createdBy: 'emily dab',
      ),
      Course(
        title: "maîtrisez vos compétences en Flutter  ",
        imagePath: "assets/advanced_flutter.png",
        status: "In Progress",
        duration: "10 heures",
        progress: 0.25,
        thumbnailUrl: 'assets/java.png',
        createdBy: 'francois clud',
      ),
      // Add more courses as necessary
    ];
  }
}



