import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studdy/src/features/authentication/screens/otp.dart';

class ForgotPasswordController extends GetxController{

  TextEditingController emailController = TextEditingController();

  void goToOtp(){
    Get.to(
      const ForgotPasswordOTPPage(),
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 400)

    );
  }
  
}