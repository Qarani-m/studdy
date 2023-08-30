import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/view/auth/otp_page.dart';
import 'package:studdy/view/widgets/button_widget.dart';
import 'package:studdy/view/widgets/text_field.dart';
import 'package:studdy/view/widgets/text_widget.dart';
import 'package:get/get.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                    text: "Forgot password?",
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                NormalText(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8391A1),
                    text:
                        "Don't worry! It occurs. Please enter the email \naddress linked with your account."),
                SizedBox(
                  height: 50.h,
                ),
                InputPrompt(label: "Email", hint: "Enter your email"),
                SizedBox(
                  height: 30.h,
                ),
                ButtonLarge(
                  text: "Send code",
                  onTapFunction: () {
                    Get.to(
                        transition: Transition.cupertinoDialog,
                        duration: Duration(milliseconds: 500),
                        ForgotPasswordOTPPage());
                  },
                )
              ],
            )),
      ),
    );
  }
}
