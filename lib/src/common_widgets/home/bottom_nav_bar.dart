import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:get/get.dart';
import 'package:studdy/src/features/bookmarks/bookmarks.dart';
import 'package:studdy/src/features/home/screens/home_page.dart';
import 'package:studdy/src/features/my_courses/screens/my_courses.dart';
import 'package:studdy/src/features/profile/screens/profile_main.dart';

class BottomNavigation extends StatefulWidget {
  final int initialIndex; // Add initialIndex parameter

  const BottomNavigation({Key? key, required this.initialIndex})
      : super(key: key);

  @override
  State<BottomNavigation> createState() => _BottomNavigationState();
}

class _BottomNavigationState extends State<BottomNavigation> {
  late int _currentIndex; // Define _currentIndex as a late variable
  var _selectedColor = AppColors.primaryDarkColor;

  // Define routes for each page
  final List<Widget> _pages = [
    HomePage(),
    MyCourses(),
    BookMarks(),
    ProfileMain(),
  ];

  @override
  void initState() {
    super.initState();
    // Initialize _currentIndex with the initialIndex provided
    _currentIndex = widget.initialIndex;
  }

  @override
  Widget build(BuildContext context) {
    return SalomonBottomBar(
      currentIndex: _currentIndex,
      onTap: (i) {
        // Update current index
        setState(() => _currentIndex = i);
        // Navigate to the corresponding page
        Get.to(_pages[i]);
      },
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
          icon: SvgPicture.asset("assets/images/svg/user.svg",
              color: _selectedColor, height: 20.h),
          title: Text("Profile"),
          selectedColor: _selectedColor,
        ),
      ],
    );
  }
}
