import 'package:flutter/material.dart';
import 'package:myapp_test/screens/widget/description_section.dart';
import 'package:myapp_test/screens/widget/videos_section.dart';

class AllCoursesScreen extends StatefulWidget {
  final String courseName;

  const AllCoursesScreen(this.courseName, {super.key});

  @override
  State<AllCoursesScreen> createState() => _AllCoursesScreenState();
}

class _AllCoursesScreenState extends State<AllCoursesScreen> {
  bool isVideosSection = true;
  bool isFavorite = false;

  String getImageForCourse(String courseName) {
    switch (courseName) {
      case "Creative Art Design":
        return "assets/immmm.png";
      case "Marketing":
        return "assets/mark.png";
      case "Management d'équipe":
        return "assets/manag.png";
      case "Machine Learning":
        return "assets/machine.png";
      default:
        return "assets/default.png";
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final String imagePath = getImageForCourse(widget.courseName);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 10),
            child: Icon(
              Icons.notifications,
              size: 20,
                color: Colors.black
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Top image
            Container(
              width: double.infinity,
              height: screenWidth < 600 ? 200 : 300,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              child: Center(
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.transparent,
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Title + Heart icon
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${widget.courseName} Complete Course",
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,

                      letterSpacing: 0.2,
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(
                    isFavorite ? Icons.favorite : Icons.favorite_border,
                    color: Colors.red,
                    size: 22,
                  ),
                  onPressed: () {
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                ),
              ],
            ),

            const SizedBox(height: 4),

            // Instructor and Language under it
            Padding(
              padding: const EdgeInsets.only(left: 10.0), // Shift to the right
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      const Icon(Icons.person, size: 14, color: Colors.grey),
                      const SizedBox(width: 4),
                      Text(
                        "Emily Claire",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                          color: Colors.black.withOpacity(0.5),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: const [
                      Icon(Icons.language, size: 14, color: Colors.grey),
                      SizedBox(width: 4),
                      Text(
                        "English",
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.2,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 12),

            // Slightly higher buttons
            Container(
              padding: const EdgeInsets.symmetric(vertical: 6, horizontal: 6),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildToggleButton("Videos", isVideosSection, () {
                    setState(() => isVideosSection = true);
                  }),
                  _buildToggleButton("Description", !isVideosSection, () {
                    setState(() => isVideosSection = false);
                  }),
                ],
              ),
            ),
            const SizedBox(height: 14),

            // Content
            isVideosSection ? VideoSection() : DescriptionSection(),
          ],
        ),
      ),
    );
  }

  Widget _buildToggleButton(String title, bool isActive, VoidCallback onTap) {
    return Material(
      color: isActive ? const Color(0xFF8A2BE2) : const Color(0xFF8A2BE2).withOpacity(0.5),
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 9, horizontal: 20),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
      ),
    );
  }
}


