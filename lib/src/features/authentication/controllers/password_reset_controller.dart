import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studdy/src/features/authentication/repository/auth_helper.dart';

class ForgotPasswordController extends GetxController{
    TextEditingController emailController = TextEditingController();
    var email = "";

    Future<void> sendCode()async{
      email = "emqarankkkkkkkki@gmail.com";
      // email = emailController.text.trim();
      await AuthHelper.instance.resetPassword(email);

    }
}