import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_test/pages/login_page.dart'; // Your LoginPage import
 // Import AccueilPage here

class SignupController extends GetxController {
  var usernameController = TextEditingController();
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();
  var isLoading = false.obs;

  void signup() {
    String username = usernameController.text.trim();
    String email = emailController.text.trim();
    String password = passwordController.text.trim();
    String confirmPassword = confirmPasswordController.text.trim();

    // Check for empty fields
    if (username.isEmpty || email.isEmpty || password.isEmpty || confirmPassword.isEmpty) {
      Get.snackbar("Error", "Please fill all fields",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    // Check if passwords match
    if (password != confirmPassword) {
      Get.snackbar("Error", "Passwords do not match",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red, colorText: Colors.white);
      return;
    }

    isLoading.value = true;

    // Simulating a successful signup after a delay
    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;

      Get.snackbar("Success", "Signup Successful",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green, colorText: Colors.white);

      // Navigate to LoginPage after successful signup
      Get.offAll(() => LoginPage());  // Ensure LoginPage is correctly imported
      // Uncomment this line if you want to navigate to AccueilPage instead
      // Get.offAll(() => const AccueilPage());  // Uncomment if you want to redirect to AccueilPage
    });
  }
}

