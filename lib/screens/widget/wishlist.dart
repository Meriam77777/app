import 'package:flutter/material.dart';
import 'package:myapp_test/models/course.dart';
import '../../models/   my_course_data_provider.dart';


class Wishlist extends StatefulWidget {
  const Wishlist({Key? key}) : super(key: key);

  @override
  State<Wishlist> createState() => _WishlistState();
}

class _WishlistState extends State<Wishlist> {
  @override
  Widget build(BuildContext context) {
    List<Course> courseList = getCourseList(context); // Fetch courses filtered by 'isFavourite'
    return ListView.builder(
      shrinkWrap: true,
      itemCount: courseList.length, // Ensure this is the correct length
      itemBuilder: (context, index) {
        Course course = courseList[index];
        return getListItem(course); // Display the course item
      },
    );
  }

  // Function to filter courses that are marked as 'favourite'
  List<Course> getCourseList(BuildContext context) {
    return MyCourseDataProvider.myCourses // Fetch courses from the provider
        .where((course) => course.isFavourite) // Filter only favourite courses
        .toList(); // Use 'toList()' instead of 'tolist()' (corrected)
  }

  Widget getListItem(Course course) {
    return Card(
      elevation: 5,  // Add shadow
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),  // Rounded corners
      ),
      color: Colors.white,  // Card background
      child: ListTile(
        leading: Image.asset(
          course.thumbnailUrl,
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        title: Text(
          course.title,
          maxLines: 2,
          style: TextStyle(
            fontSize: 15,
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              course.createdBy,
              style: TextStyle(
                fontSize: 11,
                color: Colors.grey.shade500,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Text(
                  course.duration,
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                ),
                const SizedBox(width: 10),
                Text(
                  "${course.lessonNo} Lessons",
                  style: TextStyle(
                    color: Colors.grey.shade500,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(width: 10),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.grey,
                ),
                const Icon(
                  Icons.favorite,
                  color: Colors.redAccent, // Black heart icon
                  size: 15, // Minimized size for heart icon
                ),
                const Spacer(),
                // Delete icon on the same line, minimized size
                InkWell(
                  onTap: () {
                    setState(() {
                      course.isFavourite = false; // Remove from favorites
                    });
                  },
                  child: const Icon(
                    Icons.delete,
                    color: Colors.black,
                    size: 18, // Minimized size for delete icon
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}







