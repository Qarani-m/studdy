import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController{
  void goToNextPage(Widget? nextPage){
    Get.to(
          nextPage,
          transition: Transition.cupertinoDialog,
          duration: const Duration(milliseconds: 400)
        );

  }
}