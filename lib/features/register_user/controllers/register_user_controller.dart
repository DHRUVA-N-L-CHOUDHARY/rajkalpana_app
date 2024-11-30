import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:raj_kalpana_travels/routes/app_pages.dart';

class RegisterUserController extends GetxController {
  // Form Key
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  final RxBool isPasswordVisible = false.obs;
  final RxBool isConfirmPasswordVisible = false.obs;

  void togglePasswordVisibility() {
    isPasswordVisible.value = !isPasswordVisible.value;
  }

  void toggleConfirmPasswordVisibility() {
    isConfirmPasswordVisible.value = !isConfirmPasswordVisible.value;
  }

  // Controllers
  final TextEditingController nameController = TextEditingController();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController dobController = TextEditingController();

  // Gender selection
  String gender = 'Male';

  void updateGender(String selectedGender) {
    gender = selectedGender;
    update();
  }

  // Reactive error messages
  RxString nameError = ''.obs;
  RxString lastNameError = ''.obs;
  RxString emailError = ''.obs;
  RxString passwordError = ''.obs;
  RxString confirmPasswordError = ''.obs;
  RxString dobError = ''.obs;

  // Validation methods
  void validateName(String value) {
    if (value.trim().length < 3) {
      nameError.value = "At least 3 characters required";
    } else {
      nameError.value = '';
    }
  }

  void validateEmail(String value) {
    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+$').hasMatch(value)) {
      emailError.value = "Enter a valid email address";
    } else {
      emailError.value = '';
    }
  }

  void validatePassword(String value) {
    if (value.length < 6) {
      passwordError.value = "At least 6 characters required";
    } else {
      passwordError.value = '';
    }
  }

  void validateConfirmPassword(String value) {
    if (value != passwordController.text) {
      confirmPasswordError.value = "Passwords do not match";
    } else {
      confirmPasswordError.value = '';
    }
  }

  void validateDob(String value) {
    if (value.isEmpty) {
      dobError.value = "Date of birth is required";
    } else {
      dobError.value = '';
    }
  }

  void register() {
    if (formKey.currentState!.validate()) {
      Get.snackbar('Success', 'Registration completed successfully');
      Get.offAllNamed(AppPages.NAVIGATION);
    }
  }

  @override
  void onClose() {
    nameController.dispose();

    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    dobController.dispose();
    super.onClose();
  }
}
