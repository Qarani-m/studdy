import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/screens/course_page.dart';
import 'package:studdy/src/features/courses/screens/payment_methods.dart';
import 'package:studdy/src/routing/navigation.dart';

class FinalizePayment extends StatelessWidget {
  const FinalizePayment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 23.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 90.h,
              width: 90.h,
                child: Stack(
                  children: [
                   
                    SvgPicture.asset(
              "assets/images/svg/successmark.svg",
              color: AppColors.secondaryColor,
            ),
             Positioned(
                      top:20.h, 
                      left:20.h,
                      child: Icon(Icons.check, color:Colors.white, size: 50.h,)),
                  ],
                )),
            SizedBox(
              height: 20.h,
            ),
            Text("Congratulations", style: TextStyle(fontSize: 20.sp),),
            SizedBox(
              height: 20.h,
            ),
            Text(
              textAlign: TextAlign.center,
              "You have successfully made payment and\n enrolled in to the course ",
              style: TextStyle(
                  color: AppColors.fadedTextColor,
                  fontWeight: FontWeight.w400,
                  fontSize: 14.sp),
            ),
            SizedBox(height: 100.h),
            GestureDetector(
                onTap: () {
                  AppNavigation.navigateTo(CoursePage());
                },
                child: SelectPaymentButton(
                  width: 327.w,
                  text: "Go to course",
                ))
          ],
        ),
      ),
    );
  }
}
