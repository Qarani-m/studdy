// ignore_for_file: sized_box_for_whitespace

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:studdy/src/common_widgets/auth/large_button.dart';
import 'package:studdy/src/common_widgets/auth/signup_login.dart';
import 'package:studdy/src/features/authentication/controllers/forgot_password.dart';

class ForgotPasswordOTPPage extends StatefulWidget {
  const ForgotPasswordOTPPage({super.key});

  @override
  State<ForgotPasswordOTPPage> createState() => _ForgotPasswordOTPPageState();
}

class _ForgotPasswordOTPPageState extends State<ForgotPasswordOTPPage> {
  @override
  Widget build(BuildContext context) {
    ForgotPasswordController controller = Get.find();

    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w),
        child: Container(
            margin: EdgeInsets.only(
              top: 145.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  // width: 280.w,
                  child:Text(
                  textAlign: TextAlign.center,
                  "Otp verification",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                Text(
              textAlign: TextAlign.center,
              "No worries! It happens. Please enter the email \naddress linked with your account.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
                SizedBox(
                  height: 50.h,
                ),
                Container(
                  height: 60.h,
                  width: 330.w,
                  child:const Pinput(

                  ),
                ),
                // InputPrompt(label: "Email", hint: "Enter your email"),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
              onTap: () {
                controller.goToOtp();
              },
              child: const WelcomeButton(
                text: "Verify",
                background: true,
              ),
            )
            ,SizedBox(height: 10.h,),
            SignupLogin(text1: "Didn't recieve the code? ",text2:"resend")
              ],
            )),
      ),
    );
  }
}