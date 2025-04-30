import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'login_page.dart';

class OnboardingPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
            child: Center(
              child: Image.asset(
                'assets/mimi.png',
                width: MediaQuery.of(context).size.width * 0.8, // Image responsive
                height: MediaQuery.of(context).size.height * 0.4,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text(
              "Évoluez professionnellement grâce à des formations adaptées à vos besoins !",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20, // Texte légèrement plus grand
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
          ),
          SizedBox(height: 25),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0xFF882BD0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              padding: EdgeInsets.symmetric(horizontal: 60, vertical: 18),
            ),
            onPressed: () {
              Get.to(LoginPage());
            },
            child: Text(
              "Commencer",
              style: TextStyle(fontSize: 18, color: Colors.white),
            ),
          ),
          SizedBox(height: 50),
        ],
      ),
    );
  }
}
