import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/view/auth/succes_page.dart';
import 'package:flux_store/view/widgets/button_widget.dart';
import 'package:flux_store/view/widgets/text_field.dart';
import 'package:flux_store/view/widgets/text_widget.dart';
import 'package:get/get.dart';

class NewEmailPassword extends StatefulWidget {
  const NewEmailPassword({super.key});

  @override
  State<NewEmailPassword> createState() => _NewEmailPasswordState();
}

class _NewEmailPasswordState extends State<NewEmailPassword> {
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
                  text: "Create new password",
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
                height: 30.h,
              ),
              Container(
                // height: 240.h,
                width: 327.h,
                margin: EdgeInsets.only(top: 30.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InputPrompt(label: "Email", hint: "New password"),
                            SizedBox(
                              height: 20.h,
                            ),
                            InputPrompt(
                                label: "Password",
                                hint: "Confirm password",
                                obscureText: true),
                          ]),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                  ],
                ),
              ),
              ButtonLarge(
                text: "Reset password",
                onTapFunction: () {
                  Get.to(
                      transition: Transition.cupertinoDialog,
                      duration: Duration(milliseconds: 500),
                      SuccesPage());
                },
              ),
              SizedBox(
                height: 15.h,
              ),
              SizedBox(
                height: 20.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
