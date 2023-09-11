// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/constants/image_strings.dart';
import 'package:studdy/src/constants/text.dart';
import 'package:studdy/src/features/authentication/controllers/onboarding_controller.dart';
import 'package:studdy/src/features/authentication/models/onboarding_model.dart';
import 'package:studdy/src/features/authentication/screens/welcome.dart';

class Onboarding extends StatefulWidget {
  Onboarding({super.key});

  @override
  State<Onboarding> createState() => _OnboardingState();
}

class _OnboardingState extends State<Onboarding> {
  OnBoardingController controller =Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    List<Widget> pages = [
      OnboardingPage(
        model: OnBoardingModel(
            title: AppText.onBoardingTitle1,
            subtitle: AppText.onBoardingSubTitle1,
            counter: AppText.onBoardingCounter1,
            image: AppImages.onBoardingImage1,
            bgColor: AppColors.onBoardingPage1Color,
            height: MediaQuery.of(context).size.height * 0.5),
      ),
      OnboardingPage(
        model: OnBoardingModel(
            title: AppText.onBoardingTitle2,
            subtitle: AppText.onBoardingSubTitle2,
            counter: AppText.onBoardingCounter2,
            image: AppImages.onBoardingImage2,
            bgColor: AppColors.onBoardingPage2Color,
            height: MediaQuery.of(context).size.height * 0.5),
      ),
      OnboardingPage(
        model: OnBoardingModel(
            title: AppText.onBoardingTitle3,
            subtitle: AppText.onBoardingSubTitle3,
            counter: AppText.onBoardingCounter3,
            image: AppImages.onBoardingImage3,
            bgColor: AppColors.onBoardingPage3Color,
            height: MediaQuery.of(context).size.height * 0.5),
      )
    ];

    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        children: [
          LiquidSwipe(
            liquidController: controller.liquidController,
            enableSideReveal: true,
            slideIconWidget: Icon(Icons.arrow_back_ios),
            pages: pages,
            onPageChangeCallback: (int activeIndex) {
              
            },
          ),
          Positioned(
            bottom: 60.h,
            child: OutlinedButton(
              onPressed: () {controller.nextButtonPresses();},
              style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  side: BorderSide(color: Colors.black26),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(20.r)),
              child: Container(
                  padding: EdgeInsets.all(20.r),
                  decoration: BoxDecoration(
                    color: AppColors.primaryDarkColor,
                    shape: BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_forward_ios)),
            ),
          ),
          Positioned(
              top: 50.h,
              right: 23.w,
              child: TextButton(
                  onPressed: () {controller.skipButtonPressed();},
                  child: Text(
                    "Skip",
                    style: TextStyle(color: AppColors.fadedTextColor),
                  ))),
          Positioned(
            bottom: 20.h,
            child: AnimatedSmoothIndicator(
              activeIndex: controller.liquidController.currentPage,
              count: 3,
              effect: WormEffect(
                  dotHeight: 5.0.h,
                  dotWidth: 12.w,
                  dotColor: AppColors.primaryDarkColor,
                  activeDotColor: AppColors.primaryColor),
            ),
          )
        ],
      ),
    );
  }
}

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    required this.model,
    super.key,
  });
  final OnBoardingModel model;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 812.h,
      width: 375.w,
      color: model.bgColor,
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child:
          Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
        Column(
          children: [
            SvgPicture.asset(
                height: model.height,
                model.image,
                semanticsLabel:
                    'Acme Logo'), // Image(height: model.height, image: AssetImage(model.image)),
            Text(
              textAlign: TextAlign.center,
              model.title,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              width: 270.w,
              child: Text(
                textAlign: TextAlign.center,
                model.subtitle,
                style: Theme.of(context)
                    .textTheme
                    .bodySmall
                    ?.copyWith(color: AppColors.fadedTextColor),
              ),
            ),
          ],
        ),
        Text(model.counter),
        SizedBox(
          height: 50.h,
        )
      ]),
    );
  }
}
