import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp_test/utils/appConstants.dart';

import '../data/Controllers/AuthController.dart'; // Make sure the constants file is imported

class SplashScreenPage extends StatefulWidget {
  @override
  _SplashScreenPageState createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  @override
  void initState() {
    super.initState();

    // Call the testStorage function to manually test GetStorage functionality
    testStorage();

    // Wait for 3 seconds and then check user login status
    Future.delayed(Duration(seconds: 3), () async {
      print("Calling AuthController.goto() from SplashScreenPage");
      await Get.find<AuthController>().goto(); // Check login status and redirect
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF882BD0),
      body: Center(
        child: Image.asset(
          'assets/dest.png', // Ensure this image exists
          width: 500,
          height: 500,
        ),
      ),
    );
  }

  // Testing function to save and read data from GetStorage
  void testStorage() async {
    final box = GetStorage();

    // Save data manually to test
    await box.write(AppConstants.TOKEN, 'test-token');
    await box.write(AppConstants.UserData, {'id': 1,
    'name': 'Test User',
    'email': 'test@example.com',  // Adding email field
    'role': 'admin',  });

    // Read the data and print
    print('Test Token: ${box.read(AppConstants.TOKEN)}');
    print('Test User Data: ${box.read(AppConstants.UserData)}');
  }
}





