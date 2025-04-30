import 'package:flutter/material.dart';
import '../data/Controllers/AuthController.dart';
import '../models/course.dart';
import 'package:get/get.dart';
import '../screens/all_courses_screen.dart';
import '../screens/course_detail_page.dart';

class AccueilPage extends StatefulWidget {
  @override
  _AccueilPageState createState() => _AccueilPageState();
}

class _AccueilPageState extends State<AccueilPage> {
  int selectedCategoryIndex = 0;
  List<String> categories = ["Tout", "Design", "Programmation", "UI/UX", "Marketing digital", "Communication", "Finance"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: CustomDrawer(),
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Builder(
                      builder: (context) => IconButton(
                        icon: Icon(
                          Icons.menu,
                          size: 30,
                          color: Color(0xFF8A2BE2),
                        ),
                        onPressed: () => Scaffold.of(context).openDrawer(),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const Text(
                          "Développez vos ",
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                        Text(
                          "Talents",
                          style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF8A2BE2),
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.italic,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "et atteignez vos Objectifs avec MentorUp !",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  "Formations à venir ",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  height: 200,  // Reduced height for better spacing
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      courseCard("Anglais des affaires", "assets/eng.png", Color(0xFF4527A0), "John Doe", date: "20/05/2025", isUpcoming: true),
                      courseCard("Chef de projet", "assets/prr.png", Color(0xFF4527A0), "Jane Smith", date: "15/06/2025", isUpcoming: true),
                      courseCard("Team collaboration", "assets/team.png", Color(0xFF4527A0), "Tom Brown", date: "10/07/2025", isUpcoming: true),
                      courseCard("Finance", "assets/fif.png", Color(0xFF4527A0), "Sarah Lee", date: "05/08/2025", isUpcoming: true),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  "Catégories",
                  style: TextStyle(
                    fontSize: 17,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 10),
                categorySection(),
                const SizedBox(height: 17),
                const Text(
                  "Cours créés pour vous",
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'OpenSans',
                    fontWeight: FontWeight.bold
                    ,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 13),
                Container(
                  height: 180,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      courseCard("Creative Art Design", "assets/immmm.png", Color(0xFF4527A0), "16 heures", isUpcoming: false),
                      courseCard("Marketing", "assets/mark.png", Color(0xFF4527A0), "20 heures", isUpcoming: false),
                      courseCard("Management d'équipe", "assets/manag.png", Color(0xFF4527A0), "10 heures", isUpcoming: false),
                      courseCard("Confiance en soi", "assets/machine.png", Color(0xFF4527A0), "18 heures", isUpcoming: false),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget categorySection() {
    return SizedBox(
      height: 35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final isSelected = selectedCategoryIndex == index;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedCategoryIndex = index;
              });
            },
            child: AnimatedContainer(
              duration: Duration(milliseconds: 250),
              margin: const EdgeInsets.symmetric(horizontal: 6),
              padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 5),
              decoration: BoxDecoration(
                color: isSelected ? Color(0xFF8A2BE2).withOpacity(0.1) : Colors.grey.shade100,
                borderRadius: BorderRadius.circular(30),
                border: Border.all(
                  color: isSelected ? Color(0xFF8A2BE2) : Colors.transparent,
                  width: 1.5,
                ),
                boxShadow: isSelected
                    ? [BoxShadow(color: Color(0xFF8A2BE2).withOpacity(0.15), blurRadius: 4, offset: Offset(0, 2))]
                    : [],
              ),
              child: Center(
                child: Text(
                  categories[index],
                  style: TextStyle(
                    color: isSelected ? Color(0xFF8A2BE2) : Colors.black87,
                    fontWeight: FontWeight.w600,
                    fontSize: 13,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget courseCard(String title, String imagePath, Color color, String formateur, {String date = '', double progress = 0.0, bool isUpcoming = true}) {
    Course course = Course(
      title: title,
      imagePath: imagePath,
      status: "Upcoming",
      duration: formateur,
      progress: progress,
      thumbnailUrl: 'assets/machine.png',
      createdBy: 'john dip',
    );

    return GestureDetector(
      onTap: () {
        if (!isUpcoming) {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AllCoursesScreen(title)));
        } else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailPage(
            title: course.title,
            imagePath: course.imagePath,
            status: course.status,
            duration: course.duration,
            progress: course.progress,
            course: course,
            location: "Monastir",
          )));
        }
      },
      child: Container(
        width: 150,  // Reduced width for better fitting
        margin: const EdgeInsets.only(right: 12),  // Reduced margin for better spacing
        padding: const EdgeInsets.all(10),  // Reduced padding
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset(imagePath, height: 70, width: double.infinity, fit: BoxFit.cover),  // Smaller image size
            const SizedBox(height: 6),
            Text(
              title,
              style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold, color: color),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
            const SizedBox(height: 6),
            // Trainer info
            if (isUpcoming)
              Row(
                children: [
                  Icon(Icons.person, size: 11, color: Colors.grey),
                  const SizedBox(width: 4),
                  Text(
                    formateur,
                    style: TextStyle(fontSize: 10, color: Colors.grey[600]),
                  ),
                ],
              )
            else
              Row(
                children: [
                  Icon(Icons.schedule, size: 11, color: Colors.black),
                  const SizedBox(width: 4),
                  Text(
                    formateur,
                    style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            // Show date only for upcoming
            if (isUpcoming && date.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Date Box
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4), // Slightly larger padding for better spacing
                      decoration: BoxDecoration(
                        color: kYellowHighlight.withOpacity(0.8), // Light background color
                        borderRadius: BorderRadius.circular(8),  // Rounded corners
                        border: Border.all(
                          color: kYellowHighlight, // Purple border color
                          width: 1,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,  // Centers the content horizontally
                        children: [
                          Icon(Icons.calendar_today, size: 12, color: Colors.black),
                          const SizedBox(width: 4),
                          Text(
                            date,
                            style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8),
                    // "See Details" Text
                    GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CourseDetailPage(
                          title: course.title,
                          imagePath: course.imagePath,
                          status: course.status,
                          duration: course.duration,
                          progress: course.progress,
                          course: course,
                          location: "Monastir",  // You can change this location if needed
                        )));
                      },
                      child: Text(
                        "Voir les détails",
                        style: TextStyle(
                          color: Color(0xFF8A2BE2),  // Purple color for the text
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // Star ratings for non-upcoming (Tous les Cours)
            if (!isUpcoming) ...[
              const SizedBox(height: 4),
              Row(
                children: List.generate(5, (index) {
                  return Icon(
                    Icons.star,
                    size: 12,
                    color: index < 4 ? Colors.orange : Colors.grey[300],
                  );
                }),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        width: 250,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF8A2BE2), Color(0xFF8A2BE2)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                border: Border(bottom: BorderSide(color: Colors.white.withOpacity(0.3), width: 1)),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Colors.grey[550],
                    backgroundImage: AssetImage('assets/avarrrr.png'),
                  ),

                  const SizedBox(width: 12),
                  const Expanded(
                    child: Text(
                      "Salut Meriam!",
                      style: TextStyle(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
            ),
            _buildDrawerItem(Icons.book, "Mes Cours", onTap: () {
              Get.toNamed('/my-courses');
            }),
            _buildDrawerItem(Icons.favorite, "Favoris", onTap: () {
              Get.toNamed('/wishlist');
            }),
            _buildDrawerItem(Icons.settings, "Historique", onTap: () {}),
            _buildDrawerItem(Icons.logout, "Se déconnecter", onTap: () {
              Get.find<AuthController>().logout();
            }),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawerItem(IconData icon, String title, {VoidCallback? onTap}) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}






