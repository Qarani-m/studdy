// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutable, prefer_const_literals_to_create_immutables
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/constants/colors.dart';
import 'package:flux_store/constants/colors.dart';
import 'package:flux_store/constants/text_strings.dart';
import 'package:flux_store/view/widgets/button_widget.dart';
import 'package:flux_store/view/widgets/text_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime _selectDate = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        items: [
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
              padding: EdgeInsets.only(left: 24.w, top: 64.h, right: 24.w),
              height: 362.h,
              width: 375.w,
              color: homeHeaderContainer,
              child: Container(
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
                                    text1: homeStrings[1][0],
                                    text2: homeStrings[2][0],
                                    color: Color(0xFFB45309)),
                                StatsTab(
                                    text1: homeStrings[1][1],
                                    text2: homeStrings[2][1],
                                    color: Color(0xFF4178D4)),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                StatsTab(
                                    text1: homeStrings[1][2],
                                    text2: homeStrings[2][2],
                                    color: Color(0xFF52B6DF)),
                                StatsTab(
                                    text1: homeStrings[1][3],
                                    text2: homeStrings[2][3],
                                    color: Color(0xFFF59E0B)),
                              ],
                            ),
                          ]),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            SizedBox(
              height: 80.h,
              width: 337.w,
              // color:Colors.red,
              child: Row(
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
            // Padding(
            //   padding: EdgeInsets.only(left: 24.h),
            //   child: Row(
            //     children: [
            //       HeadingText(
            //         text: "Scedule",
            //         fontSize: 15.sp,
            //       )
            //     ],
            //   ),
            // ),
            SizedBox(
              height: 13.h,
            ),
            Container(
              // color: Colors.red,
              height: 500.h,
              width: 327.w,
              child: Column(
                children: [
                  Container(
                    // color: Colors.blue,
                    height: 55.h,
                    width: 327.w,
                    child: Row(children: [
                      Container(
                        // color: Colors.amber,
                        height: 80.h,
                        width: 220.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            HeadingText(
                              text: "September 19, 2021",
                              fontSize: 17.sp,
                              fontWeight: FontWeight.w600,
                              color: primaryDarkColor.withOpacity(0.6),
                            ),
                            HeadingText(
                              text: "Today",
                              fontWeight: FontWeight.w800,
                              fontSize: 21.sp,
                            )
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 56.h,
                          width: 105.w,
                          decoration: BoxDecoration(
                            color: primaryColor,
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: NormalText(
                            text: "+ Add Task",
                            color: homeHeaderContainer,
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
                    height: 75.h,
                    width: 327.w,
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: primaryColor,
                      selectedTextColor: Colors.white,
                      monthTextStyle: TextStyle(
                        color: primaryDarkColor,

                      ) ,
                      dayTextStyle:  TextStyle(
                        color: primaryDarkColor

                      ),
                      dateTextStyle: TextStyle(
                        fontSize:20.sp,
                        fontWeight: FontWeight.w600,
                        color: Colors.grey

                      ),
                      onDateChange: (date) {
                        // New date selected
                        setState(() {
                          _selectDate = date;
                        });
                      },
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  OneSchedule()
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

// -----------------------------------------------------------------------------------------------------------------------------------------------------

  Container topBar(BuildContext context) {
    return Container(
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 53.h,
            // color: Colors.amber,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                HeadingText(
                  text: homeStrings[0][0],
                  fontSize: 20.sp,
                ),
                SizedBox(
                  height: 3.h,
                ),
                Text(
                  homeStrings[0][1],
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
          ),
          Container(
              child: Image(image: AssetImage("assets/images/home/bell.png"))),
          // )
        ],
      ),
    );
  }
}

class OneSchedule extends StatelessWidget {
  const OneSchedule({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      // height: 110.h,
      width: 327.w,
      decoration: BoxDecoration(
          color: Color(0xFFff3d5c), borderRadius: BorderRadius.circular(10.r)),
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
                Container(
                  child: HeadingText(
                    text: "Learn Flutter",
                    color: homeHeaderContainer,
                    fontSize: 15.sp,
                  ),
                ),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                    child: Row(
                  children: [
                    Icon(
                      Icons.lock_clock_sharp,
                      color: homeHeaderContainer,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    HeadingText(
                        text: "9:07pm - 9:59pm",
                        color: homeHeaderContainer,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        alignment: TextAlign.start)
                  ],
                )),
                SizedBox(
                  height: 12.h,
                ),
                Container(
                    child: HeadingText(
                        text:
                            "You must follow to learn flutter to improve yourself",
                        color: homeHeaderContainer,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.w400,
                        alignment: TextAlign.start)),
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
                  color: homeHeaderContainer,
                  height: 90.h,
                  width: 1.w,
                ),
                RotatedBox(quarterTurns: 3, child: NormalText(text: "Todo"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class SubMenu extends StatelessWidget {
  final String text;
  final Color color;
  final String image;
  const SubMenu({
    super.key,
    required this.text,
    required this.color,
    this.image = "assets/images/home/subjects.png",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(17.r)),
            child: Center(child: Image(image: AssetImage(image))),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}

class StatsTab extends StatelessWidget {
  final Color color;
  final String text1;
  final String text2;
  const StatsTab(
      {super.key,
      required this.color,
      required this.text1,
      required this.text2});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18.w, top: 20.h),
      height: 90.h,
      width: 158.1.w,
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("val", style: Theme.of(context).textTheme.displayLarge),
          Text(text1,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                  color: color)),

          Text(
            text2,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}
