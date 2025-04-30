// controllers/user_controller.dart
import 'package:get/get.dart';
import 'package:myapp_test/models/user.dart';

class UserController extends GetxController {
  var user = User(id: 0, name: '', email: '').obs;  // L'utilisateur est réactif avec `.obs`

  // Méthode pour définir un utilisateur
  void setUser(User newUser) {
    user.value = newUser;  // Met à jour l'utilisateur
  }

  // Méthode pour obtenir l'utilisateur
  User get getUser => user.value;

  // Méthode pour réinitialiser l'utilisateur
  void clearUser() {
    user.value = User(id: 0, name: '', email: '');  // Réinitialise l'utilisateur à un état vide
  }
}

