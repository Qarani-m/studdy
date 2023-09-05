// ignore_for_file: avoid_print

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/authentication/screens/login.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  // final GlobalKey<FormState> registerFormKey = GlobalKey<FormState>();

  RxBool obscureText = true.obs;
  RxBool isAuthenticating = false.obs;
  var email = "";
  var password = "";
  var name = "";
  var phone = "";

  void togglePasswordVisibility() {
    obscureText.value = !obscureText.value;
  }

  bool validateName(String name) {
    if (name.length > 3 && name.length < 25) {
      return true;
    } else {
      return false;
    }
  }

  bool validateEmail(String email) {
    // Regular expression for a basic email validation
    final emailRegex = RegExp(r'^[\w-]+(\.[\w-]+)*@[\w-]+(\.[\w-]+)+$');
    return emailRegex.hasMatch(email);
  }

  bool validatePhoneNumber(String phoneNumber) {
    // Phone number should start with "07" and have a total length of 10 digits
    if (phoneNumber.length == 10 && phoneNumber.startsWith("07")) {
      return true;
    } else {
      return false;
    }
  }

  bool validatePassword(String password) {
    if (password.length >= 8) {
      return true;
    } else {
      return false;
    }
  }



  List<int> validation() {
    List<int> errorCode  =[];
    email = emailController.text;
    password = passwordController.text;
    phone = phoneController.text;
    name = nameController.text;
    if (!validateName(name)) {errorCode.add(0);return errorCode;}
    if (!validateEmail(email)) {errorCode.add(1);return errorCode;}
    // if (!validatePhoneNumber(phone)) {errorCode.add(2);return errorCode;}
    if (!validatePassword(password)) {errorCode.add(3);return errorCode;}

    return errorCode;
  }

  void goToLoginPage() {
    Get.to(const Login(),
        transition: Transition.cupertinoDialog,
        duration: const Duration(milliseconds: 400));
  }

  void signupAction() async{
    Map<int, String> errMessage= {
      0:"Username too short",
      1:"Invalid email",
      2:"Invalid phone number",
      3:"Password too short"

    };
    List<int> errorCode = validation();

  if (errorCode.isNotEmpty) {
    for (int code in errorCode) {
      String errorMessage = errMessage[code].toString();
      Get.showSnackbar(
      GetSnackBar(
        messageText: Center(
          child: Text(
            errorMessage,
            style: TextStyle(color: Colors.white,
            fontSize: 13.sp,
            fontWeight: FontWeight.w400
            ),
          ),
        ),
        duration: const Duration(seconds: 7),
        backgroundColor: AppColors.primaryColor.withOpacity(1),
        margin: const EdgeInsets.all(10),
        borderRadius: 50, 
        snackStyle: SnackStyle.GROUNDED,
        isDismissible: true, 
      ),
    );// You can replace this with your desired error handling logic
    }
    return;
  } else {
    await FirebaseAuth.instance.createUserWithEmailAndPassword(
    email: email,
    password: password,
  );
    // If no errors, proceed with signup
    // Your signup logic goes here
  }
    
  }
}
