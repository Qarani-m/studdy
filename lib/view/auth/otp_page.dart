import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:studdy/view/auth/new_emaipassword.dart';
import 'package:studdy/view/widgets/button_widget.dart';
import 'package:studdy/view/widgets/text_widget.dart';

class ForgotPasswordOTPPage extends StatefulWidget {
  const ForgotPasswordOTPPage({super.key});

  @override
  State<ForgotPasswordOTPPage> createState() => _ForgotPasswordOTPPageState();
}

class _ForgotPasswordOTPPageState extends State<ForgotPasswordOTPPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w),
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
                    text: "OTP Verification",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                NormalText(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8391A1),
                    text:
                        "Enter the verification code we just sent to your \nemail address"),

                SizedBox(
                  height: 50.h,
                ),
                Container(
                  height: 60.h,
                  width: 330.w,
                  color: Colors.red,
                ),
                // InputPrompt(label: "Email", hint: "Enter your email"),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                    onTap: () {
                      // sendSms
                      Get.to(
                          transition: Transition.cupertinoDialog,
                          duration: Duration(milliseconds: 500),
                          ForgotPasswordOTPPage());
                    },
                    child: ButtonLarge(
                      text: "Verify",
                      onTapFunction: () {
                        Get.to(
                            transition: Transition.cupertinoDialog,
                            duration: Duration(milliseconds: 500),
                            NewEmailPassword());
                      },
                    ))
              ],
            )),
      ),
    );
  }
}
