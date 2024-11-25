import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../shared/controllers/user_controller.dart';
import '../app_pages.dart';

class AuthMiddleware extends GetMiddleware {
  @override
  RouteSettings? redirect(String? route) {
    final userController = Get.find<UserController>();
    if (!userController.isLoggedIn.value) {
      Get.snackbar("Message", "ABCD");
    }
    return userController.isLoggedIn.value
        ? null
        : const RouteSettings(name: AppPages.PHONE_AUTH);
  }
}
