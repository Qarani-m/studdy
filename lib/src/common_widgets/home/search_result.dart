import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/screens/course_details_page.dart';
import 'package:studdy/src/features/tutor/tutor_datails.dart';
import 'package:studdy/src/routing/navigation.dart';



class CourseSearchResult extends StatelessWidget {
  final bool review;
  const CourseSearchResult({
    this.review=false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
      onTap: (){AppNavigation.navigateTo(const CourseDetails());},

          child: Container(
            height: 130.h,
            padding: EdgeInsets.all(8.h),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20.r),
              border: Border.all(color: AppColors.fadedTextColor),
            ),
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 130.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.r),
                      image: const DecorationImage(
                          image: AssetImage(
                            "assets/images/home/image5.jpg",
                          ),
                          fit: BoxFit.cover)),
                ),
                SizedBox(width: 10.w),
                SizedBox(
                  height: 100.h,
                  width:review?130.w: 150.w,
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 20.h),
                        const Text("title"),
                        SizedBox(
                          height: 3.h,
                        ),
                        Row(
                          children: [
                            const Icon(Icons.person_rounded),
                            SizedBox(
                              width: 5.w,
                            ),
                            Text("instructor",
                                style: Theme.of(context).textTheme.bodySmall)
                          ],
                        ),
                        SizedBox(
                          height: 10.h,
                        ),
                        Row(
                          children: [
                            const Text("Kshprice"),
                            SizedBox(width: 10.w),
                            Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 8.w,
                              ),
                              decoration: BoxDecoration(
                                  color:
                                      AppColors.primaryColor.withOpacity(0.095),
                                  borderRadius: BorderRadius.circular(10.r)),
                              child: Center(
                                  child: Text("tag",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall
                                          ?.copyWith(
                                              color: AppColors.primaryColor))),
                            )
                          ],
                        )
                      ]),
                ),
                SizedBox(width: 15.w),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 3.w),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.r)),
                  child: review? Row(
                      children: [
                        Icon(Icons.star, color: AppColors.primaryColor),
                        Text(
                          "4.5",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                        )
                      ],
                    ): Icon(Icons.bookmark),
                )
              ],
            ),
          ),
        ),
        SizedBox(
          height: 8.h,
        )
      ],
    );
  }
}

class RecentSearches extends StatelessWidget {
  const RecentSearches({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          const Text("Recent searches...."),
          SizedBox(height: 15.h),
          SizedBox(
            height: 90.h,
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Electricity and magnetism",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 18.sp),
                    ),
                    const Icon(
                      Icons.close,
                      color: AppColors.fadedTextColor,
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Organic chemistry",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 16.sp),
                    ),
                    const Icon(Icons.close, color: AppColors.fadedTextColor)
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Locus",
                      style: Theme.of(context)
                          .textTheme
                          .bodySmall
                          ?.copyWith(fontSize: 16.sp),
                    ),
                    const Icon(Icons.close, color: AppColors.fadedTextColor)
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
