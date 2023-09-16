import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:parsed_readmore/parsed_readmore.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';
import 'package:studdy/src/common_widgets/the_line.dart';
import 'package:studdy/src/common_widgets/tutor/one_tutor.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/screens/course_details_page.dart';
import 'package:studdy/src/features/courses/screens/payment_methods.dart';
import 'package:studdy/src/routing/navigation.dart';

class TutrorDetails extends StatefulWidget {
  const TutrorDetails({super.key});

  @override
  State<TutrorDetails> createState() => _TutrorDetailsState();
}

class _TutrorDetailsState extends State<TutrorDetails>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    const String inputData =
        "When using custom values we have specified the to be our targe have specified the to be our targe have specified the to be our targe have specified the to be our targe have specified the to be our target text for highlighting  with purple italic font. We know that the website is a very useful website. (rti..notNow should not be parsed) But Instagram is more fun to use. We should not forget the contribution of wikipedia played in the growth of web. If you like this package do consider liking it so that it could be useful to more developers like you. Thank you for your time";

    TabController tabController = TabController(length: 3, vsync: this);
    return TutorDetailsMain(tabController: tabController, inputData: inputData);
  }
}

class TutorDetailsMain extends StatelessWidget {
  const TutorDetailsMain({
    super.key,
    required this.tabController,
    required this.inputData,
  });

  final TabController tabController;
  final String inputData;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const BackNavBar(title: "Tutor Details"),
            SizedBox(
              height: 20.h,
            ),
            OneTutor(),
            SizedBox(
              height: 15.h,
            ),
            TheLine(),
            SizedBox(
              height: 15.h,
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
                  child: Text("Courses"),
                ),
                Tab(
                  child: Text("Reviews"),
                )
              ],
            ),
            Container(
              height: 548.h,
              child: TabBarView(controller: tabController, children:  [
                AboutCourse(
                  inputData: inputData,
                ),
                TutorCourses(),
                TutorReviews(),
              ]),
            )
          ],
        ),
      ),
    );
  }
}




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















class TutorCourses extends StatelessWidget {
  const TutorCourses({
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
          "Courses (32)",
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 15.sp,
              color: AppColors.primaryTextDarkColor.withOpacity(0.9)),
        ),

        SizedBox(height:10.h),

        CourseSearchResult(),








      ],
    ));
  }
}



















class TutorReviews extends StatelessWidget {
  const TutorReviews({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
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
            height: 76.h,
            child: Text(
                overflow: TextOverflow.ellipsis,
                maxLines: 5,
                "When using custom values we have specified the to be our targe have specified the to be our targebe our targe have specified the to be our targebe our targe have specified the to be our targe have specified the t,When using custom values we have specified the to be our targe have specified the to be our targe have specified the t",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                    color: AppColors.fadedTextColor)),
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
          SizedBox(height: 20.h),
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
              ],
            ),
            SizedBox(width: 100.w),
            Column(
              children: [
                SizedBox(height: 5.h),
                const InfoTemplate(
                  variable: "Courses",
                  value: "4",
                ),
              ],
            ),
          ]),
          SizedBox(height: 20.h),
          Text(
            "Experience",
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                fontSize: 15.sp,
                color: AppColors.primaryTextDarkColor.withOpacity(0.9)),
          ),
          SizedBox(height: 10.h),
          OneExperience(inputData: inputData),
          OneExperience(inputData: inputData)
        ],
      ),
    );
  }
}

class OneExperience extends StatelessWidget {
  const OneExperience({
    super.key,
    required this.inputData,
  });

  final String inputData;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Container(
              alignment: Alignment.center,
              height: 50.h,
              width: 50.h,
              decoration: BoxDecoration(
              shape:BoxShape.circle,
                  color: AppColors.secondaryColor.withOpacity(0.05)),
                  child: Text(overflow:TextOverflow.ellipsis,"MSS"),
            ),
            SizedBox(width:10.w),
            Column(
      crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Text(
                  "Senior Maths teacher",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 18.sp,
                      color: AppColors.primaryTextDarkColor.withOpacity(1)),
                ),
                Text(
                  "2020 - now",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w400,
                      color: AppColors.primaryTextDarkColor.withOpacity(0.7)),
                ),
              ],
            ),
          ],
        ),

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
    )
      ,
      SizedBox(height:20.h),
      TheLine(),
      SizedBox(height:20.h)
      ],
    );
  }
}
