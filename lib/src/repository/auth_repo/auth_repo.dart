import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/authentication/screens/login.dart';
import 'package:studdy/src/features/authentication/screens/onboarding.dart';
import 'package:studdy/src/features/home/home_page.dart';
import 'package:studdy/src/repository/exceptions/login_failure.dart';
import 'package:studdy/src/repository/exceptions/signup_failure.dart';

import '../../features/authentication/screens/welcome.dart';

class AuthRepo extends GetxController {
  static AuthRepo get instance => Get.find();
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    // user == null ? Get.offAll(const Login()) : Get.offAll(const HomePage());
    if (user != null) {
      Future.delayed(const Duration(seconds: 3), () {
        Get.offAll(
            transition: Transition.cupertinoDialog,
            duration: const Duration(milliseconds: 700),
            const HomePage());
      });
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();

      bool isFirstTimeUser = prefs.getBool("firstimer") ?? true;
      if (isFirstTimeUser) {
        Future.delayed(const Duration(seconds: 3), () {
          Get.offAll(
              transition: Transition.cupertinoDialog,
              duration: const Duration(milliseconds: 700),
              Onboarding());
        });
      } else {
        Future.delayed(const Duration(seconds: 3), () {
          Get.offAll(
              transition: Transition.cupertinoDialog,
              duration: const Duration(milliseconds: 700),
              const Welcome());
        });
      }
    }
  }

  Future<void> createUser(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const HomePage())
          : Get.to(const Login());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpFailure.code(e.code);
      Get.showSnackbar(
        snackBar(ex),
      );
      throw ex;
    } catch (_) {
      const ex = SignUpFailure();
      Get.showSnackbar(
        snackBar(ex),
      );
      throw ex;
    }
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const HomePage())
          : Get.to(const Login());
    } on FirebaseAuthException {
      const ex = LoginFailure();
      Get.showSnackbar(
        snackBar(ex),
      );
      throw ex;
    } catch (_) {
      const ex = LoginFailure();
      Get.showSnackbar(
        snackBar(ex),
      );
      throw ex;
    }
  }

  Future<void> signoutUser() async => _auth.signOut();
  GetSnackBar snackBar(dynamic ex) {
    return GetSnackBar(
      messageText: Center(
        child: Text(
          ex.message,
          style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
      duration: const Duration(seconds: 10),
      backgroundColor: AppColors.primaryColor.withOpacity(1),
      margin: const EdgeInsets.all(10),
      borderRadius: 50,
      snackStyle: SnackStyle.GROUNDED,
      isDismissible: true,
    );
  }
}
