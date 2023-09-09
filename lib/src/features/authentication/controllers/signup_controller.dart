// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studdy/src/features/authentication/screens/login.dart';
import 'package:studdy/src/features/home/controller/home_controller.dart';
import 'package:studdy/src/features/home/model/student_model.dart';
import 'package:studdy/src/features/home/repository/user_dbhelper.dart';
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

  void signupAction() async{
    email = emailController.text;
    password = passwordController.text;
    name = nameController.text;
    phone= phoneController.text;
    isAuthenticating.value=true;
    await AuthRepo.instance.createUser(email, password,name, phone);
    // put user in database
    
      // await UserDbHelper.insert(student);
      // homeController.getUser();
      



  }
}
