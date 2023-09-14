import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/screens/course_details_page.dart';
import 'package:studdy/src/features/courses/screens/payment_methods.dart';
import 'package:studdy/src/routing/navigation.dart';

class ReviewPage extends StatefulWidget {
  const ReviewPage({super.key});

  @override
  State<ReviewPage> createState() => _ReviewPageState();
}

class _ReviewPageState extends State<ReviewPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
            child: SizedBox(
      height: 822.h,
      width: 375.w,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            height: 282.h,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/images/home/image5.jpg"),
                      fit: BoxFit.cover)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 23.w, vertical: 50.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        AppNavigation.goBackHome();
                      },
                      child: const ThumnailHoverIcons(
                          icon: Icon(Icons.arrow_back_rounded)),
                    ),
                    Row(children: [
                      GestureDetector(
                        onTap: () {
                          AppNavigation.goBackHome();
                        },
                        child:
                            const ThumnailHoverIcons(icon: Icon(Icons.share)),
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 200.h,
            left: 0,
            right: 0,
            height: 630.h,
            child: Container(
              padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 10.h),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                      color: AppColors.primaryDarkColor.withOpacity(0.5),
                      offset: const Offset(
                        1.0,
                        1.0,
                      ),
                      blurRadius: 10.0,
                      spreadRadius: 0.5,
                    ), //BoxShadow
                    const BoxShadow(
                      color: Colors.white,
                      offset: Offset(0.0, 0.0),
                      blurRadius: 0.0,
                      spreadRadius: 0.0,
                    ), //BoxShadow
                  ],
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.r),
                      topRight: Radius.circular(20.r))),

              // ----------------------------------------------------------------------------------------------------------------------------
              child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
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
                                child: Text("Best seller",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            color: AppColors.primaryColor))),
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(
                                horizontal: 7.w, vertical: 3.w),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(7.r)),
                            child: Row(
                              children: [
                                const Icon(Icons.star,
                                    color: AppColors.primaryColor),
                                Text(
                                  " 4.5(365 reviews)",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                          color: AppColors.fadedTextColor,
                                          fontWeight: FontWeight.w600,
                                          fontSize: 14.sp),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        overflow: TextOverflow.ellipsis,
                        "Fundamentals of Design thinking",
                        style: TextStyle(fontSize: 20.sp),
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            width: 100.w,
                            child: Row(
                              children: [
                                const Icon(Icons.person_2),
                                SizedBox(width: 5.w),
                                Text(
                                  "Rober green",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            width: 100.w,
                            child: Row(
                              children: [
                                const Icon(Icons.video_call),
                                SizedBox(width: 5.w),
                                Text(
                                  "32 lessons",
                                  style: Theme.of(context).textTheme.bodySmall,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 20.h),
                      Container(
                          height: 1.h,
                          width: 327.w,
                          color: AppColors.fadedTextColor.withOpacity(0.2)),
                      SizedBox(height: 20.h),
                      Container(
                        alignment: Alignment.center,
                        width: 327.w,
                        child: Text(
                          "Your overal rating for this course",
                          style: TextStyle(
                              fontWeight: FontWeight.w400, fontSize: 14.sp),
                        ),
                      ),
                      SizedBox(height: 20.h),
                      Container(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        alignment: Alignment.center,
                        width: 327.w,
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(Icons.star_border,
                                  color: AppColors.primaryColor, size: 40.h),
                              Icon(Icons.star_border,
                                  color: AppColors.primaryColor, size: 40.h),
                              Icon(Icons.star_border,
                                  color: AppColors.primaryColor, size: 40.h),
                              Icon(Icons.star_border,
                                  color: AppColors.primaryColor, size: 40.h),
                              Icon(Icons.star_border,
                                  color: AppColors.primaryColor, size: 40.h),
                            ]),
                      ),
                      SizedBox(height: 20.h),
                      Text(
                        "Add a detailed review",
                        style: TextStyle(
                            fontWeight: FontWeight.w500, fontSize: 14.sp),
                      ),
                      SizedBox(height: 5.h),
                      Card(
                          color: Colors.white,
                          child: Padding(
                            padding: EdgeInsets.all(8.w),
                            child: TextField(
                              maxLines: 4,
                              style: Theme.of(context)
                                  .textTheme
                                  .bodySmall
                                  ?.copyWith(
                                      fontSize: 15.sp,
                                      color: AppColors.primaryDarkColor),
                              cursorColor: AppColors.primaryDarkColor,
                              decoration: InputDecoration(
                                filled: false,
                                hintText: "Enter here",

                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: const BorderSide(
                                        width: 0, color: Colors.white)),

                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: const BorderSide(
                                        width: 0, color: Colors.white)),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(15.r),
                                    borderSide: const BorderSide(
                                        width: 0, color: Colors.white)),

                                //       )
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 100.h,
                      ),
                      SelectPaymentButton(
                        width: 327.w,
                        text: "Submit",
                      )
                    ]),
              ),
            ),
          ),
        ],
      ),
    )));
  }
}
