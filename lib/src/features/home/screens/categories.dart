import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';

import '../../../common_widgets/home/category_tutur.dart';

class Categories extends StatelessWidget {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 23.w, vertical: 50.h),

        child: Column(
          children: [
            const BackNavBar(title: "Categories",),
            SizedBox(height:20.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Category(
                      icon: "assets/images/svg/medicine.svg",
                      text: "Biology",
                      onTap: () {}),
                      
                      Category(
                      icon: "assets/images/svg/medicine.svg",
                      text: "Biology",
                      onTap: () {}),
                  Category(
                      icon: "assets/images/svg/math.svg",
                      text: "Math",
                      onTap: () {}),
                  Category(
                      icon: "assets/images/svg/dropper.svg",
                      text: "Chemistry",
                      onTap: () {})
            ],),
            SizedBox(height: 25.h,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Category(
                      icon: "assets/images/svg/medicine.svg",
                      text: "Biology",
                      onTap: () {}),
                      
                      Category(
                      icon: "assets/images/svg/medicine.svg",
                      text: "Biology",
                      onTap: () {}),
                  Category(
                      icon: "assets/images/svg/math.svg",
                      text: "Math",
                      onTap: () {}),
                  Category(
                      icon: "assets/images/svg/dropper.svg",
                      text: "Chemistry",
                      onTap: () {})
            ],),
            SizedBox(height: 25.h,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Category(
                      icon: "assets/images/svg/medicine.svg",
                      text: "Biology",
                      onTap: () {}),
                      
                      Category(
                      icon: "assets/images/svg/medicine.svg",
                      text: "Biology",
                      onTap: () {}),
                  Category(
                      icon: "assets/images/svg/math.svg",
                      text: "Math",
                      onTap: () {}),
                  Category(
                      icon: "assets/images/svg/dropper.svg",
                      text: "Chemistry",
                      onTap: () {})
            ],),
            SizedBox(height: 25.h,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Category(
                      icon: "assets/images/svg/medicine.svg",
                      text: "Biology",
                      onTap: () {}),
                      
                      Category(
                      icon: "assets/images/svg/medicine.svg",
                      text: "Biology",
                      onTap: () {}),
                  Category(
                      icon: "assets/images/svg/math.svg",
                      text: "Math",
                      onTap: () {}),
                  Category(
                      icon: "assets/images/svg/dropper.svg",
                      text: "Chemistry",
                      onTap: () {})
            ],)
      
          ],
        ),
      ),
    );
  }
}
