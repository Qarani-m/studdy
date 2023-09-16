import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/models/tutor_model.dart';

class CourseHelper extends GetxController{
  static CourseHelper get instance => Get.find();
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  RxList<TutorModel> topTutors = <TutorModel>[].obs;
  List<Map<String, dynamic>> topTutorsData = [];





  Future<List<Map<String , dynamic>>> getTopTutors()async{
    try{
      final QuerySnapshot querySnapshot = await FirebaseFirestore.instance
        .collection('tutor')
        .orderBy('studentCount', descending: true)
        .limit(4) 
        .get();
      for (QueryDocumentSnapshot doc in querySnapshot.docs) {
          topTutorsData.assignAll(querySnapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList());

      }
      print(topTutorsData.length);

    return topTutorsData;

  } catch (error) {
    print('Error getting top tutors: $error');
    return [];
  }

  }











  static _warningSnackBar(String title, String message) {
    return Get.snackbar(
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.only(bottom: 5.h),
        maxWidth: 327.w,
        title,
        message,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryDarkColor.withOpacity(0.8));
  }
}
