import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/tutor/tutor_datails.dart';

   void resetSystemUIOverlayStyle(Brightness? brightness) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.fadedTextColor.withOpacity(0.2),
        statusBarIconBrightness: brightness?? Brightness.dark,
      ),
    );
  }




class HomeNavigationController extends GetxController{
   void resetSystemUIOverlayStyle(Brightness? brightness) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: AppColors.fadedTextColor.withOpacity(0.2),
        statusBarIconBrightness: brightness?? Brightness.dark,
      ),
    );
  }

  void goBack() {
    Get.back();
  }

  void goToTutorDetails(String tutorId){
    Get.to(
      arguments: {
        tutorId:tutorId
      },
      transition:Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 400),
      const TutrorDetails()
    );
    resetSystemUIOverlayStyle(Brightness.dark);
  }
}