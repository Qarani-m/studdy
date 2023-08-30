// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/constants/colors.dart';
import 'package:studdy/view/auth/forgot_password.dart';
import 'package:studdy/view/auth/signup.dart';
import 'package:studdy/view/widgets/button_widget.dart';
import 'package:studdy/view/widgets/general.dart';
import 'package:studdy/view/widgets/text_field.dart';
import 'package:studdy/view/widgets/text_widget.dart';
import 'package:get/get.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: 145.h, left: 23.w, right: 23.w),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 280.w,
                child: PageLargeText(
                  text: "Welcome back! Glad to see you, Again!",
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Container(
                height: 240.h,
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
                                label: "Email", hint: "Enter your email"),
                            SizedBox(
                              height: 20.h,
                            ),
                            InputPrompt(
                                label: "Password",
                                hint: "Enter your password",
                                obscureText: true),
                          ]),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Get.to(
                          duration: Duration(milliseconds: 400),
                          transition: Transition.cupertinoDialog,
                          ForgotPassword(),
                        );
                      },
                      child: Text(
                        "Forgot Password? ",
                        style: TextStyle(
                            color: primaryColor,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.normal),
                      ),
                    ),
                  ],
                ),
              ),
              ButtonLarge(
                text: "Login",
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
                height: 20.h,
              ),
              Container(
                // color: Colors.red,
                height: 60.h,
                width: 320.w,
                child:
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  AltLoginIcon(
                      image: "assets/images/auth/google.png", onTap: () {}),
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
                      image: "assets/images/auth/github.png", onTap: () {}),
                ]),
              ),
              SizedBox(
                height: 60.h,
              ),
              GestureDetector(
                  onTap: () {
                    Get.to(
                        transition: Transition.cupertinoDialog,
                        duration: Duration(milliseconds: 500),
                        Signup());
                  },
                  child: NoAccout(t1: "Dont have an account? ", t2: "Sign up"))
            ],
          ),
        ),
      ),
    );
  }
}
