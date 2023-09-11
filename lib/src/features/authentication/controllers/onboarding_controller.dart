import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:studdy/src/features/authentication/screens/welcome.dart';

class OnBoardingController extends GetxController {
  LiquidController liquidController = LiquidController();

  void nextButtonPresses() {
    print(liquidController.currentPage);
    if (liquidController.currentPage == 2) {
      Get.to(const Welcome(),
          transition: Transition.cupertinoDialog,
          duration: const Duration(milliseconds: 400));
    }
    int nextPage = liquidController.currentPage + 1;
    liquidController.animateToPage(page: nextPage);
  }
  void skipButtonPressed(){
      liquidController.jumpToPage(page: 2);
  }
}
