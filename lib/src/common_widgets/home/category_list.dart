import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';
import 'package:studdy/src/features/tutor/tutor_datails.dart';

class CategoryList extends StatelessWidget {
  const CategoryList({super.key});

  @override
  Widget build(BuildContext context) {
    final Map<String, dynamic> params = Get.arguments;
    final String category = params['name'];

    // Now you can use the category parameter as needed
    print("Category selected: $category");

    return Scaffold(
      body: Padding(
         padding:  EdgeInsets.only(left: 23.w,right:23.w, top: 50.h),
         child: Column(children:[
           BackNavBar(title: category,),
            SizedBox(height:20.h),

            Container(
              height: 700.h,
              width: double.maxFinite,
              // color: Colors.red,

              child: SingleChildScrollView(
                child: Column(
                  children: List.generate(10, (index) => CourseSearchResult()),
                ),
              ),
            )


         ]),

        ),
    );
  }
}