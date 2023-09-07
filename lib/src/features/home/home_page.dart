import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer/shimmer.dart';
import 'package:studdy/src/common_widgets/home/heading_text.dart';
import 'package:studdy/src/common_widgets/home/stats_tab.dart';
import 'package:studdy/src/common_widgets/home/sub_menu.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/constants/text.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: 0,
        items: const [
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/home/apps.png")),
              label: "HOME"),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/home/calendar.png")),
              label: "HOME"),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/home/comment.png")),
              label: "HOME"),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/home/user.png")),
              label: "HOME"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.w, top: 64.h, right: 20.w),
              height: 362.h,
              width: 375.w,
              color: const Color(0xFFF3F5F8),
              child: Column(
                children: [
                  topBar(context),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 190.h,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatsTab(
                                  text1: AppText.homeStrings[1][0],
                                  text2: AppText.homeStrings[2][0],
                                  color: const Color(0xFFB45309)),
                              StatsTab(
                                  text1: AppText.homeStrings[1][1],
                                  text2: AppText.homeStrings[2][1],
                                  color: const Color(0xFF4178D4)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatsTab(
                                  text1: AppText.homeStrings[1][2],
                                  text2: AppText.homeStrings[2][2],
                                  color: const Color(0xFF52B6DF)),
                              StatsTab(
                                  text1: AppText.homeStrings[1][3],
                                  text2: AppText.homeStrings[2][3],
                                  color: const Color(0xFFF59E0B)),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            SizedBox(
              height: 80.h,
              width: 337.w,
              // color:Colors.red,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubMenu(
                    text: "Courses",
                    color: Color(0xFF316D86),
                    image: "assets/images/home/courses.png",
                  ),
                  SubMenu(
                    text: "Subject",
                    color: Color(0xFF27487F),
                    image: "assets/images/home/subjects.png",
                  ),
                  SubMenu(
                    text: "Class",
                    color: Color(0xFFF59E0B),
                    image: "assets/images/home/class.png",
                  ),
                  SubMenu(
                      text: "Presence",
                      color: Color(0xFF46BD84),
                      image: "assets/images/home/presence.png"),
                ],
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            Container(
              // color: Colors.blue,
              // height: 500.h,
              width: 327.w,
              child: Column(
                children: [
                  SizedBox(
                    // color: Colors.blue,
                    height: 55.h,
                    width: 327.w,
                    child: Row(children: [
                      SizedBox(
                        // color: Colors.amber,
                        height: 80.h,
                        width: 220.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            HeadingText(
                              text: "September 19, 2021",
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color:
                                  AppColors.primaryDarkColor.withOpacity(0.6),
                            ),
                            HeadingText(
                              text: "Today",
                              fontWeight: FontWeight.w600,
                              fontSize: 15.sp,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          width: 105.w,
                          decoration: BoxDecoration(
                            color: AppColors.primaryDarkColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: NormalText(
                            text: "+ Add Task",
                            color: const Color(0xFFF3F5F8),
                            fontSize: 15.sp,
                          ),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                    // color: Colors.blue,
                    height: 85.h,
                    width: 327.w,
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: const Color(0xFFff3d5c),
                      selectedTextColor: Colors.white,
                      monthTextStyle: const TextStyle(
                        color: AppColors.primaryDarkColor,
                        fontWeight: FontWeight.w600
                      ),
                      dayTextStyle: TextStyle(
                          color: AppColors.primaryDarkColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      dateTextStyle: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                      onDateChange: (date) {
                       
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  const OneSchedule(),
                  const OneSchedule(),
                  const OneSchedule(),
                  const OneSchedule(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 53.h,
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(
                text: AppText.homeStrings[0][0],
                fontSize: 20.sp,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                AppText.homeStrings[0][1],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const Image(image: AssetImage("assets/images/home/bell.png")),
        // )
      ],
    );
  }
}

class OneSchedule extends StatelessWidget {
  const OneSchedule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          // height: 110.h,
          width: 327.w,
          decoration: BoxDecoration(
              color: const Color(0xFFff3d5c),
              borderRadius: BorderRadius.circular(10.r)),
          child: Row(
            children: [
              Container(
                // height: 110.h,
                width: 290.w,
                padding: EdgeInsets.only(top: 10.h, left: 20.w, bottom: 12.h),
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeadingText(
                      text: "Learn Flutter",
                      color: const Color(0xFFF3F5F8),
                      fontSize: 15.sp,
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    Row(
                      children: [
                        const Icon(
                          Icons.lock_clock_sharp,
                          color: Color(0xFFF3F5F8),
                        ),
                        SizedBox(
                          width: 2.w,
                        ),
                        HeadingText(
                            text: "9:07pm - 9:59pm",
                            color: const Color(0xFFF3F5F8),
                            fontSize: 13.sp,
                            fontWeight: FontWeight.w400,
                            alignment: TextAlign.start)
                      ],
                    ),
                    SizedBox(
                      height: 12.h,
                    ),
                    HeadingText(
                        text:
                            "You must follow to learn flutter to improve yourself",
                        color: const Color(0xFFF3F5F8),
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        alignment: TextAlign.start),
                  ],
                ),
              ),
              Container(
                height: 130.h,
                width: 26.w,
                decoration: BoxDecoration(
                    // color: Colors.blue,
                    borderRadius: BorderRadius.circular(10.r)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      color: const Color(0xFFF3F5F8),
                      height: 90.h,
                      width: 1.w,
                    ),
                    const RotatedBox(
                        quarterTurns: 3, child: NormalText(text: "Todo"))
                  ],
                ),
              ),
              SizedBox(
                height: 20.h,
              )
            ],
          ),
        ),
        SizedBox(
          height: 20.h,
        )
      ],
    );
  }
}
