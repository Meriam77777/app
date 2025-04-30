import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:myapp_test/data/api/api_client.dart';
import 'package:myapp_test/utils/appConstants.dart';

class AuthRepo {
  final ApiClient apiClient;
  final box = GetStorage();

  AuthRepo({required this.apiClient});

  Future<Response> registration(Map data, String deviceID) async {
    return await apiClient.postData(AppConstants.REGISTRATION_URI, data);
  }

  Future<Response> login(Map body) async {
    print(body);
    return await apiClient.postData(AppConstants.LOGIN_URI, body);
  }

  Future<void> logout () async {
    await apiClient.postData(AppConstants.LOGOUT_URI, {});
  }

  Future<Response> forgetPassword(String email) async {
    return await apiClient
        .postData(AppConstants.FORGET_PASSWORD, {"email": email});
  }

  Future<Response> myProfile() async {
    return await apiClient.getData(AppConstants.MY_PROFILE);
  }

  void saveUserToken(String token) {
    apiClient.token = token;
    apiClient.updateHeader(token);
    box.write(AppConstants.TOKEN, token);
    print(' Token written to GetStorage: $token');
  }

  void saveUserData(userData) {
    box.write(AppConstants.UserData, userData);
    print(' User data written to GetStorage: $userData');
  }

  Future getUserData() async {
    return await box.read(AppConstants.UserData) ?? "NONE";
  }

  Future<String?> getUserToken() async {
    return box.read(AppConstants.TOKEN); // returns null if token is not saved
  }

  bool userLoggedIn() {
    return box.hasData(AppConstants.TOKEN) && box.read(AppConstants.TOKEN) != null;
  }

  Future<void> saveUSereEmailAndPassword(String email, String password) async {
    try {
      await box.write(AppConstants.EMAIL, email);
      await box.write(AppConstants.PASSWORD, password);
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> clearSharedData() async {
    String? email = box.read(AppConstants.EMAIL);
    String? password = box.read(AppConstants.PASSWORD);
    box.erase();
    box.write(AppConstants.EMAIL, email);
    box.write(AppConstants.PASSWORD, password);
    apiClient.token = '';
    apiClient.updateHeader("");

    return true;
  }
}

