// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/common_widgets/home/search_result.dart';
import 'package:studdy/src/common_widgets/tutor/one_tutor.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/routing/navigation.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    TabController tabController = TabController(length: 2, vsync: this);
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          AppNavigation.goBackHome();
                        },
                        child: Container(
                            padding: EdgeInsets.all(7.w),
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                    color: AppColors.primaryDarkColor
                                        .withOpacity(0.1))),
                            child: const Icon(Icons.arrow_back_rounded)),
                      ),
                      SizedBox(width: 10.w),
                      SizedBox(
                        width: 280.w,
                        child: TextField(
                          // autofocus: true,
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

                            // prefixIcon: SvgPicture.asset("assets/images/svg/search.svg",height: 10.h,),
                            contentPadding:
                                EdgeInsets.only(bottom: 6.h, left: 10.w),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: const BorderSide(
                                    width: 0, color: Colors.black)),

                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: const BorderSide(
                                    width: 0, color: Colors.black)),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15.r),
                                borderSide: const BorderSide(
                                    width: 0, color: Colors.white)),

                            //       )
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 15.h),
                  // RecentSearches()
                  Container(
                      child: TabBar(
                          labelColor: AppColors.primaryDarkColor,
                          controller: tabController,
                          indicatorColor: AppColors.primaryDarkColor,
                          indicatorSize: TabBarIndicatorSize.tab,
                          indicatorWeight: 5,
                          tabs: [
                        Tab(
                          child: Text("Courses"),
                        ),
                        Tab(
                          child: Text("Tutors"),
                        )
                      ])),
                  SizedBox(
                      width: double.maxFinite.w,
                      height: 650.h,
                      child: TabBarView(controller: tabController, children: [
                        Container(
                          child: SingleChildScrollView(
                            child: Column(children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Result for \"Design\""),
                                  Text(
                                    "53 results found",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.primaryDarkColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Column(children: [
                                CourseSearchResult(),
                              ])
                            ]),
                          ),
                        ),
                        Container(
                          child: SingleChildScrollView(
                            child: Column(children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Result for \"Design\""),
                                  Text(
                                    "53 results found",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(
                                            fontSize: 14.sp,
                                            color: AppColors.primaryDarkColor),
                                  )
                                ],
                              ),
                              SizedBox(
                                height: 20.h,
                              ),
                              Column(children: [
                                OneTutor(),
                              ])
                            ]),
                          ),
                        )
                      ])),
                ],
              ),
            )));
  }
}
