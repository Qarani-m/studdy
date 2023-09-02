// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/utils/constants/app_strings.dart';
import 'package:studdy/utils/constants/colors.dart';
import 'package:studdy/utils/constants/image_Strings.dart';
import 'package:studdy/utils/widgets/logo.dart';
import 'package:studdy/views/auth/forms/login.dart';
import 'package:studdy/views/auth/forms/signup.dart';

class Onboarding extends StatefulWidget {
  const Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  @override
  Widget build(BuildContext context) {
    List<String> images = [
      AppImages.onboarding1,
      AppImages.onboarding2,
      AppImages.onboarding3,
    ];
    List<String> title = [
      AppStrings.onbordingTitle1,
      AppStrings.onbordingTitle2,
      AppStrings.onbordingTitle3,
    ];
    List<String> subtitle = [
      AppStrings.onbordingSubTitle1,
      AppStrings.onbordingSubTitle2,
      AppStrings.onbordingSubTitle3,
    ];
    // List<Widget> leftWidgets = [_SkipWidget(), _PrevPage(), _SignUp()];


    final appTextTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: PageView.builder(
            itemCount: 3,
            itemBuilder: (BuildContext context, index) {
              List<Widget> rightWidgets = [Container(), Container(), _Login()];
              List<Widget> leftWidgets = [
                Container(),
                Container(),
              _SignUp()
              ];

              return Column(
                children: [
                  Stack(children: [
                    Positioned(
                      child: Container(
                        height: 440.h,
                        width: 375.w,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(images[index]),
                                fit: BoxFit.cover)),
                      ),
                    ),
                    Positioned(
                      child: Container(
                        padding: EdgeInsets.only(bottom: 40.h),
                        height: 440.h,
                        width: 375.w,
                        decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment(0.00, -1.00),
                            end: Alignment(0, 1),
                            colors: const [
                              AppColors.gradienColor1,
                              AppColors.gradienColor2
                            ],
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Logo(
                              height: 35.h,
                              radius: 13.r,
                              fontSize: 21.sp,
                            )
                          ],
                        ),
                      ),
                    ),
                  ]),
                  SizedBox(
                    height: 39.h,
                  ),
                  SizedBox(
                    width: 311.w,
                    // height: 88.h,
                    // color: Colors.red,
                    child: Column(children: [
                      Container(
                        width: 311.w,
                        // height: 28.h,
                        // color: Colors.blue,
                        alignment: Alignment.center,
                        child: Text(
                          title[index],
                          textAlign: TextAlign.center,
                          style: appTextTheme.titleLarge
                              ?.copyWith(color: AppColors.primaryTextDarkColor),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Container(
                        width: 311.w,
                        height: 44.h,
                        alignment: Alignment.center,

                        // color: Colors.amber,
                        child: Text(
                          subtitle[index],
                          textAlign: TextAlign.center,
                          style: appTextTheme.bodySmall
                              ?.copyWith(color: AppColors.fadedTextColor),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(
                    child: SizedBox(
                        width: 25.w,
                        height: 44.h,
                        // color: Colors.red,
                        child: Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: List.generate(3, (sliderIndex) {
                              return Container(
                                height: sliderIndex == index ? 4.h : 4.w,
                                width: sliderIndex == index ? 8.w : 4.w,
                                decoration: BoxDecoration(
                                    color: sliderIndex == index
                                        ? AppColors.primaryColor
                                        : AppColors.primaryColor
                                            .withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(8.r)),
                              );
                            }),
                          ),
                        )),
                  ),
                  SizedBox(
                    height: index == 2 ? 25.h : 50.h,
                  ),
                  SizedBox(
                    width: 327.w,
                    height: 64.h,
                    // color: Colors.red,
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // _SkipWidget(),
                          leftWidgets[index],
                          rightWidgets[index],
                        ]),
                  )
                ],
              );
            }));
  }
}

class _SignUp extends StatelessWidget {
  const _SignUp();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            transition: Transition.cupertinoDialog,
            duration: Duration(milliseconds: 40),
            Signup());
      },
      child: Text(
        "Sign Up",
        style: TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}

class _Login extends StatelessWidget {
  const _Login();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.to(
            transition: Transition.cupertinoDialog,
            duration: Duration(milliseconds: 40),
            Login());
      },
      child: Text(
        "Sign In",
        style: TextStyle(color: AppColors.primaryColor),
      ),
    );
  }
}
