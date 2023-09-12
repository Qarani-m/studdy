import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studdy/src/features/authentication/repository/auth_helper.dart';
import 'package:studdy/src/features/authentication/repository/exceptions/login_exception.dart';
import 'package:studdy/src/features/authentication/screens/forgot_password.dart';
import 'package:studdy/src/features/authentication/screens/register.dart';

class LoginController extends GetxController{
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    RxBool passwordVisible = false.obs;
    RxBool isAuthenticating =false.obs;
    var password = "";
    var email = "";

  void goRegister(){
    Get.to(
      const Register(),
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 400)
    );
  }


  void loginAction() async{
    email = "emqarani39l@gmail.com";
    password = "Somepassword";
    // email = emailController.text;
    // password = passwordController.text;
    isAuthenticating.value=true;
    try{
    await AuthHelper.instance.loginUser(email, password,);
    }catch(e){
      const LoginFailure();
      isAuthenticating.value=false;
    }
  }
  void resetPassword(){
    Get.to(
      const ForgotPassword(),
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 400)
    );
  }
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }

}