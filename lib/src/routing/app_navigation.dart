import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppNavigationV2 {
  static void resetSystemUIOverlayStyle(Brightness? brightness) {
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: brightness?? Brightness.dark,
      ),
    );
  }

  static void goBack() {
    Get.previousRoute=="/HomePage"?resetSystemUIOverlayStyle(Brightness.light):resetSystemUIOverlayStyle(Brightness.dark);
    Get.back();
  }

  static void initNavigation() {}

  static void goToTutorDetails(String tutorId){
    resetSystemUIOverlayStyle(Brightness.dark);
  }
}
