import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:myapp_test/data/Controllers/login_controller.dart';
import '../reset_password_page.dart';
import 'signup_page.dart';
import 'formateur_login_page.dart'; // 👈 Import de la page de login pour formateurs

class LoginPage extends StatelessWidget {
  // Injection du contrôleur avec GetX
  final LoginController controller = Get.put(LoginController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SingleChildScrollView(
        child: Align(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 600,
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
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
                    'Bonjour, Bienvenue !',
                    style: TextStyle(fontSize: 16, color: Color(0xFF882BD0)),
                  ),
                  const SizedBox(height: 30),

                  // Champ Email
                  TextField(
                    controller: controller.emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Champ Mot de passe
                  TextField(
                    obscureText: true,
                    controller: controller.passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Mot de passe',
                      border: UnderlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Lien mot de passe oublié
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        Get.to(() => ResetPasswordPage());
                      },
                      child: const Text('Oublié ton mot de passe?'),
                    ),
                  ),
                  const SizedBox(height: 20),

                  // Bouton Connexion
                  Obx(() => SizedBox(
                    width: double.infinity,
                    height: 50,
                    child: ElevatedButton(
                      onPressed: controller.isLoading.value
                          ? null
                          : controller.login,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF882BD0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: controller.isLoading.value
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                        'Connecter',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  )),
                  const SizedBox(height: 20),

                  // Lien vers inscription
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      const Text("Vous n'avez pas de compte ?"),
                      TextButton(
                        onPressed: () {
                          Get.to(SignupPage());
                        },
                        child: const Text(
                          'S’inscrire',
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 10),

                  // 🔥 Bouton pour se connecter en tant que formateur
                  TextButton(
                    onPressed: () {
                      Get.to(() => FormateurLoginPage());
                    },
                    child: const Text(
                      'Se connecter en tant que formateur',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF882BD0),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}



