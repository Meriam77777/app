import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: Colors.purple,
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.purple),
              child: Text(
                "Salut Meriam!",
                style: TextStyle(fontSize: 20, color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
            drawerItem(Icons.home, "Profil", () {}),
            drawerItem(Icons.book, "Mes Cours", () {
              Get.toNamed('/my-courses');
            }),
            drawerItem(Icons.favorite, "Favoris", () {}),
            drawerItem(Icons.settings, "Paramètres", () {}),
            drawerItem(Icons.help, "Aide", () {}),
          ],
        ),
      ),
    );
  }

  Widget drawerItem(IconData icon, String title, VoidCallback onTap) {
    return ListTile(
      leading: Icon(icon, color: Colors.white),
      title: Text(title, style: TextStyle(color: Colors.white)),
      onTap: onTap,
    );
  }
}
