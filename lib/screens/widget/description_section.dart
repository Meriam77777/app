import 'package:flutter/material.dart';

class DescriptionSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final infoTextSize = screenWidth < 360 ? 10.0 : 12.0;

    return Container(
      padding: const EdgeInsets.fromLTRB(12, 12, 16, 16),
      margin: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title
          Text(
            "Contenu du cours",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 12),

          // Info Row (always horizontal)
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: [
                _iconInfo(Icons.schedule, '16 heures', iconColor: Colors.grey, fontSize: infoTextSize),
                _verticalDivider(),
                _iconInfo(Icons.play_circle_outline, '12 Leçons', iconColor: Colors.grey, fontSize: infoTextSize ),
                _verticalDivider(),
                _iconInfo(Icons.star, '4.7', iconColor: Colors.orange, fontSize: infoTextSize),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Description
          Text(
            'This comprehensive course is designed to equip you with the skills and knowledge needed to excel in graphic design, '
                'Adobe tools, videography, and photography. Whether you’re a beginner or looking to enhance your existing skills, '
                'this course offers a well-rounded education in the creative arts.',
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
    );
  }

  Widget _iconInfo(IconData icon, String text, {Color iconColor = Colors.black, double fontSize = 12.0}) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(icon, size: 18, color: iconColor),
        const SizedBox(width: 6),
        Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget _verticalDivider() {
    return Container(
      height: 20,
      width: 1.5,
      color: Colors.grey[300],
      margin: const EdgeInsets.symmetric(horizontal: 12),
    );
  }
}
