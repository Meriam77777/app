import 'package:flutter/material.dart';
import 'package:myapp_test/models/course.dart';
import 'package:myapp_test/screens/course_detail_page.dart';

import '../models/   my_course_data_provider.dart';


const kPrimaryColor =  Color(0xFF000000);
const kBlueColor = Color(0xFF7CDD99);  // Define this color if it's missing

class MyCourseList extends StatelessWidget {
  const MyCourseList({super.key});

  @override
  Widget build(BuildContext context) {
    List<Course> myCourseList = MyCourseDataProvider.myCourses;

    return Scaffold(
      appBar: AppBar(
        title: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Mes Cours",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            Navigator.pop(context);  // Go back to the previous screen (Accueil page)
          },
        ),
        backgroundColor: Colors.white,
        elevation: 0, // Remove the default AppBar shadow
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              SizedBox(
                height: 30,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: kPrimaryColor,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade900),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("tous", style: TextStyle(fontSize:12,color: Colors.white , fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade900),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Téléchargement", style: TextStyle(fontSize:13,color: Colors.black, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: const BorderRadius.all(Radius.circular(10)),
                          border: Border.all(color: Colors.grey.shade900),
                        ),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: Text("Archives", style: TextStyle(fontSize:13,color: Colors.black, fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: ListView.builder(
                  itemCount: myCourseList.length,
                  itemBuilder: (context, index) {
                    var myCourse = myCourseList[index];
                    return getMyCourse(myCourse, context);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget getMyCourse(Course myCourse, BuildContext context) {
    return Card(
      elevation: 5,  // Add shadow to the card
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),  // Rounded corners for the card
      ),
      color: Colors.white,  // Set the background color to white
      child: ListTile(
        leading: Image.asset(
          myCourse.thumbnailUrl,
          width: 50.0,
          height: 50.0,
          fit: BoxFit.cover,
        ),
        title: Text(
          myCourse.title,
          maxLines: 2,
          style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              myCourse.createdBy,
              style: TextStyle(fontSize: 11,color: Colors.grey.shade500, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 5),

            // Check if progress is greater than 0
            myCourse.progress > 0
                ? Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [

                SizedBox(height: 10),
                LinearProgressIndicator(
                  value: myCourse.progress,  // Use progress as a fraction (0.0 to 1.0)
                  backgroundColor: Colors.grey.shade200,
                  color: Color(0xFF882BD0),
                ),
                Text(
                  "${(myCourse.progress * 100).toStringAsFixed(1)}% completed", // Convert to percentage
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800,
                      fontSize: 12
                  ),
                ),
              ],
            )
                : const Text(
              "Start Course",
              style: TextStyle(color: kBlueColor, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}





