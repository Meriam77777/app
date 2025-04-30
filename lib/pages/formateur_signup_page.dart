import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_test/data/Controllers/formateur_signup_controller.dart';
import 'formateur_login_page.dart';

class FormateurSignupPage extends StatelessWidget {
  final FormateurSignupController controller = Get.put(FormateurSignupController());
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
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.1),

                Text(
                  "S’inscrire",
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF882BD0),
                  ),
                ),
                SizedBox(height: 5),
                Text(
                  "Créer un compte formateur",
                  style: TextStyle(fontSize: 16, color: Color(0xFF882BD0)),
                ),
                SizedBox(height: 30),

                TextField(
                  controller: controller.nomController,
                  decoration: InputDecoration(labelText: "Nom complet"),
                ),
                TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(labelText: "Email"),
                ),
                TextField(
                  controller: controller.specialiteController,
                  decoration: InputDecoration(labelText: "Spécialité"),
                ),
                TextField(
                  controller: controller.experienceController,
                  decoration: InputDecoration(labelText: "Années d'expérience"),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: controller.passwordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Mot de passe"),
                ),
                TextField(
                  controller: controller.confirmPasswordController,
                  obscureText: true,
                  decoration: InputDecoration(labelText: "Confirmer le mot de passe"),
                ),

                SizedBox(height: 20),

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
                      : Text("S’inscrire comme formateur"),
                )),

                SizedBox(height: 10),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Déjà inscrit ? "),
                    GestureDetector(
                      onTap: () {
                        Get.to(() => FormateurLoginPage());
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

                SizedBox(height: MediaQuery.of(context).size.height * 0.1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
