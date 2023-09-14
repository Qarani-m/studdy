// ignore_for_file: prefer_const_constructors

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/home/controllers/home_controller_main.dart';
import 'package:studdy/src/features/home/repository/navigation.dart';
import 'package:studdy/src/features/home/screens/notifications.dart';
import 'package:studdy/src/features/home/screens/search_page.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
    required this.screenSize,
    required this.mainController,
  });

  final Size screenSize;
  final HomeControllerMain mainController;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding:
          EdgeInsets.only(bottom: 15.h, right: 23.w, top: 40.h, left: 23.w),
      height: 250.h,
      width: screenSize.width,
      decoration: BoxDecoration(
          color: AppColors.primaryDarkColor,
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.r),
              bottomRight: Radius.circular(20.r))),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          SizedBox(
            height: 100,
            width: screenSize.width,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(
                        () => Text(
                          "Hi, ${mainController.userList[0].name ?? "NAME"} 👋",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge
                              ?.copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(
                        height: 7.h,
                      ),
                      Text(
                        "Let's start learning",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: Colors.white,
                              fontWeight: FontWeight.w300,
                            ),
                      )
                    ],
                  ),
                ),
                Container(
                    height: 50.h,
                    width: 50.h,
                    decoration: BoxDecoration(
                        color: Colors.white12,
                        borderRadius: BorderRadius.circular(15.r)),
                    child: GestureDetector(
                      onTap: () {},
                      child: Stack(
                        children: [
                          Positioned(
                            top: 50.h / 2 - 30.h / 2,
                            left: 50.h / 2 - 30.h / 2,
                            child: GestureDetector(
                              onTap: () {
                                // print("s");
                                AppNavigation.navigateTo(Notifications());
                              },
                              child: Icon(
                                Icons.notifications_active,
                                color: Colors.white,
                                size: 30.h,
                              ),
                            ),
                          ),
                          // Positioned(
                          //   top: 13.h,
                          //   right:15.h,
                          //   child: CircleAvatar(backgroundColor: Colors.red,radius: 4.h,)
                          //   )
                        ],
                      ),
                    ))
              ],
            ),
          ),
          SizedBox(
            height: 50,
            width: screenSize.width,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    // padding: EdgeInsets.only(left: 10.w, right: 10.w),
                    height: 70,
                    width: 270.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r)),
                    child: GestureDetector(
                      onTap: () {
                        AppNavigation.navigateTo(SearchPage());
                      },
                      child: Stack(
                        children: [
                          TextField(
                            readOnly: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    fontSize: 15.sp,
                                    color: AppColors.primaryDarkColor),
                            cursorColor: AppColors.primaryDarkColor,
                            decoration: InputDecoration(
                              hintText: "Search",
                              hintStyle: TextStyle(fontWeight: FontWeight.w300),
                              prefixIcon: Icon(
                                Icons.search,
                                size: 35.h,
                                color: AppColors.primaryDarkColor,
                              ),
                              // prefixIcon: SvgPicture.asset("assets/images/svg/search.svg",height: 10.h,),
                              contentPadding:
                                  EdgeInsets.only(bottom: 6.h, left: 10.w),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: const BorderSide(
                                      width: 0, color: Colors.white)),

                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: const BorderSide(
                                      width: 0, color: Colors.white)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(15.r),
                                  borderSide: const BorderSide(
                                      width: 0, color: Colors.white)),

                              //       )
                            ),
                          ),
                          GestureDetector(
                            onTap: (){AppNavigation.navigateTo(SearchPage());},
                            child: Container(
                                // padding: EdgeInsets.only(left: 10.w, right: 10.w),
                                height: 70,
                                width: 270.w,
                                decoration: BoxDecoration(
                                    color: Colors.transparent,
                                    borderRadius: BorderRadius.circular(10.r))),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      mainController.toggleFilterBar();
                    },
                    child: Container(
                        height: 70,
                        width: 50.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10.r)),
                        child: Icon(size: 30.h, Icons.tune_outlined)),
                  )
                ]),
          )
        ],
      ),
    );
  }
}
// 