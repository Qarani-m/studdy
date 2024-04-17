import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/common_widgets/home/bottom_nav_bar.dart';
import 'package:studdy/src/common_widgets/home/course_slider.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';

class MyCourses extends StatelessWidget {
  const MyCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar: BottomNavigation(initialIndex: 1,),
      body:SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
          child: Column(
            children: [
               const BackNavBar(title: "Enrolled Courses"),

              SizedBox(
                height: 20.h,),
              Container(
                height: 650.h,
                width: double.maxFinite,
                child: Column(
                  children: List.generate(2, (index) =>Padding(
                    padding:  EdgeInsets.only(bottom: 30.h),
                    child: Course(
                      largeImage:true,
                      imageUrl: "assets/images/home/image5.jpg",
                      stars: "4.5",
                      title: "Design Thinking Fundamentals",
                      instructor: "Robert green",
                      price: "180",
                      tag: "Best seller"),
                  ) ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}