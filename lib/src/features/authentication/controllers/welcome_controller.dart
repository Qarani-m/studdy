import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeController extends GetxController{
  void goToNextPage(Widget? nextPage)async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool("firstimer", false);
    Get.to(
          nextPage,
          transition: Transition.cupertinoDialog,
          duration: const Duration(milliseconds: 400),
          
        );

  }
}