import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parsed_readmore/parsed_readmore.dart';
import 'package:studdy/src/common_widgets/tutor/one_tutor.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/screens/payment_methods.dart';
import 'package:studdy/src/features/home/controllers/navigation_controller.dart';
import 'package:studdy/src/routing/navigation.dart';

class CourseDetails extends StatefulWidget {
  const CourseDetails({super.key});

  @override
  State<CourseDetails> createState() => _CourseDetailsState();
}

class _CourseDetailsState extends State<CourseDetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    resetSystemUIOverlayStyle(Brightness.dark);

    const String inputData =
        "When using custom values we have specified the to be our targe have specified the to be our targe have specified the to be our targe have specified the to be our targe have specified the to be our target text for highlighting  with purple italic font. We know that the website is a very useful website. (rti..notNow should not be parsed) But Instagram is more fun to use. We should not forget the contribution of wikipedia played in the growth of web. If you like this package do consider liking it so that it could be useful to more developers like you. Thank you for your time";

    TabController tabController = TabController(length: 3, vsync: this);
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
                      SizedBox(
                        width: 10.w,
                      ),
                      GestureDetector(
                        onTap: () {
                          AppNavigation.goBackHome();
                        },
                        child: const ThumnailHoverIcons(
                          icon: Icon(Icons.bookmark),
                        ),
                      ),
                    ])
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: 230.h,
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
                              color: AppColors.primaryColor.withOpacity(0.095),
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
                    TabBar(
                      labelColor: AppColors.primaryDarkColor,
                      controller: tabController,
                      indicatorColor: AppColors.primaryDarkColor,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicatorWeight: 5,
                      tabs: const [
                        Tab(
                          child: Text("About"),
                        ),
                        Tab(
                          child: Text("lessons"),
                        ),
                        Tab(
                          child: Text("Reviews"),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 426.h,
                      child: TabBarView(
                          controller: tabController,
                          children: const [
                            AboutCourse(inputData: inputData),
                            LessonsCourse(),
                            ReviewsCourses()
                          ]),
                    )
                  ]),
            ),
          ),
        ],
      ),
    )));
  }
}

class ReviewsCourses extends StatelessWidget {
  const ReviewsCourses({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    const String inputData =
        "When using custom values we have specified the to be our targe have specified the to be our targe have specified the to be our targe have specified the to be our targe have specified the to be our target text for highlighting  with purple italic font. We know that the website is a very useful website. (rti..notNow should not be parsed) But Instagram is more fun to use. We should not forget the contribution of wikipedia played in the growth of web. If you like this package do consider liking it so that it could be useful to more developers like you. Thank you for your time";

    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        "Reviews (32)",
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            fontSize: 15.sp,
            color: AppColors.primaryTextDarkColor.withOpacity(0.9)),
      ),
      SizedBox(height: 10.h),
      SizedBox(
        height: 170.h,
        child: Column(children: [
          Container(
            // color: Colors.blue,
            child: SizedBox(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                  Row(
                    children: [
                      Container(
                        height: 50.h,
                        width: 50.h,
                        decoration: const BoxDecoration(
                            // color: Colors.green,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/home/tutor4.jpg"),
                                fit: BoxFit.cover)),
                      ),
                      SizedBox(width: 5.w),
                      Text("Sofia Reyes",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium
                              ?.copyWith(
                                  fontSize: 13.sp,
                                  color: AppColors.primaryTextDarkColor
                                      .withOpacity(0.9))),
                    ],
                  ),
                  Text("45 days ago",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 13.sp,
                          color: AppColors.primaryTextDarkColor,
                          fontWeight: FontWeight.w400))
                ])),
          ),
          SizedBox(
            height: 10.h,
          ),
          SizedBox(
            height: 76.h,
            child: ParsedReadMore(
              inputData,
              trimMode: TrimMode.line,
              trimLines: 3,
              delimiterStyle: Theme.of(context)
                  .textTheme
                  .bodyMedium
                  ?.copyWith(color: AppColors.fadedTextColor),
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.fadedTextColor),
              trimCollapsedText: 'read more',
              trimExpandedText: 'hide',
              moreStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.primaryDarkColor),
              lessStyle: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(color: AppColors.primaryDarkColor),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Row(children: [
            const Icon(
              Icons.star_outlined,
              color: AppColors.primaryColor,
            ),
            const Icon(
              Icons.star,
              color: AppColors.primaryColor,
            ),
            const Icon(
              Icons.star,
              color: AppColors.primaryColor,
            ),
            const Icon(
              Icons.star,
              color: AppColors.primaryColor,
            ),
            const Icon(
              Icons.star,
              color: AppColors.primaryColor,
            ),
            SizedBox(
              width: 10.w,
            ),
            Text("5",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.primaryTextDarkColor)),
          ])
        ]),
      )
    ]));
  }
}

