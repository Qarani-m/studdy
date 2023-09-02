// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:studdy/utils/constants/colors.dart';
import 'package:studdy/utils/widgets/button_widget.dart';
import 'package:studdy/utils/widgets/general.dart';
import 'package:studdy/utils/widgets/text_field.dart';
import 'package:studdy/utils/widgets/text_widget.dart';
import 'package:studdy/views/auth/forms/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w),
        child: SingleChildScrollView(
          child: Container(
            // color:Colors.red,
            margin: EdgeInsets.only(
              top: 140.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: 280.w,
                  child: PageLargeText(
                    text: "Hello there, Welcome to studdy",
                  ),
                ),
                
                Container(
                  // color:Colors.blue,
                  // height: 280.h,
                  width: 327.h,
                  margin: EdgeInsets.only(top: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputPrompt(
                                label: "Name", hint: "Enter your name"),
                            SizedBox(
                              height: 10.h,
                            ),
                            InputPrompt(
                                label: "Email",
                                hint: "fluxstore@example.com"),
                            SizedBox(
                              height: 10.h,
                            ),
                            InputPrompt(label: "Phone", hint: "07XX-XXX-XXX"),
                            SizedBox(
                              height: 10.h,
                            ),
                            InputPrompt(
                                label: "Password",
                                hint: "Enter your password",
                                obscureText: true),
                          ]),
                      SizedBox(
                        height: 23.h,
                      ),
                    ],
                  ),
                ),
                ButtonLarge(
                  text: "Register",
                  onTapFunction: () {},
                ),
                SizedBox(
                  height: 15.h,
                ),
                Container(
                  height: 20.h,
                  width: 320.w,
                  alignment: Alignment.center,
                  child: NormalText2(
                    text: "or",
                    color: AppColors.primaryDarkColor,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                SizedBox(
                  // color: Colors.red,
                  height: 60.h,
                  width: 320.w,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        AltLoginIcon(
                            image: "assets/images/auth/google.png",
                            onTap: () {}),
                        SizedBox(
                          width: 25.w,
                        ),
                        AltLoginIcon(
                            image: "assets/images/auth/facebook_ic.png",
                            onTap: () {}),
                        SizedBox(
                          width: 25.w,
                        ),
                        AltLoginIcon(
                            image: "assets/images/auth/github.png",
                            onTap: () {}),
                      ]),
                ),
                SizedBox(
                  height: 15.h,
                ),
                GestureDetector(
                    onTap: () {
                      Get.to(
                          transition: Transition.cupertinoDialog,
                          duration: Duration(milliseconds: 500),
                          Login());
                    },
                    child:
                        NoAccout(t1: "Already have an account? ", t2: "Log in"))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
