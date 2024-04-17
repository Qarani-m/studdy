import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class CoursesController extends GetxController{

Future<Map<String, dynamic>> getCourseDetails(String courseId) async {
  try {
    // Get a reference to the "courses" collection
    CollectionReference coursesCollection =
        FirebaseFirestore.instance.collection('courses');

    // Get the document snapshot for the given courseId
    DocumentSnapshot courseDocSnapshot =
        await coursesCollection.doc(courseId).get();

    if (courseDocSnapshot.exists) {
      // If the document exists, return the data as a Map
      return courseDocSnapshot.data() as Map<String, dynamic>;
    } else {
      print('Course not found: $courseId');
      return {};
    }
  } catch (e) {
    print('Error retrieving course details: $e');
    return {};
  }
}
  void addBookMark(String courseId){

  }

  void enroll(String courseId){

  }

}