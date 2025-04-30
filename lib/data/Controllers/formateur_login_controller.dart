import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_test/pages/formateur_home_page.dart'; // Make sure this path is correct

class FormateurLoginController extends GetxController {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var isLoading = false.obs;

  // Handle login functionality for formateurs
  Future<void> login() async {
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Check if the email and password fields are empty
    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill in all fields",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red[900], colorText: Colors.white);
      return;
    }

    isLoading.value = true;

    // Simulate a login API request
    await Future.delayed(const Duration(seconds: 2));

    // After successful login, show a success message
    Get.snackbar("Success", "Login successful!",
        snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green[600], colorText: Colors.white);

    // Redirect to FormateurHomePage (HomePage for formateurs)
    Get.offAll(() => FormateurHomePage()); // Navigate to FormateurHomePage
  }
}

