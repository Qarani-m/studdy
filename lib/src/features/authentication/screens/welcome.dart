import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/constants/image_strings.dart';
import 'package:studdy/src/features/authentication/screens/login.dart';
import 'package:studdy/src/features/authentication/screens/register.dart';

class Welcome extends StatefulWidget {
  const Welcome({super.key});

  @override
  State<Welcome> createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: AppColors.primaryColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 200.h,
              width: 327.w,
              child: SvgPicture.asset(
                height: MediaQuery.of(context).size.height * 0.9,
                AppImages.welcomeScreenImage,
              ),
            ),
            SizedBox(
              height: 100.h,
            ),
            SizedBox(
              child: Column(
                children: [
                  Text(
                    "Studying Made Convinient",
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  Text(
                    textAlign: TextAlign.center,
                    "Let's put your creativity on the development\n highwaaay",
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
            ),
            Row(
              children: [
                const WelcomeButton(
                  text: "Login",
                  background: false,
                  nextPage: Login(),
                ),
                SizedBox(
                  width: 10.w,
                ),
                const WelcomeButton(
                  text:"Register",
                  background: true,
                  nextPage:  Register()
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    required this.text,
    required this.background,
    required this.nextPage,
  });
  final String text;
  final bool background;
  final Widget nextPage;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Get.to(
          nextPage,
          transition: Transition.cupertinoDialog,
          duration: const Duration(milliseconds: 400)
        );
      },
      child: Container(
        height: 54.h,
        width: 159.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(3.r),
            color:background?AppColors.darkColor: AppColors.whiteColor,
            border: Border.all(color: AppColors.darkColor)),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color:background? Colors.white: AppColors.blackTextColor),
          ),
        ),
      ),
    );
  }
}
