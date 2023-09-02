import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studdy/utils/constants/app_strings.dart';
import 'package:studdy/utils/constants/colors.dart';
import 'package:studdy/utils/constants/image_Strings.dart';
import 'package:studdy/utils/constants/sizes.dart';
import 'package:studdy/utils/widgets/logo.dart';
import 'package:studdy/views/auth/onboarding/onboarding.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final appTextTheme = Theme.of(context).textTheme;
    return Scaffold(
        body: Stack(
      children: [
        Positioned(
            child: Container(
          height: AppSizes.screenScreen(context).height,
          width: AppSizes.screenScreen(context).width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(AppImages.welcomeImage),
                  fit: BoxFit.cover)),
        )),
        Positioned(
            child: Container(
          padding:
              EdgeInsets.only(top: 40.h, bottom: 45.h, left: 24.w, right: 24.w),
          width: 375.w,
          height: 812.h,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment(0.00, -1.00),
              end: Alignment(0, 1),
              colors: [AppColors.gradienColor1,AppColors.gradienColor2],

            ),
          ),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Logo(),
                Container(
                  alignment: Alignment.center,
                  height: 259.h,
                  width: 327.w,
                  child: Column(children: [
                    SizedBox(
                      height: 155.h,
                      width: 327.w,
                      child:Column(
                        children: [
                          Text(
                            AppStrings.welcomeTitle,
                            textAlign: TextAlign.center,
                            style: appTextTheme.titleLarge?.copyWith(
                              color: Colors.white,
                              fontSize: 39.sp
                              
                            ),
                          ),
                          SizedBox(height:16.h),
                          Text(
                            AppStrings.welcomSubtitle,
                            textAlign: TextAlign.center,
                            style: appTextTheme.bodySmall?.copyWith(
                              color: Colors.white.withOpacity(0.7),
                              // fontSize: 32.sp
                              
                            ),
                          )
                        ],
                      )
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    GestureDetector(
                      onTap: (){
                        Get.to(
                          transition: Transition.cupertinoDialog,
                          duration: const Duration(milliseconds: 400),
                          const Onboarding()
                        );
                      },
                      child: Container(
                        height: 56.h,
                        width: 149.w,
                        decoration:  BoxDecoration(
                        color: AppColors.primaryColor,
                        borderRadius: BorderRadius.circular(10.r)



                        ),
                        child:  Center(
                          child: Text(AppStrings.welcomeButton, style:appTextTheme.titleMedium?.copyWith(
                            color: Colors.white,
                            fontFamily: "Poppins"
                          ) ,),
                        ),
                      ),
                    )
                  ]),
                )
              ]),
        )),
      ],
    ));
  }
}
