// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:studdy/constants/colors.dart';
import 'package:studdy/view/auth/login.dart';
import 'package:studdy/view/widgets/button_widget.dart';
import 'package:studdy/view/widgets/general.dart';
import 'package:studdy/view/widgets/text_field.dart';
import 'package:studdy/view/widgets/text_widget.dart';

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
            margin: EdgeInsets.only(
              top: 145.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 280.w,
                  child: PageLargeText(
                    text: "Hello there, Welcome to studdy",
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Container(
                  height: 280.h,
                  width: 327.h,
                  margin: EdgeInsets.only(top: 30.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              InputPrompt(
                                  label: "Email", hint: "Enter your name"),
                              SizedBox(
                                height: 10.h,
                              ),
                              InputPrompt(
                                  label: "Email",
                                  hint: "fluxstore@example.com"),
                              SizedBox(
                                height: 10.h,
                              ),
                              InputPrompt(label: "Email", hint: "07XX-XXX-XXX"),
                              SizedBox(
                                height: 10.h,
                              ),
                              InputPrompt(
                                  label: "Password",
                                  hint: "Enter your password",
                                  obscureText: true),
                            ]),
                      ),
                      SizedBox(
                        height: 8.h,
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
                    color: primaryDarkColor,
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
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
                  height: 30.h,
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