class LessonsCourse extends StatelessWidget {
  const LessonsCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: 10.h),
        Text(
          "Lessons (32)",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              color: AppColors.primaryTextDarkColor.withOpacity(0.9)),
        ),
        SizedBox(height: 10.h),
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text("Section 1 - Introduction ",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 15.sp,
                  color: AppColors.primaryTextDarkColor.withOpacity(0.7))),
          Text("15 min",
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  fontSize: 15.sp,
                  color: AppColors.primaryColor.withOpacity(1))),
        ]),
        SizedBox(height: 10.h),
        Container(
          padding: EdgeInsets.all(6.h),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30.r),
              border: Border.all(color: AppColors.secondaryColor)),
          child: Row(children: [
            Container(
                height: 50.h,
                width: 50.h,
                decoration: BoxDecoration(
                  color: AppColors.secondaryColor.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
                child: const Center(child: Text("01"))),
            SizedBox(width: 5.w),
            SizedBox(
              width: 235.w,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        overflow: TextOverflow.ellipsis,
                        maxLines: 2,
                        "Introduction to disign thinking",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 15.sp,
                            color:
                                AppColors.primaryTextDarkColor.withOpacity(1))),
                    Text("10:00",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 13.sp,
                            color: AppColors.fadedTextColor.withOpacity(1)))
                  ]),
            ),
            const Icon(Icons.lock)
          ]),
        )
      ],
    ));
  }
}

class AboutCourse extends StatelessWidget {
  const AboutCourse({
    super.key,
    required this.inputData,
  });

  final String inputData;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 10.h),
          Text(
            "About this course",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 15.sp,
                color: AppColors.primaryTextDarkColor.withOpacity(0.9)),
          ),
          SizedBox(height: 5.h),
          ParsedReadMore(
            inputData,
            trimMode: TrimMode.line,
            trimLines: 3,
            delimiterStyle: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(color: AppColors.fadedTextColor),
            style: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.fadedTextColor),
            trimCollapsedText: 'read more',
            trimExpandedText: 'hide',
            moreStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.primaryDarkColor),
            lessStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.primaryDarkColor),
          ),
          SizedBox(height: 10.h),
          Text(
            "Tutor",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 15.sp,
                color: AppColors.primaryTextDarkColor.withOpacity(0.9)),
          ),
          SizedBox(height: 5.h),
          const OneTutor(),
          SizedBox(height: 10.h),
          Text(
            "Info",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 15.sp,
                color: AppColors.primaryTextDarkColor.withOpacity(0.9)),
          ),
          Row(children: [
            Column(
              children: [
                SizedBox(height: 5.h),
                const InfoTemplate(
                  variable: "Students",
                  value: "1,200",
                ),
                SizedBox(height: 10.h),
                const InfoTemplate(
                  variable: "Language",
                  value: "English",
                ),
                SizedBox(height: 30.h)
              ],
            ),
            SizedBox(width: 100.w),
            Column(
              children: [
                SizedBox(height: 5.h),
                const InfoTemplate(
                  variable: "Level",
                  value: "Form 4",
                ),
                SizedBox(height: 10.h),
                const InfoTemplate(
                  variable: "Students",
                  value: "1,200",
                ),
                SizedBox(height: 30.h)
              ],
            ),
          ]),
          SizedBox(
              height: 70.h,
              width: 375.w,
              // color: Colors.green,
              child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Total price",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.primaryTextDarkColor
                                        .withOpacity(0.9)),
                          ),
                          const Text("\$ 180",
                              style: TextStyle(color: AppColors.primaryColor))
                        ]),
                    GestureDetector(
                      onTap: () {
                        AppNavigation.navigateTo(Payment());
                      },
                      child: Container(
                        height: 50.h,
                        width: 200.w,
                        decoration: BoxDecoration(
                            color: AppColors.secondaryColor,
                            borderRadius: BorderRadius.circular(30.r)),
                        child: const Center(
                            child: Text("Buy now",
                                style: TextStyle(color: Colors.white))),
                      ),
                    )
                  ]))
        ],
      ),
    );
  }
}

class InfoTemplate extends StatelessWidget {
  const InfoTemplate({
    super.key,
    required this.value,
    required this.variable,
  });
  final String value;
  final String variable;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          variable,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w400,
              color: AppColors.primaryTextDarkColor.withOpacity(0.9)),
        ),
        Text(
          value,
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              fontWeight: FontWeight.w500,
              color: AppColors.primaryTextDarkColor),
        )
      ],
    );
  }
}

class ThumnailHoverIcons extends StatelessWidget {
  final Widget icon;
  const ThumnailHoverIcons({
    required this.icon,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5.w),
        decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
            border:
                Border.all(color: AppColors.primaryDarkColor.withOpacity(0.1))),
        child: icon);
  }
}
