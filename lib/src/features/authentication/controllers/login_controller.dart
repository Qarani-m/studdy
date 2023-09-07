// ignore_for_file: avoid_print, unused_local_variable

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/authentication/screens/forgot_password.dart';
import 'package:studdy/src/features/authentication/screens/register.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool obscureText = true.obs;
  RxBool isAuthenticating= false.obs;
  var email = "";
  var password = "";

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }
  void goToRegisterPage(){
    Get.to(
      const Register(),
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 400)

    );
  }
    void goToForgotPassword(){
    Get.to(
      const ForgotPassword(),
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 400)

    );
  }

  Future<void> loginAction() async {
  email = emailController.text;
  password = passwordController.text;
  isAuthenticating.value = true;

  try {
    final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: password);
  } on FirebaseAuthException catch (e) {
    Get.showSnackbar(
      GetSnackBar(
        messageText: Center(
          child: Text(
            'Invalid password or email',
            style: TextStyle(color: Colors.white,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400
            ),
          ),
        ),
        duration: const Duration(seconds: 10),
        backgroundColor: AppColors.primaryColor.withOpacity(1),
        margin: const EdgeInsets.all(10),
        borderRadius: 50, 
        snackStyle: SnackStyle.GROUNDED,
        isDismissible: true, 
      ),
    );
    print('Firebase Auth Error: ${e.message}');
  }finally{
    isAuthenticating.value=false;
  }
}
}
