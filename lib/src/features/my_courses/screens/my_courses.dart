import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:studdy/src/common_widgets/home/bottom_nav_bar.dart';
import 'package:studdy/src/common_widgets/home/course_slider.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';
import 'package:studdy/src/features/home/controllers/home_controller_main.dart';

class MyCourses extends StatefulWidget {
  MyCourses({super.key});

  @override
  _MyCoursesState createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  HomeControllerMain homePageController = Get.put(HomeControllerMain());
  List<String> userCourses = [];

  @override
  void initState() {
    super.initState();
    _fetchUserData();
  }

Future<void> _fetchUserData() async {
  bool dataFetchSuccess = false;
  try {
    final userId = homePageController.userList[0].studentId ?? "1";
    final userSnapshot = await FirebaseFirestore.instance
        .collection('users')
        .doc(userId)
        .get();
    if (userSnapshot.exists) {
      final userData = userSnapshot.data();
      if (userData != null && userData.containsKey('courses')) {
        final courseIDs = List<String>.from(userData['courses']);
        final coursesData = await _fetchCourseData(courseIDs);
        setState(() {
          userCourses = coursesData;
          dataFetchSuccess = true;
        });
      }
    }
  } catch (e) {
    print('Error fetching user data: $e');
  } finally {
    if (dataFetchSuccess) {
      print('User data and course data fetched successfully');
    } else {
      print('Error fetching user data or course data');
    }
  }
}

Future<List<Map<String, dynamic>>> _fetchCourseData(List<String> courseIDs) async {
  final coursesData = <Map<String, dynamic>>[];
  try {
    for (final courseId in courseIDs) {
      final courseSnapshot = await FirebaseFirestore.instance
          .collection('courses')
          .doc(courseId)
          .get();
      if (courseSnapshot.exists) {
        final courseData = courseSnapshot.data();
        if (courseData != null) {
          coursesData.add(courseData);
        }
      }
    }
  } catch (e) {
    print('Error fetching course data: $e');
  }
  return coursesData;
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigation(initialIndex: 1),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
          child: Column(
            children: [
              const BackNavBar(title: "Enrolled Courses"),
              SizedBox(height: 20.h),
              Container(
                height: 650.h,
                width: double.maxFinite,
                child: ListView.builder(
                  itemCount: userCourses.length,
                  itemBuilder: (context, index) {
                    final courseId = userCourses[index];
                    return Padding(
                      padding: EdgeInsets.only(bottom: 30.h),
                      child: Course(
                        id: courseId,
                        largeImage: true,
                        imageUrl: "assets/images/home/image5.jpg",
                        stars: "4.5",
                        title: "Design Thinking Fundamentals",
                        instructor: "Robert green",
                        price: "180",
                        tag: "Best seller",
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}