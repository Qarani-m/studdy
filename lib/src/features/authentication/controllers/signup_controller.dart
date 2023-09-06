// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studdy/src/features/authentication/screens/login.dart';
import 'package:studdy/src/repository/auth_repo/auth_repo.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  RxBool obscureText = true.obs;
  RxBool isAuthenticating = false.obs;
  var email = "";
  var password = "";
  var name = "";
  var phone = "";

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }
  void goToLoginPage() {
    Get.to(const Login(),
        transition: Transition.cupertinoDialog,
        duration: const Duration(milliseconds: 400));
  }

  void signupAction() {
    email = emailController.text;
    password = passwordController.text;
    AuthRepo.instance.createUser(email, password);
  }
}
