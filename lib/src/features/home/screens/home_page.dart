// ignore_for_file: prefer_const_constructors

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:shimmer/shimmer.dart';
import 'package:studdy/src/common_widgets/home/bottom_nav_bar.dart';
import 'package:studdy/src/common_widgets/home/category_tutur.dart';
import 'package:studdy/src/common_widgets/home/course_slider.dart';
import 'package:studdy/src/common_widgets/home/filter_bar.dart';
import 'package:studdy/src/common_widgets/home/right_left.dart';
import 'package:studdy/src/common_widgets/home/top_bar.dart';
import 'package:studdy/src/common_widgets/loader.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/models/tutor_model.dart';
import 'package:studdy/src/features/home/controllers/category_controller.dart';
import 'package:studdy/src/features/tutor/repository/tutor_db_helper.dart';
import 'package:studdy/src/features/home/controllers/home_controller_main.dart';
import 'package:studdy/src/features/home/controllers/navigation_controller.dart';
import 'package:studdy/src/features/tutor/tutor_datails.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeControllerMain mainController = Get.put(HomeControllerMain());
  HomeNavigationController homeNavigationController =
      Get.put(HomeNavigationController());
  @override
  Widget build(BuildContext context) {
    resetSystemUIOverlayStyle(Brightness.light);
    Size screenSize = Size(375.w, 812.h);
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
                    screenSize: screenSize,
                    mainController: mainController,
                    homeNavigationController: homeNavigationController,
                  ),
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
} // HomePageMain(screenSize: screenSize, mainController: mainController),

class HomePageMain extends StatelessWidget {
  HomePageMain({
    super.key,
    required this.screenSize,
    required this.mainController,
    required this.homeNavigationController,
  });

  final Size screenSize;
  final HomeControllerMain mainController;
  final HomeNavigationController homeNavigationController;

   final  CategoryController categoryController = Get.put(CategoryController());

  CourseHelper courseHelperController = Get.put(CourseHelper());

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
                onTap: () {
                  mainController.seeAllCategories();
                },
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
    onTap: () => categoryController.seeAllCategories("Art"),
  ),
  Category(
    icon: "assets/images/svg/medicine.svg",
    text: "Biology",
    onTap: () => categoryController.seeAllCategories("Biology"),
  ),
  Category(
    icon: "assets/images/svg/math.svg",
    text: "Math",
    onTap: () => categoryController.seeAllCategories("Math"),
  ),
  Category(
    icon: "assets/images/svg/dropper.svg",
    text: "Chemistry",
    onTap: () => categoryController.seeAllCategories("Chemistry"),
  ),
]
,
              ),
              SizedBox(
                height: 25.h,
              ),
              RightLeft(
                left: "Popular courses",
                right: "",
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
                right: "",
                onTap: () {},
              ),
              SizedBox(
                height: 15.h,
              ),
              FutureBuilder(
                  future: mainController.geTtopTutors(),
                  builder: (BuildContext context, AsyncSnapshot snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Text("waiting"); // or another loading widget
                    } else if (snapshot.hasError) {
                      return Text("Errore---->{snapshot.error}");
                    } else {
                      return Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 100,
                            width: 327.w,
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(4, (index) {
                                  final tutorData = courseHelperController
                                      .topTutorsData[index];
                                  return Row(
                                    children: [
                                      Tutor(
                                        tutorModel: TutorModel(
                                          tutorName: tutorData["name"],
                                          tutorImageUrl: tutorData["imageUrl"],
                                          tutorId: tutorData["tutorId"],
                                        ),
                                      ),
                                      // SizedBox(width: 12.w,)
                                    ],
                                  );
                                })),
                          ),
                        ],
                      );

                    }
                  }),
              SizedBox(
                height: 15.h,
              ),
              RightLeft(
                left: "Free courses",
                right: "",
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
        Padding(
            padding:  EdgeInsets.only(left:23.w, right: 23.w),
          child: RightLeft(
            left: "Continue learning",
            right: "",
            onTap: () {},
          ),
        ),
        SizedBox(
          height: 15.h,
        ),

        Column(
          children: List.generate(3, (index) =>Padding(
            padding:  EdgeInsets.only(left:23.w, right: 23.w),
            child: CourseSearchResult(),
          ) ),

        )
,
        SizedBox(
          height: 15.h,
        )

        // Testers()
      ],
    );
  }
}
