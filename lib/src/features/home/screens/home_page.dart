// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studdy/src/common_widgets/home/category_tuturo.dart';
import 'package:studdy/src/common_widgets/home/course_slider.dart';
import 'package:studdy/src/common_widgets/home/right_left.dart';
import 'package:studdy/src/common_widgets/home/top_bar.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/authentication/repository/auth_helper.dart';
import 'package:studdy/src/features/home/controllers/home_controller_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeControllerMain mainController = Get.put(HomeControllerMain());

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        statusBarIconBrightness: Brightness.light, // Change to Brightness.light
      ),
    );
    Size screenSize = MediaQuery.of(context).size;
    mainController.getStudentFromLocalDb();
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(screenSize: screenSize, mainController: mainController),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Column(
                children: [
                  RightLeft(
                    left: "Categories",
                    right: "see all",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Category(
                        icon: "assets/images/svg/art.svg",
                        text: "Art",
                        onTap: () {},
                      ),
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
                    ],
                  ),
                  SizedBox(
                    height: 25.h,
                  ),
                  RightLeft(
                    left: "Popular courses",
                    right: "see all",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                ],
              ),
            ),

            CarouselSlider(
              options: CarouselOptions(height: 240.0, viewportFraction: 0.71),
              items: [1, 2, 3, 4, 5].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return Course(
                        imageUrl: "assets/images/home/image5.jpg",
                        stars: "4.5",
                        title: "Design Thinking Fundamentals",
                        instructor: "Robert green",
                        price: "180",
                        tag: "Best seller");
                  },
                );
              }).toList(),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 23.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 25.h,
                  ),
                  RightLeft(
                    left: "Top tutors",
                    right: "see all",
                    onTap: () {},
                  ),
                  SizedBox(
                    height: 15.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Tutor(
                        image: "assets/images/home/tutor1.jpg",
                        text: "Esther T.",
                        onTap: () {},
                      ),
                      Tutor(
                        image: "assets/images/home/tutor2.jpg",
                        text: "Jacob U.",
                        onTap: () {},
                      ),
                      Tutor(
                        image: "assets/images/home/tutor3.jpg",
                        text: "Michael K.",
                        onTap: () {},
                      ),
                      Tutor(
                        image: "assets/images/home/tutor4.jpg",
                        text: "Sofia R.",
                        onTap: () {},
                      ),
                    ],
                  )
                ],
              ),
            )

            // Testers()
          ],
        ),
      ),
    );
  }
}


class Testers extends StatelessWidget {
  Testers({super.key});
  HomeControllerMain mainController = Get.put(HomeControllerMain());
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Obx(() => Text(mainController.userList.isNotEmpty
            ? mainController.userList[0].id.toString()!
            : "empty")),
        Obx(() => Text(mainController.userList.isNotEmpty
            ? mainController.userList[0].name!
            : "empty")),
        Obx(() => Text(mainController.userList.isNotEmpty
            ? mainController.userList[0].email!
            : "empty")),
        Obx(() => Text(mainController.userList.isNotEmpty
            ? mainController.userList[0].phone!
            : "empty")),
        Obx(() => Text(mainController.userList.isNotEmpty
            ? mainController.userList[0].school!
            : "empty")),
        Obx(() => Text(mainController.userList.isNotEmpty
            ? mainController.userList[0].courses.toString()
            : "empty")),
        Obx(() => Text(mainController.userList.isNotEmpty
            ? mainController.userList[0].studentId!
            : "empty")),
        Obx(() => Text(mainController.userList.isNotEmpty
            ? mainController.userList[0].level!
            : "empty")),
        Obx(() => Text(mainController.userList.isNotEmpty
            ? mainController.userList[0].dob!
            : "empty")),
        TextButton(
            onPressed: () {
              AuthHelper.instance.signoutUser();
            },
            child: const Text("Sign Out")),
        const SizedBox(
          height: 100,
        ),
      ],
    ));
  }
}
