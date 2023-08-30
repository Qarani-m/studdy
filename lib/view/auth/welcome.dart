// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/view/auth/login.dart';
import 'package:studdy/view/auth/signup.dart';
import 'package:studdy/view/home/home_page.dart';
import 'package:studdy/view/widgets/button_widget.dart';
import 'package:studdy/view/widgets/text_widget.dart';

import '../../constants/colors.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Builder(builder: (BuildContext context) {
        SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(
              // statusBarIconBrightness: Brightness.light
              ),
        );
        return MainContent();
      }),
    );
  }
}

class MainContent extends StatelessWidget {
  const MainContent({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 250.h),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/images/logo.png"), ),
          SizedBox(height: 300,),
          ButtonLarge(
            text: "Login",
            onTapFunction: () {
              Get.to(
                  duration: Duration(microseconds: 400),
                  transition: Transition.cupertinoDialog,
                  Login());
            },
          ),
          SizedBox(
            height: 20.h,
          ),
          ButtonLarge(
            text: "Register",
            buttonColor: Colors.white,
            textColor: primaryDarkColor,
            onTapFunction: () {
              Get.to(
                  duration: Duration(microseconds: 400),
                  transition: Transition.cupertinoDialog,
                  Signup());
            },
          ),
          GestureDetector(
            onTap: () {
              Get.off(
                  duration: Duration(microseconds: 400),
                  transition: Transition.cupertinoDialog,
                  HomePage());
            },
            child: Container(
              margin: EdgeInsets.only(top: 60.h),
              child: NormalText(
                text: "Continue as a guest",
                decoration: TextDecoration.underline,
                color: primaryColor,
                fontWeight: FontWeight.w900,
                fontSize: 14.sp,
              ),
            ),
          )
        ],
      ),
    );
  }
}
