import 'package:get/get.dart';
import 'package:liquid_swipe/PageHelpers/LiquidController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnBoardingController extends GetxController{
    final controller = LiquidController();
    RxInt currentPage = 0.obs;

    final isFirstTimeUser = true;

    Future<void> isFirstTimer()async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      print(prefs.getBool("firstimer"));
      prefs.setBool("firstimer", false);
      print(prefs.getBool("firstimer"));

      
    }



}