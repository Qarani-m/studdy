import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/authentication/models/student_model.dart';
import 'package:studdy/src/features/authentication/repository/auth_helper.dart';
import 'package:studdy/src/features/authentication/repository/exceptions/login_exception.dart';
import 'package:studdy/src/features/authentication/repository/user_dbhelper.dart';
import 'package:studdy/src/features/authentication/screens/register.dart';

class LoginController extends GetxController{
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    RxBool passwordVisible = false.obs;
    RxBool isAuthenticating =false.obs;
    var password = "";
    var email = "";

  void goRegister(){
    Get.to(
      const Register(),
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 400)
    );
  }


  void loginAction() async{
    email = "emqarani39l@gmail.com";
    password = "Somepassword";
    // email = emailController.text;
    // password = passwordController.text;
    isAuthenticating.value=true;
    try{
    await AuthHelper.instance.loginUser(email, password,);
    }catch(e){
      const LoginFailure();
      isAuthenticating.value=false;
      
      
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

}