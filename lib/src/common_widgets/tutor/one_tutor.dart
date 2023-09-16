
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/tutor/tutor_datails.dart';
import 'package:studdy/src/routing/navigation.dart';

class OneTutor extends StatelessWidget {
  const OneTutor({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){AppNavigation.navigateTo(const TutrorDetails());},
      child: SizedBox(
        height: 80.h,
        width: double.maxFinite.w,
        child: Row(children: [
          Container(
            height: 100.h,
            width: 60.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/images/home/tutor1.jpg"),
                  fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10.w),
          SizedBox(
            width: 223.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text("Robert Green"),
                Text("Python Master",
                    style: Theme.of(context).textTheme.bodySmall),
                Row(
                  children: [
                    const Icon(
                      Icons.star,
                      color: AppColors.primaryColor,
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Text("5",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryTextDarkColor)),
                                 SizedBox(
                      width: 3.w,
                    ),
                    Text("(100 reviews)",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium
                            ?.copyWith(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w400,
                                color: AppColors.primaryTextDarkColor)),
                  ],
                ),
              ],
            ),
          ),
          SvgPicture.asset(
            "assets/images/svg/comment.svg",
            color: AppColors.primaryColor,
            height: 34.h,
          ),
          // Icon(
          //   color:AppColors.accentColor,
          //   Icons.email,
          //   size: 30.h,
          // )
        ]),
      ),
    );
  }
}
