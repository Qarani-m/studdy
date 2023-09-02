import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pinput/pinput.dart';
import 'package:studdy/utils/widgets/button_widget.dart';
import 'package:studdy/utils/widgets/text_widget.dart';
import 'package:studdy/utils/widgets/pinput.dart';
import 'package:studdy/views/auth/forms/new_emaipassword.dart';

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
                SizedBox(
                  width: 280.w,
                  child:const PageLargeText(
                    text: "OTP Verification",
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                const NormalText(
                    fontWeight: FontWeight.w400,
                    color: Color(0xFF8391A1),
                    text:
                        "Enter the verification code we just sent to your \nemail address"),

                SizedBox(
                  height: 50.h,
                ),
                SizedBox(
                  height: 60.h,
                  width: 330.w,
                  child: Pinput(
                    defaultPinTheme: defaultPinTheme,
                    focusedPinTheme: focusedPinTheme,
                    submittedPinTheme: submittedPinTheme,
                    validator: (s) {
                      return s == '2222' ? null : 'Pin is incorrect';
                    },
                    pinputAutovalidateMode: PinputAutovalidateMode.onSubmit,
                    showCursor: false,
                    onCompleted: (pin) => print(pin),
                  ),
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
                          duration: const Duration(milliseconds: 500),
                          const ForgotPasswordOTPPage());
                    },
                    child: ButtonLarge(
                      text: "Verify",
                      onTapFunction: () {
                        Get.to(
                            transition: Transition.cupertinoDialog,
                            duration: const Duration(milliseconds: 500),
                            const NewEmailPassword());
                      },
                    )),
                    SizedBox(height: 10.h,),
                    const NoAccout(t1: "", t2: "resend code")
              ],
            )),
      ),
    );
  }
}
