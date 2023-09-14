import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/screens/course_details_page.dart';
import 'package:studdy/src/features/home/repository/navigation.dart';

class TutorSearchResult extends StatelessWidget {
  const TutorSearchResult({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){AppNavigation.navigateTo(const CourseDetails());},
      child: SizedBox(
        height: 80.h,
        width: double.maxFinite.w,
        child: Row(children: [
          Container(
            height: 100.h,
            width: 60.w,
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(
                      "assets/images/home/tutor1.jpg"),
                  fit: BoxFit.cover),
              shape: BoxShape.circle,
            ),
          ),
          SizedBox(width: 10.w),
          SizedBox(
            width: 223.w,
            child: Column(
              crossAxisAlignment:
                  CrossAxisAlignment.start,
              mainAxisAlignment:
                  MainAxisAlignment.center,
              children: [
                const Text("RobertGreen"),
                Text("Python Master",
                    style: Theme.of(context)
                        .textTheme
                        .bodySmall)
              ],
            ),
          ),
          SvgPicture.asset("assets/images/svg/comment.svg", color: AppColors.primaryColor,height:34.h,),
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

class CourseSearchResult extends StatelessWidget {
  const CourseSearchResult({
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
                  width: 150.w,
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
                  child: const Icon(Icons.bookmark),
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
