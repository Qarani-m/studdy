import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:studdy/src/common_widgets/home/course_slider.dart';

class BookmarksController extends GetxController {
  RxList<Widget> courseWidgets = RxList<Widget>([]);
  RxMap<String, dynamic> userBookmarks = RxMap<String, dynamic>({});

  @override
  void onInit() {
    super.onInit();
    getUserBookmarks('1'); // Replace '1' with the actual user ID
  }

  Future<void> getUserBookmarks(String userId) async {
    try {
      // Get a reference to the "bookmarks" collection
      CollectionReference bookmarksCollection =
          FirebaseFirestore.instance.collection('bookmarks');

      // Get the document snapshot for the user ID
      DocumentSnapshot userDocSnapshot =
          await bookmarksCollection.doc(userId).get();

      if (userDocSnapshot.exists) {
        // If the document exists, set the data as a Map
        userBookmarks.value = userDocSnapshot.data() as Map<String, dynamic>;
        buildCourseWidgets();
      } else {
        userBookmarks.value = {};
      }
    } catch (e) {
      print('Error retrieving user bookmarks: $e');
      // If an error occurred, set an empty Map
      userBookmarks.value = {};
    }
  }

  void buildCourseWidgets() {
    courseWidgets.value = [];
    userBookmarks.value.forEach((key, value) async {
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
            Map<String, dynamic> courseData =
                courseSnapshot.docs.first.data() as Map<String, dynamic>;
            courseWidgets.value.add(
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
          } else {
            print('Bookmark ID: $courseId, Course not found');
          }
        }
      }
    });
  }
}