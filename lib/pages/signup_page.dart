import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_test/data/Controllers/sigup_controller.dart';
import 'login_page.dart';
import 'formateur_signup_page.dart'; // 👈 Ajout pour formateur

class SignupPage extends StatelessWidget {
  final SignupController controller = Get.put(SignupController());

  // Contrôle de l’acceptation des conditions
  final RxBool isTermsAccepted = false.obs;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                Text(
                  "S’inscrire",
                  style: TextStyle(
                    fontSize: 35,
                    fontWeight: FontWeight.w800,
                    color: Color(0xFF882BD0),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Créer un compte",
                  style: TextStyle(fontSize: 16, color: Color(0xFF882BD0)),
                ),
                SizedBox(height: 30),

                // Nom
                TextField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(labelText: "Nom"),
                ),

                // Email
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),

                // Mot de passe
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Mot de passe"),
                ),

                // Confirmation mot de passe
                TextField(
                  controller: controller.confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Confirmez mot de passe"),
                ),
                SizedBox(height: 20),

                // Conditions d'utilisation
                Obx(() => Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Checkbox(
                      value: isTermsAccepted.value,
                      onChanged: (value) {
                        isTermsAccepted.value = value!;
                      },
                    ),
                    Flexible(
                      child: Text(
                        "J'accepte les conditions d'utilisation",
                        style: TextStyle(fontSize: 12),
                      ),
                    ),
                  ],
                )),

                SizedBox(height: 20),

                // Bouton S’inscrire
                Obx(() => ElevatedButton(
                  onPressed: controller.isLoading.value || !isTermsAccepted.value
                      ? null
                      : controller.signup,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF882BD0),
                    foregroundColor: Colors.white,
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  child: controller.isLoading.value
                      ? CircularProgressIndicator(color: Colors.white)
                      : Text("S'inscrire"),
                )),

                SizedBox(height: 10),

                // Lien vers la page de login
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Vous avez déjà un compte ? "),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => LoginPage());
                      },
                      child: Text(
                        "Se connecter",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 10),

                // 🔥 Bouton pour s’inscrire comme formateur
                TextButton(
                  onPressed: () {
                    Get.to(() => FormateurSignupPage());
                  },
                  child: const Text(
                    'S’inscrire en tant que formateur',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF882BD0),
                    ),
                  ),
                ),

                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

