import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:myapp_test/models/course.dart';
import 'package:myapp_test/pages/avis_page.dart';
import 'package:myapp_test/screens/widget/favourite_option.dart';

const kPurpleColor = Color(0xFF8A2BE2);
const kCustomPurple = Color(0xFFCB9DF0);
const kYellowHighlight = Color(0xFFF3F6A0); // Lighter yellow

class CourseDetailPage extends StatelessWidget {
  final String title;
  final String imagePath;
  final String status;
  final String duration;
  final double progress;
  final Course course;
  final String location;

  final String courseTime = "9:41 pm";
  final String instructorName = "John Doe";
  final String description =
      "There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, but the majority have suffered .";
  final String courseDate = "25/05/2025";
  final int availablePlaces = 20;
  final int participants = 12;

  CourseDetailPage({
    required this.title,
    required this.imagePath,
    required this.status,
    required this.duration,
    required this.progress,
    required this.course,
    required this.location,
  });

  @override
  Widget build(BuildContext context) {
    DateFormat dateFormat = DateFormat("dd/MM/yyyy");
    DateTime courseDateTime = dateFormat.parse(courseDate);

    if (courseDateTime.isBefore(DateTime.now())) {
      return Scaffold(
        body: Center(
          child: Text(
            "Cette formation est déjà passée",
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    bool isRegistrationClosed = participants >= availablePlaces;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 44,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 20),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications, color: Colors.black, size: 20),
            onPressed: () {},
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Center(
                  child: Image.asset(
                    imagePath,
                    height: 185,
                    width: MediaQuery.of(context).size.width * 0.95,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 14, 14, 4), // Reduced bottom padding
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        title,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: kPurpleColor,
                        ),
                      ),
                    ),
                    FavouriteOption(course: course),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6), // smaller vertical padding
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _buildDetail(Icons.person, "Formateur", instructorName,),
                          SizedBox(height: 6),
                          _buildDetail(Icons.access_time, "Heure", courseTime),
                          SizedBox(height: 7),
                          _buildDetail(Icons.groups, "Participants", "$participants"),
                          SizedBox(height: 7),
                          _buildDetail(Icons.event_seat, "Places", "$availablePlaces"),
                        ],
                      ),
                    ),
                    SizedBox(width: 7),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Chip(
                            label: Text(courseDate, style: TextStyle(fontSize: 10)),
                            avatar: Icon(Icons.calendar_today, size: 12, color: Colors.black),
                            backgroundColor: kYellowHighlight,
                            labelStyle: TextStyle(color: Colors.black),
                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 4),
                          ),
                          SizedBox(height: 6),
                          _buildDetail(
                            Icons.location_on,
                            "Lieu",
                            location,
                            alignRight: true,
                            iconColor: Colors.red,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 10),

              // Description box
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 6,
                  shadowColor: Colors.black45,
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Icon(Icons.description, color: kPurpleColor),
                            SizedBox(width: 8),
                            Text(
                              "Description",
                              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: 11),
                        Text(
                          description,
                          style: TextStyle(
                            fontSize: 13.5,
                            height: 1.6,
                            color: Colors.black,
                            fontWeight: FontWeight.w200,
                            letterSpacing: 0.2,
                          ),
                          textAlign: TextAlign.justify,
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              SizedBox(height: 23), // More space before buttons

              // Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => AvisPage()),
                        );
                      },
                      icon: Icon(Icons.comment_outlined, color: kPurpleColor, size: 18),
                      label: Text(
                        "Avis",
                        style: TextStyle(
                          fontSize: 13.5,
                          color: kPurpleColor,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: isRegistrationClosed
                          ? null
                          : () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                            insetPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 100),
                            titlePadding: EdgeInsets.fromLTRB(20, 20, 20, 8),
                            contentPadding: EdgeInsets.fromLTRB(20, 0, 20, 8),
                            actionsPadding: EdgeInsets.only(bottom: 12, right: 12, left: 12),
                            title: Center(
                              child: Column(
                                children: [
                                  SizedBox(height: 2),
                                  Text(
                                    "Confirmation",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            content: Text(
                              "Êtes-vous sûr de vouloir vous inscrire à cette formation ?",
                              style: TextStyle(fontSize: 14),
                              textAlign: TextAlign.center,
                            ),
                            actionsAlignment: MainAxisAlignment.spaceEvenly,
                            actions: [
                              SizedBox(
                                height: 36,
                                child: TextButton(
                                  onPressed: () => Navigator.pop(context),
                                  child: Text("Annuler", style: TextStyle(color: Colors.grey[700])),
                                ),
                              ),
                              SizedBox(
                                height: 36,
                                child: ElevatedButton(
                                  onPressed: () {
                                    Navigator.pop(context);
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                        content: Text("Votre demande a été enregistrée."),
                                        backgroundColor: Colors.green,
                                      ),
                                    );
                                  },
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: kPurpleColor,
                                    padding: EdgeInsets.symmetric(horizontal: 16),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                  ),
                                  child: Text("Oui", style: TextStyle(color: Colors.white)),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                      icon: Icon(Icons.check_circle_outline, size: 16, color: Colors.white),
                      label: Text(
                        "S'inscrire",
                        style: TextStyle(fontSize: 13, color: Colors.white, fontWeight: FontWeight.w500),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kPurpleColor,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                        elevation: 1,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildDetail(
      IconData icon,
      String label,
      String value, {
        bool alignRight = false,
        Color iconColor = Colors.grey,
      }) {
    return Row(
      mainAxisAlignment: alignRight ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Icon(icon, size: 18, color: iconColor),
        SizedBox(width: 6),
        Flexible(
          child: RichText(
            text: TextSpan(
              style: TextStyle(fontSize: 14, color: Colors.black),
              children: [
                TextSpan(text: "$label: ", style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: value),
              ],
            ),
          ),
        ),
      ],
    );
  }
}





