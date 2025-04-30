import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar.dart';
import 'package:myapp_test/utils/appColors.dart';

void showCustomSnackBar(
    String? message, {
       mode = "error",
      String title = "",
      Function(GetSnackBar)? onClick,
    }) {
  if (Get.isSnackbarOpen == true) {
    return;
  } else {
    Get.snackbar(
      title,
      "",
      margin: const EdgeInsets.only(top: 10, right: 10, left: 10),
      duration: mode == "error"
          ? const Duration(seconds: 7)
          : Duration(
          milliseconds:
          (message!.length * 33 < 5000) ? 5000 : message.length * 33),
      onTap: onClick,
      dismissDirection: Platform.isAndroid
          ? DismissDirection.horizontal
          : DismissDirection.vertical,
      borderColor: Appcolors.grey3,
      borderWidth: 1,
      isDismissible: true,
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 24),
      titleText: Text(
        mode == "error"
            ? "Erreur"
            : mode == "success"
            ? "Succès"
            : title,

      ),
      messageText: Text(
        message!,
      ),
      colorText: Appcolors.black3,
      snackPosition: SnackPosition.TOP,
      backgroundColor: Appcolors.white,
      borderRadius: 10,
      icon: Icon(
        mode == "error"
            ? Icons.cancel
            : mode == "success"
            ? Icons.check_circle
            : Icons.error,
        color: mode == "error"
            ? Appcolors.red2
            : mode == "success"
            ? Appcolors.green4
            : Appcolors.purple7,
        size: 45,
      ),
    );
  }
}
