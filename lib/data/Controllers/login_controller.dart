import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_test/pages/accueil_page.dart'; // Make sure this path is correct

class LoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;

  // Handle login functionality
  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red[900], colorText: Colors.white);
      return;
    }

    isLoading.value = true;

    // Simulate a login API request
    await Future.delayed(const Duration(seconds: 2));

    // After successful login, navigate to the next page
    Get.snackbar("Success", "Login successful!",
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green[600], colorText: Colors.white);

    // Redirect to AccueilPage (HomePage)
    Get.offAll(() => AccueilPage()); // Navigate to AccueilPage
  }
}





