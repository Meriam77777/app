import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'package:myapp_test/data/api/api_client.dart';
import 'package:myapp_test/data/repo/auth_repo.dart';
import 'package:myapp_test/screens/splash_screen.dart';
import 'package:myapp_test/pages/FeedbackPage.dart';
import 'package:myapp_test/pages/my_course_list.dart';
import 'package:myapp_test/screens/wishlist_screen.dart';
import 'package:myapp_test/utils/appConstants.dart';
import 'data/Controllers/AuthController.dart';

/// 🌟 Fonction de test pour simuler un utilisateur déjà connecté
Future<void> testFakeLogin() async {
  final box = GetStorage();

  await box.write(AppConstants.TOKEN, 'test-token');
  await box.write(AppConstants.UserData, {
    'id': 1,
    'name': 'Test User',
    'email': 'test@example.com',
    'role': 'admin',
  });

  print('✅ Fake login data written to storage');
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Initialiser GetStorage
  await GetStorage.init();

  // Injection des dépendances
  final apiClient = ApiClient(baseUrl: AppConstants.BASE_URL, appBaseUrl: '');
  Get.put(AuthRepo(apiClient: apiClient));
  Get.put(AuthController(authRepo: Get.find<AuthRepo>()));

  // Simuler un utilisateur connecté (à commenter après tests)
  await testFakeLogin();

  // Lancer l'application
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreenPage(), // La page de démarrage
      getPages: [
        GetPage(name: '/feedback', page: () => FeedbackPage()),
        GetPage(name: '/my-courses', page: () => MyCourseList()),
        GetPage(name: '/wishlist', page: () => WishlistScreen()),
      ],
    );
  }
}





