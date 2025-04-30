import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp_test/base/customSnakBar.dart';
import 'package:myapp_test/utils/appConstants.dart';
import '../../models/user.dart';
import '../../pages/accueil_page.dart';
import '../../pages/login_page.dart';
import '../repo/auth_repo.dart';

class AuthController extends GetxController implements GetxService {
  final AuthRepo authRepo;
  final box = GetStorage();

  User? _userModel;
  bool isReauthenticating = false;
  User? get userModel => _userModel;

  late GlobalKey<FormState> signUpEmailKey;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  bool waiting = false;
  bool _isLoading = false;

  AuthController({required this.authRepo});

  @override
  void onInit() {
    super.onInit();
    emailController.text = getSavedEmail() ?? '';
    signUpEmailKey = GlobalKey<FormState>(debugLabel: 'signUpEmailKey');
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }

  bool get isLoading => _isLoading;
  set loading(bool isLoading) {
    _isLoading = isLoading;
    update();
  }

  Future<void> login(BuildContext context, GlobalKey<FormState> loginKey) async {
    try {
      waiting = true;
      update();

      if (!loginKey.currentState!.validate()) {
        print('Login form validation failed.');
        waiting = false;
        update();
        return;
      }

      final body = {
        "email": emailController.text.trim(),
        "password": passwordController.text,
      };

      final response = await authRepo.login(body);
      print('Login response: ${response.statusCode}, ${response.body}');

      if (response.statusCode == 200) {
        final token = response.body['token'];
        final userData = response.body['user'];

        if (token != null && userData != null) {
          // Save token and user data using AppConstants
          box.write(AppConstants.TOKEN, token);
          box.write(AppConstants.UserData, userData);

          // Log to verify the data is being stored
          print('Token saved: ${box.read(AppConstants.TOKEN)}');
          print('User data saved: ${box.read(AppConstants.UserData)}');

          // Navigate to the home page
          Get.offAll(() => AccueilPage());
        } else {
          showCustomSnackBar("Échec de la connexion. Données manquantes.");
        }
      } else {
        showCustomSnackBar("Erreur de connexion.");
      }
    } catch (e) {
      print(' Login error: $e');
      showCustomSnackBar("Erreur inattendue.");
    } finally {
      waiting = false;
      _isLoading = false;
      update();
    }
  }

  Future<void> goto() async {
    final token = box.read(AppConstants.TOKEN);
    final userData = box.read(AppConstants.UserData);

    print(' Token in storage: $token');
    print('User data in storage: $userData');


    if (userLoggedIn()) {
      print(' User is logged in');
      await getSavedUserData();
      Get.offAll(() => AccueilPage());
    } else {
      print(' User is not logged in');
      Get.offAll(() => LoginPage());
    }
  }

  bool userLoggedIn() {
    final hasToken = box.hasData(AppConstants.TOKEN);
    final hasUser = box.hasData(AppConstants.UserData);
    final validToken = box.read(AppConstants.TOKEN) != null;
    final validUser = box.read(AppConstants.UserData) != null;

    final loggedIn = hasToken && hasUser && validToken && validUser;
    print('User logged in: $loggedIn');
    return loggedIn;
  }

  Future<void> getSavedUserData() async {
    final savedData = await authRepo.getUserData();
    if (savedData != "NONE") {
      _userModel = User.fromJson(savedData);
      print('User data retrieved: ${_userModel?.name}, ${_userModel?.email}');

    }
  }

  String? getSavedEmail() {
    return box.read(AppConstants.EMAIL);
  }

  Future<void> logout() async {
    await authRepo.logout();
    await clearSharedData();
    Get.offAll(() => LoginPage());
  }

  Future<void> saveUserEmailAndPassword(String email, String password) async {
    await authRepo.saveUSereEmailAndPassword(email, password);
  }

  Future<bool> clearSharedData() async {
    return await authRepo.clearSharedData();
  }
}


