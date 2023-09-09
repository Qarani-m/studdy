import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class LottieAnimation extends StatelessWidget {
  const LottieAnimation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Lottie.asset('assets/images/text_loading.json',
      
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      )
    );
  }
}



class LottieAnimationController extends GetxController {
  
  
  
}