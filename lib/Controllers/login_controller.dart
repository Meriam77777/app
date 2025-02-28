import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var emailController = TextEditingController();   //declaration des variables
  var passwordController = TextEditingController();
  var isLoading = false.obs;

  void login() {
    String email = emailController.text.trim();  // trim removes extra space in the input
    String password = passwordController.text.trim();

    if (email.isEmpty || password.isEmpty) {
      Get.snackbar("Error", "Please fill all fields",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.red[900], colorText: Colors.white);
      return;
    }

    isLoading.value = true;

    Future.delayed(const Duration(seconds: 2), () {
      isLoading.value = false;
      Get.snackbar("Success", "Login Successful",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.green[600], colorText: Colors.white);
    });
  }
}
