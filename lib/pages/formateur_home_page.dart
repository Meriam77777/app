import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_test/pages/voir_avis_page.dart';
import 'proposer_formation_page.dart';
import '../data/Controllers/AuthController.dart';

class FormateurHomePage extends StatelessWidget {
  final Color purpleDark = const Color(0xFF8A2BE2);
  final Color purpleLight = const Color(0xffa86de8);
  final Color orange = const Color(0xFFE1673D);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [Color(0xFF8A2BE2), Color(0xFF8A2BE2)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.transparent,
                ),
                child: Row(
                  children: [
                    // Avatar circulaire
                    CircleAvatar(
                      radius: 30,

                      backgroundImage: AssetImage('assets/avarrrr.png'),
                    ),
                    SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        "Salut Formateur",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              ListTile(
                leading: const Icon(Icons.logout, color: Colors.white),
                title: const Text(
                  "Se déconnecter",
                  style: TextStyle(color: Colors.white),
                ),
                onTap: () {
                  Get.find<AuthController>().logout();
                },
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: const [
            Text(
              "Espace Formateur",
              style: TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(width: 10),
            Icon(Icons.notifications_none, color: Colors.black, size: 22),
          ],
        ),
        iconTheme: IconThemeData(color: purpleDark),
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final isSmallScreen = MediaQuery.of(context).size.width < 500;
          final double spacing = 15;
          final double cardHeight = isSmallScreen ? 220 : 250;

          return SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Divider(height: 1, thickness: 1, color: Colors.grey),
                SizedBox(height: constraints.maxHeight * 0.1),

                // Carte : Proposer une formation
                _buildCard(
                  context: context,
                  color: Color(0xFF8A2BE2),
                  icon: Icons.edit_note,
                  text: "Proposer une Formation",
                  height: cardHeight,
                  onTap: () {
                    Get.to(() => ProposerFormationPage());
                  },
                ),
                const SizedBox(height: 20),

                // Carte : Mes Formations
                _buildCard(
                  context: context,
                  color: orange,
                  icon: Icons.reviews,
                  text: "Mes Formations",
                  height: cardHeight,
                  onTap: () {
                    Get.to(() => VoirAvisPage());
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _buildCard({
    required BuildContext context,
    required Color color,
    required IconData icon,
    required String text,
    required VoidCallback onTap,
    required double height,
  }) {
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = screenWidth * 0.9;

    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: cardWidth,
        height: height,
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
        decoration: BoxDecoration(
          color: color.withOpacity(0.2),
          borderRadius: BorderRadius.circular(20),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: color.withOpacity(0.5),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: Colors.white, size: 22),
            ),
            const SizedBox(height: 12),
            Text(
              text,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: screenWidth < 400 ? 14 : 17,
                fontWeight: FontWeight.w600,
                color: color,
              ),
            ),
          ],
        ),
      ),
    );
  }
}






