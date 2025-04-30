import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FormateurSignupController extends GetxController {
  final nomController = TextEditingController();
  final emailController = TextEditingController();
  final specialiteController = TextEditingController();
  final experienceController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();

  var isLoading = false.obs;

  void signup() async {
    if (passwordController.text != confirmPasswordController.text) {
      Get.snackbar("Erreur", "Les mots de passe ne correspondent pas.",
          snackPosition: SnackPosition.BOTTOM);
      return;
    }

    isLoading.value = true;

    try {
      // Simuler un délai de traitement (ex. appel à une API)
      await Future.delayed(Duration(seconds: 2));

      // Ici tu peux appeler ton API ou service pour enregistrer le formateur
      // Par exemple : await AuthService.signupFormateur(...)

      Get.snackbar("Succès", "Inscription réussie !",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.greenAccent);

      // Redirige vers la page de connexion formateur
      // Get.to(() => FormateurLoginPage());

    } catch (e) {
      Get.snackbar("Erreur", "Une erreur est survenue : $e",
          snackPosition: SnackPosition.BOTTOM, backgroundColor: Colors.redAccent);
    } finally {
      isLoading.value = false;
    }
  }

  @override
  void onClose() {
    nomController.dispose();
    emailController.dispose();
    specialiteController.dispose();
    experienceController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.onClose();
  }
}
