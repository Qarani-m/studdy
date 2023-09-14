// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studdy/src/common_widgets/home/category_tuturo.dart';
import 'package:studdy/src/common_widgets/home/course_slider.dart';
import 'package:studdy/src/common_widgets/home/right_left.dart';
import 'package:studdy/src/common_widgets/home/top_bar.dart';
import 'package:studdy/src/common_widgets/loader.dart';
import 'package:studdy/src/constants/colors.dart';
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
    Size screenSize = Size(375.w,812.h );
    mainController.getStudentFromLocalDb();
    return Scaffold(
      bottomNavigationBar: BottomNavigation(),
      body: SingleChildScrollView(
        child: FutureBuilder(
            future: mainController.getStudentFromLocalDb(),
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return SizedBox(
                  height: screenSize.height,
                  width: screenSize.width,
                  child: Loader(),
                );
              } else {
                return Stack(children: [
                  HomePageMain(
                      screenSize: screenSize, mainController: mainController),
                  Obx(
                    () => Positioned(
                        top: 240.h,
                        right: 7.w,
                        child: mainController.showFilterBar.value
                            ? FilterBar(
                                mainController: mainController,
                              )
                            : Container()),
                  )
                ]);
              }
            }),
      ),
    );
  }
}

class FilterBar extends StatelessWidget {
  const FilterBar({
    required this.mainController,
    super.key,
  });
  final HomeControllerMain mainController;

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      opacity: 1,
      duration: Duration(milliseconds: 9000),
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 4.w),
        width: 200.w,
        height: 130.h,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20.r),
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
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
                onTap: () {
                  mainController.searchFilter = "courses";
                  mainController.toggleFilterBar();
                },
                child: const Text("Courses")),
            Container(
              height: 1.h,
              width: 200,
              color: AppColors.primaryDarkColor.withOpacity(0.1),
            ),
            GestureDetector(
                onTap: () {
                  mainController.searchFilter = "tutor";
                  mainController.toggleFilterBar();
                },
                child: const Text("Tutors")),
            Container(
              height: 1.h,
              width: 200,
              color: AppColors.primaryDarkColor.withOpacity(0.1),
            ),
            GestureDetector(
                onTap: () {
                  mainController.searchFilter = "free";
                  mainController.toggleFilterBar();
                },
                child: Text("Free")),
          ],
        ),
      ),
    );
  }
}





class BottomNavigation extends StatefulWidget {
  const BottomNavigation({super.key});

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  var _currentIndex = 0;
  var _selectedColor = AppColors.primaryDarkColor;
  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) => setState(() => _currentIndex = i),
      items: [
        /// Home
        SalomonBottomBarItem(
          icon: SvgPicture.asset(
            "assets/images/svg/home.svg",
            color: _selectedColor,
            height: 20.h,
          ),
          title: Text("Home"),
          selectedColor: _selectedColor,
        ),

        /// Likes
        SalomonBottomBarItem(
          icon: SvgPicture.asset("assets/images/svg/book.svg",
              color: _selectedColor, height: 20.h),
          title: Text("Courses"),
          selectedColor: _selectedColor,
        ),

        /// Search
        SalomonBottomBarItem(
          icon: Icon(
            Icons.bookmark,
            size: 20.h,
          ),
          // icon: SvgPicture.asset("assets/images/svg/home.svg", color: _selectedColor,),
          title: Text("Bookmarks"),
          selectedColor: _selectedColor,
        ),

        SalomonBottomBarItem(
          icon: SvgPicture.asset("assets/images/svg/comment.svg",
              color: _selectedColor, height: 20.h),
          title: Text("Chat"),
          selectedColor: _selectedColor,
        ),

        /// Profile
        SalomonBottomBarItem(
          icon: SvgPicture.asset("assets/images/svg/user.svg",
              color: _selectedColor, height: 20.h),
          title: Text("Profile"),
          selectedColor: _selectedColor,
        ),
      ],
    );
  }
}
// HomePageMain(screenSize: screenSize, mainController: mainController),

class HomePageMain extends StatelessWidget {
  const HomePageMain({
    super.key,
    required this.screenSize,
    required this.mainController,
  });

  final Size screenSize;
  final HomeControllerMain mainController;

  @override
  Widget build(BuildContext context) {
    return Column(
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
                onTap: () {mainController.seeAllCategories();},
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
              ),
              SizedBox(
                height: 15.h,
              ),
              RightLeft(
                left: "Free courses",
                right: "see all",
                onTap: () {},
              ),
            ],
          ),
        ),
        SizedBox(
          height: 15.h,
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
        SizedBox(
          height: 15.h,
        ),

        // Testers()
      ],
    );
  }
}

