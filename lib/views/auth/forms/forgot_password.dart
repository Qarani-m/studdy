import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/utils/widgets/button_widget.dart';
import 'package:studdy/utils/widgets/text_field.dart';
import 'package:studdy/utils/widgets/text_widget.dart';
import 'package:studdy/views/auth/forms/otp_page.dart';

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
                SizedBox(
                  width: 280.w,
                  child: const PageLargeText(
                    text: "Forgot password?",
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                const NormalText(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8391A1),
                    text:
                        "Don't worry! It occurs. Please enter the email \naddress linked with your account."),
                SizedBox(
                  height: 50.h,
                ),
                const InputPrompt(label: "Email", hint: "Enter your email"),
                SizedBox(
                  height: 30.h,
                ),
                ButtonLarge(
                  text: "Send code",
                  onTapFunction: () {
                    Get.to(
                        transition: Transition.cupertinoDialog,
                        duration: const Duration(milliseconds: 500),
                        const ForgotPasswordOTPPage());
                  },
                )
              ],
            )),
      ),
    );
  }
}
