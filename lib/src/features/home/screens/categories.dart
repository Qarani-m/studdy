import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';
import 'package:studdy/src/features/home/controllers/category_controller.dart';

import '../../../common_widgets/home/category_tutur.dart';

class Categories extends StatelessWidget {
   Categories({super.key});

 final  CategoryController categoryController = Get.put(CategoryController());

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
    icon: "assets/images/svg/microscope.svg",
    text: "Biology",
    onTap: () => categoryController.seeAllCategories("Biology"),
  ),
  Category(
    icon: "assets/images/svg/medicine.svg",
    text: "Chemistry",
    onTap: () => categoryController.seeAllCategories("Chemistry"),
  ),
  Category(
    icon: "assets/images/svg/math.svg",
    text: "Math",
    onTap: () => categoryController.seeAllCategories("Math"),
  ),
  Category(
    icon: "assets/images/svg/globe.svg",
    text: "Geography",
    onTap: () => categoryController.seeAllCategories("Geography"),
  ),
]
,),
            SizedBox(height: 45.h,),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
  Category(
    icon: "assets/images/svg/code.svg",
    text: "Coding",
    onTap: () => categoryController.seeAllCategories("Coding"),
  ),
  Category(
    icon: "assets/images/svg/translate.svg",
    text: "English",
    onTap: () => categoryController.seeAllCategories("English"),
  ),
  Category(
    icon: "assets/images/svg/art.svg",
    text: "Art",
    onTap: () => categoryController.seeAllCategories("Art"),
  ),
  Category(
    icon: "assets/images/svg/music.svg",
    text: "Music",
    onTap: () => categoryController.seeAllCategories("Music"),
  ),
],),
            
      
          ],
        ),
      ),
    );
  }
}
