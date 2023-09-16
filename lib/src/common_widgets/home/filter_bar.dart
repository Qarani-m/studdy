
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/home/controllers/home_controller_main.dart';


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
