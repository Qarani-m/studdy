import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class AppNavigation{
  static void resetSystemUIOverlayStyle( Brightness brightness) {
  SystemChrome.setSystemUIOverlayStyle(
     SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: brightness,
    ),
  );
}
  static goBackHome(){
    resetSystemUIOverlayStyle(Brightness.light);
    Get.back();
  }
  static navigateTo(Widget page){
    resetSystemUIOverlayStyle(Brightness.dark);
    Get.to(
      page,
      transition: Transition.cupertinoDialog,
      duration:const Duration(microseconds: 400)
      
    );
  }
}