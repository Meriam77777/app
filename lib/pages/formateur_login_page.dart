import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_test/data/Controllers/formateur_login_controller.dart'; // Import the controller
import 'package:myapp_test/pages/formateur_home_page.dart';

import 'formateur_signup_page.dart'; // Make sure this path is correct

class FormateurLoginPage extends StatelessWidget {
  // Initialize the controller
  final FormateurLoginController controller = Get.put(FormateurLoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 600,
              ),
              child: Column(
                children: [
                  const SizedBox(height: 40),
                  const Text(
                    'Se connecter',
                    style: TextStyle(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF882BD0),
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Bienvenue cher Formateur  !',
                    style: TextStyle(fontSize: 16, color: Color(0xFF882BD0)),
                  ),
                  const SizedBox(height: 40),

                  // Email field
                  TextField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Password field
                  TextField(
                    controller: controller.passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Mot de passe',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 30),

                  // Login button with loading state
                  Obx(() => SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value ? null : controller.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF882BD0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        'Connexion',
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  )),
                  const SizedBox(height: 15),

                  // Forgot password link
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Add reset password logic here
                      },
                      child: const Text('Oublié ton mot de passe?'),
                    ),
                  ),

                  const SizedBox(height: 10),

                  // Signup link
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("Vous n'avez pas de compte ? "),
                      GestureDetector(
                        onTap: () {
                          Get.to(() => FormateurSignupPage()); // This line navigates
                        },
                        child: const Text(
                          "S'inscrire",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                            color: Colors.deepPurple,
                          ),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

