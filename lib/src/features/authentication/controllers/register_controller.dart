import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/authentication/repository/auth_helper.dart';
import 'package:studdy/src/features/authentication/repository/exceptions/sigup_exception.dart';
import 'package:studdy/src/features/authentication/screens/login.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  RxBool passwordVisible = false.obs;
  RxBool isAuthenticating =false.obs;
  var name = "";
  var email = "";
  var phone = "";
  var password = "";
  var validationMessage = "";

void registerAction() async {
  // name = "martin";
  //  email = "emqarani39k@gmail.com";
  //  phone = "0704847676";
  //  password = "Somepassword";
  name = nameController.text.trim();
  email = emailController.text.trim();
  phone = phoneController.text.trimRight();
  password = passwordController.text.trim();
  String inputValidationResults = InputValidation.validationResults(name, email, phone, password);

  if (inputValidationResults != "pass") {
    _warningSnackBar("Invalid input", inputValidationResults);
  } else {
    isAuthenticating.value=true;
    try{
    await AuthHelper.instance.createUser(email, password, name, phone);
    }catch(e){
      const SignUpFailure();
      isAuthenticating.value=false;
    }
  }
}


   _warningSnackBar(String title, String message) {
    return Get.snackbar(
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin:EdgeInsets.only(bottom: 5.h),
        maxWidth:327.w,
        title,
        message,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryColor.withOpacity(0.8));
  }
  void togglePasswordVisibility() {
    passwordVisible.value = !passwordVisible.value;
  }
  void goLogin() {
    Get.to(const Login(),
        transition: Transition.cupertinoDialog,
        duration: const Duration(milliseconds: 400));
  }
}
class InputValidation {
  static bool isValidName(String name) {
    return name.length >= 3 && RegExp(r'^[a-zA-Z]+$').hasMatch(name);
  }
  static bool isValidEmail(String email) {
    return RegExp(
            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+$")
        .hasMatch(email);
  }
  static bool isValidPassword(String password) {
    return password.length >= 8;
  }
  static bool isValidPhoneNumber(String phoneNumber) {
    return RegExp(r'^07\d{8}$').hasMatch(phoneNumber);
  }
  static String validationResults(
      String name, String email, String phoneNumber, String password) {
    String message = "";
    if (!isValidName(name)) {
      message = "Invalid name! Name should be have atleast 3 characters";
    } else if (!isValidEmail(email)) {
      message = "Invalid email!";
    } else if (!isValidPassword(password)) {
      message = "Invalid Password! password should have atleast 8 characters";
    } else if (!isValidPhoneNumber(phoneNumber)) {
      message = "Inavalid phone number";
    } else {
      message = "pass";
    }
    return message;
  }
}
