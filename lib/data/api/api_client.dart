//centralizes all the logic for making HTTP requests,
//no need to write HTTP request code multiple times
//pas besoin de refaire un login à chaque fois que l'utilisateur lance l'application.

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart' show GetStorage; //permet de stocker des données localement sur l'appareil,
import 'package:http/http.dart' as http; //pour faire des requêtes HTTP (GET, POST)
import 'package:myapp_test/base/customSnakBar.dart'; //référence à un widget personnalisé
import 'package:myapp_test/pages/login_page.dart';
import 'package:myapp_test/utils/appConstants.dart';
import '../Controllers/AuthController.dart';//Contient les constantes utilisées dans l'application (par exemple, URLs d'API


class ApiClient extends GetConnect implements GetxService { // utilisée pour gérer les requêtes API dans l'application
  late String token;
  final Map<String, dynamic> queryParameters = {};
  final String appBaseUrl;
  late Map<String, String> mainHeaders;
  final box = GetStorage();  //stocker les données d une facon rapide

  ApiClient({required this.appBaseUrl, required String baseUrl}) {
    baseUrl = appBaseUrl;  // defines url de base pour les requetes api
    timeout = const Duration(seconds: 60);  //delai d'attente pour les requetes
    token = box.read(AppConstants.TOKEN) ?? "";
    mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }
// met à jour les en-têtes de la requête avec un nouveau token au cas de changement
  void updateHeader(String token) {
    mainHeaders = {
      'Content-type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };
  }

  Future<Response> getData(String uri, {Map<String, String>? headers}) async {
    bool resendRequest = false;
    try {
      Response response =
      await get(uri, headers: headers ?? mainHeaders).then((value) async {
        resendRequest = await handleResponse(value, uri);

        return value;
      });
      if (resendRequest) {
        response =
        await get(uri, headers: headers ?? mainHeaders).then((value) async {
          resendRequest = await handleResponse(value, uri);

          return value;
        });
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getDataWithParms(String uri,
      {Map<String, String>? headers,
        required Map<String, dynamic> query}) async {
    bool resendRequest = false;

    try {
      Response response =
      await get(uri, headers: headers ?? mainHeaders, query: query)
          .then((value) async {
        resendRequest = await handleResponse(value, uri);
        return value;
      });
      if (resendRequest) {
        response = await get(uri, headers: headers ?? mainHeaders, query: query)
            .then((value) async {
          resendRequest = await handleResponse(value, uri);
          return value;
        });
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> getDataWithParams(String uri,
      {Map<String, String>? headers,
        required Map<String, dynamic> queryParameters}) async {
    bool resendRequest = false;

    try {
      Response response = await get(uri,
          headers: headers ?? mainHeaders, query: queryParameters)
          .then((value) async {
        resendRequest = await handleResponse(value, uri);
        return value;
      });
      if (resendRequest) {
        response = await get(uri,
            headers: headers ?? mainHeaders, query: queryParameters)
            .then((value) async {
          resendRequest = await handleResponse(value, uri);
          return value;
        });
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }

  Future<Response> postData(String uri, dynamic body) async {
    bool resendRequest = false;

    try {
      Response response =
      await post(uri, body, headers: mainHeaders).then((value) async {
        resendRequest = await handleResponse(value, uri);
        return value;
      });
      if (resendRequest) {
        response =
        await post(uri, body, headers: mainHeaders).then((value) async {
          resendRequest = await handleResponse(value, uri);
          return value;
        });
      }
      return response;
    } catch (e) {
      return Response(statusCode: 1, statusText: e.toString());
    }
  }


//Cette méthode gère la réponse de l'API
  ///returns true if the user is not connected and has reconnected using biometric auth (if available)
  Future<bool> handleResponse(Response<dynamic> res, String uri) async {
    if (authUri(uri)) {
      if (res.statusCode == 503) {
        // Maintenance().maintenancePopUp();
        return false;
      } else if (res.statusCode == 401) {
        AuthController authCtrl = Get.find<AuthController>();
        showCustomSnackBar('Votre session a expiré, Veuillez vous reconnecter.',
            title: 'Session expirée');
        print('Votre session a expiré, Veuillez vous reconnecter.');
        authCtrl.clearSharedData();
        Get.offAll(LoginPage());
        return false;
        /*}*/
      }
      if (res.statusCode == 406 || res.statusCode == 412) {
        return false;
      } else if (res.statusCode != 200 && res.statusCode != 201) {
        showCustomSnackBar('erreur survenu réessayer');
        return false;
      }
    }
    return false;
  }

  bool authUri(String uri) {
    List<String> urls = [
      AppConstants.REGISTRATION_URI,
      AppConstants.CHECK_USER_EXIST_URI,
      AppConstants.LOGIN_URI,
      AppConstants.FORGET_PASSWORD,
      AppConstants.USER_INFO_URI
    ];
    return !urls.contains(uri);
  }
}