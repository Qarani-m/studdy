import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/common_widgets/home/bottom_nav_bar.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';
import 'package:studdy/src/features/bookmarks/bookmark_controller.dart';

class BookMarks extends StatelessWidget {
  final BookmarksController controller = Get.put(BookmarksController());

   BookMarks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        bottomNavigationBar: BottomNavigation(initialIndex: 2),
        body: Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                BackNavBar(title: "Bookmarks"),
                SizedBox(height: 20.h),
                Obx(()=>Container(
                    height: 700.h,
                    width: double.maxFinite,
                    child: SingleChildScrollView(
                      child: controller.courseWidgets.isEmpty
                          ? Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Text("You have no bookmarks"),
                                ),
                              ],
                            )
                          : Column(
                              children: controller.courseWidgets,
                            ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}