import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/common_widgets/home/bottom_nav_bar.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:studdy/src/common_widgets/home/course_slider.dart';

class BookMarks extends StatelessWidget {
  const BookMarks({Key? key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
      future: getUserBookmarks('1'), // Replace 'userId' with the actual user ID
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // While the future is resolving, show a loading indicator
          return Scaffold(
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        } else {
          if (snapshot.hasError) {
            // If an error occurred, display an error message
            return Scaffold(
              body: Center(
                child: Text('Error: ${snapshot.error}'),
              ),
            );
          } else {
            // If the future completed successfully, build the UI
            Map<String, dynamic> userBookmarks = snapshot.data!;
            return buildBookmarksUI(userBookmarks);
          }
        }
      },
    );
  }

  Widget buildBookmarksUI(Map<String, dynamic> userBookmarks) {
    List<Widget> courseWidgets = [
     
    ];

    userBookmarks.forEach((key, value) async {
      if (key == 'courseId') {
        List<dynamic> courseIds = value as List<dynamic>;
        for (var courseId in courseIds) {
          // Query the 'courses' collection where the courseId matches
          QuerySnapshot courseSnapshot = await FirebaseFirestore.instance
              .collection('course')
              .where('courseId', isEqualTo: courseId)
              .get();

          if (courseSnapshot.docs.isNotEmpty) {
            // Extract the course data
            Map<String, dynamic> courseData = courseSnapshot.docs.first.data() as Map<String, dynamic>;
            courseWidgets.add(
              Padding(
                padding: EdgeInsets.only(bottom: 20.w),
                child: Container(
                  child: Course(
                    largeImage: true,
                    id: courseData['courseId'],
                    imageUrl: courseData['imageUrl'],
                    stars: courseData['stars'],
                    title: courseData['courseName'],
                    instructor: courseData['instructorName'],
                    price: "\$${courseData['price']}",
                    tag: courseData['tag'],
                  ),
                ),
              ),
            );
    print(courseWidgets.length);

          } else {
            print('Bookmark ID: $courseId, Course not found');
          }
        }
      }
    });

    return Scaffold(
      bottomNavigationBar: BottomNavigation(initialIndex: 2),
      body: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              BackNavBar(title: "Bookmarks"),
              SizedBox(height: 20.h),
              Container(
                height: 700.h,
                width: double.maxFinite,
                child: SingleChildScrollView(
                  child: courseWidgets.length <1?Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Center(
                        child: Text("You have no bookmarks")
                      ),
                    ],
                  ):Column(
                    
                    children: courseWidgets,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<Map<String, dynamic>> getUserBookmarks(String userId) async {
    try {
      // Get a reference to the "bookmarks" collection
      CollectionReference bookmarksCollection =
          FirebaseFirestore.instance.collection('bookmarks');

      // Get the document snapshot for the user ID
      DocumentSnapshot userDocSnapshot =
          await bookmarksCollection.doc(userId).get();

      if (userDocSnapshot.exists) {
        // If the document exists, return the data as a Map
        return userDocSnapshot.data() as Map<String, dynamic>;
      } else {
        return {};
      }
    } catch (e) {
      print('Error retrieving user bookmarks: $e');
      // If an error occurred, return an empty Map
      return {};
    }
  }
}
