import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/common_widgets/home/bottom_nav_bar.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';

import 'package:studdy/src/common_widgets/home/course_slider.dart';
class BookMarks extends StatelessWidget {
  const BookMarks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          bottomNavigationBar: BottomNavigation(initialIndex: 2,),
      body: Padding(padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
        child: SingleChildScrollView(
          child: Column(children: [
            BackNavBar(title: "Bookmarks",),
            SizedBox(height: 20.h),
            Container(
              height: 700.h,
              width: double.maxFinite,
              // color: Colors.red,
        
              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(10, (index) =>Container(
                    child: Course(
              imageUrl: "assets/images/home/image${index + 1}.jpg",
              stars: "4.5",
              title: "Course Title ${index + 1}",
              instructor: "Instructor Name",
              price: "\$180",
              tag: "Best Seller",
            ),
                  ))
              ),
            )
              )]),
        ),
    ));
  }
}