
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:studdy/src/constants/colors.dart';

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

        // SalomonBottomBarItem(
        //   icon: SvgPicture.asset("assets/images/svg/comment.svg",
        //       color: _selectedColor, height: 20.h),
        //   title: Text("Chat"),
        //   selectedColor: _selectedColor,
        // ),

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
