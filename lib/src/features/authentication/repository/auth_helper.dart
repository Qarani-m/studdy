import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studdy/src/features/authentication/controllers/onboarding_controller.dart';
import 'package:studdy/src/features/authentication/screens/onboarding.dart';
import 'package:studdy/src/features/authentication/screens/welcome.dart';
import 'package:studdy/src/features/home/screens/home_page.dart';

class AuthHelper extends GetxController {
  static AuthHelper get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user != null) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAll(
            transition: Transition.cupertinoDialog,
            duration: const Duration(milliseconds: 700),
            const HomePage());
      });
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isFirstTimeUser = prefs.getBool("firstimer") ?? true;
      if (isFirstTimeUser) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAll(
              transition: Transition.cupertinoDialog,
              duration: const Duration(milliseconds: 700),
              Onboarding(), binding: BindingsBuilder(() {
            Get.put(OnBoardingController); // Provide the controller here
          }));
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAll(
              transition: Transition.cupertinoDialog,
              duration: const Duration(milliseconds: 700),
              const Welcome());
        });
      }
    }
  }
}
