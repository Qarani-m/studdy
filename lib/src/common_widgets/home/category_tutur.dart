// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:shimmer/shimmer.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/models/tutor_model.dart';
import 'package:studdy/src/features/home/controllers/navigation_controller.dart';

class Category extends StatelessWidget {
  final String icon;
  final String text;
  final Function onTap;
  const Category({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Column(
        children: [
          Container(
            width: 68.h,
            height: 68.h,
            decoration: ShapeDecoration(
              color: AppColors.primaryDarkColor.withOpacity(0.035),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25.r),
              ),
            ),
            child: Center(
                child: SvgPicture.asset(
              icon,
              color: AppColors.primaryDarkColor,
            )),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            text,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryDarkColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              height: 0.13,
              letterSpacing: 0.20,
            ),
          )
        ],
      ),
    );
  }
}

class TutorShimer extends StatelessWidget {
   TutorShimer({
    super.key,
  });

    HomeNavigationController homeNavigationController=Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Shimmer.fromColors(
        baseColor: AppColors.fadedTextColor.withOpacity(0.1),
                    highlightColor: Colors.white,
        child: Column(
          children: [
            Container(
              width: 68.h,
              height: 68.h,
              decoration: ShapeDecoration(
                  color: AppColors.primaryDarkColor.withOpacity(0.035),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.r),
                  ),
                  image: DecorationImage(
                      image: AssetImage(""), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 15.h,
            ),
            Text(
              "",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColors.primaryDarkColor,
                fontSize: 13.sp,
                fontWeight: FontWeight.w500,
                height: 0.13,
                letterSpacing: 0.20,
              ),
            )
          ],
        ),
      ),
    );
  }
}


class Tutor extends StatelessWidget {
  final TutorModel tutorModel;
   Tutor({
    super.key,
    required this.tutorModel,
  });

    HomeNavigationController homeNavigationController=Get.find();

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){homeNavigationController.goToTutorDetails(tutorModel.tutorId!);},
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 68.h,
            height: 68.h,
            decoration: ShapeDecoration(
                color: AppColors.primaryDarkColor.withOpacity(0.035),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.r),
                ),
                image: DecorationImage(
                    image: NetworkImage(tutorModel.tutorImageUrl!), fit: BoxFit.cover)),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            tutorModel.tutorName!,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: AppColors.primaryDarkColor,
              fontSize: 13.sp,
              fontWeight: FontWeight.w500,
              height: 0.13,
              letterSpacing: 0.20,
            ),
          )
        ],
      ),
    );
  }
}
