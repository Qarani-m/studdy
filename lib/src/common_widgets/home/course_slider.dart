import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/home/controllers/home_controller_main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Course extends StatelessWidget {
              final String price;
              final String tag;
              final String instructor;
              final String title;
              final String stars;
              final String imageUrl;
               final bool largeImage;  // Optional parameter
               final String id;

    HomeControllerMain mainController = Get.put(HomeControllerMain());


   Course({
      this.largeImage = false,
    super.key, required this.price, required this.tag, required this.instructor, required this.title, required this.stars, required this.imageUrl, required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ,
      child: SizedBox(
          height:largeImage? 260.h: 260.h,
          width: largeImage? double.maxFinite: 250.w,
          // color: Colors.red,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.symmetric(
                    horizontal: 10.w, vertical: 10.w),
                alignment: Alignment.topCenter,
                height: largeImage? 165.h:150.h,
                width: largeImage? double.maxFinite:250.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.r),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image:
                            AssetImage(imageUrl))),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: 7.w, vertical: 3.w),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7.r)),
                      child: Row(
                        children: [
                          Icon(Icons.star, color: AppColors.primaryColor),
                          Text(
                            stars,
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall
                                ?.copyWith(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14.sp),
                          )
                        ],
                      ),
                    ),
                    GestureDetector(
    onTap: () async {
      String courseId = id;
      String userId = mainController.userList[0].studentId ?? "1";
    
      try {
      // Get a reference to the "bookmarks" collection
      CollectionReference bookmarksCollection =
          FirebaseFirestore.instance.collection('bookmarks');
    
      // Check if a document with the user ID exists
      DocumentSnapshot userDocSnapshot =
          await bookmarksCollection.doc(userId).get();
    
      if (userDocSnapshot.exists) {
        // If the document exists, update the courseId array field
        await bookmarksCollection.doc(userId).update({
          'courseId': FieldValue.arrayUnion([courseId])
        });
        print('Bookmark added to existing document successfully');
      } else {
        // If the document doesn't exist, create a new document
        await bookmarksCollection.doc(userId).set({
          'courseId': [courseId],
          'userId': userId,
        });
        print('New bookmark document created successfully');
      }
      } catch (e) {
      print('Error saving bookmark: $e');
      }
    },
                  child: Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 5.w, vertical: 3.w),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(7.r)),
                        child: Icon(Icons.bookmark),
                      ),
                    )
                  ],
                ),
              ),
               SizedBox(
            // color:Colors.amber,
            height: 68.h,
            width: largeImage? double.maxFinite:250.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Text(title),
              SizedBox(height: 0.h,),
              Row(children: [
                Icon(Icons.person_rounded),
                SizedBox(width: 10.w,),
                Text(instructor,style:Theme.of(context).textTheme.bodySmall)
              ],),
              SizedBox(height: 4.h,),
    
              Row(children: [
              Text("Ksh$price"),
              SizedBox(width:10.w),
              Container(
                alignment: Alignment.center,
                padding: EdgeInsets.symmetric(horizontal: 8.w,),
                decoration: BoxDecoration(
                  color: AppColors.primaryColor.withOpacity(0.095),
                  borderRadius: BorderRadius.circular(10.r)
                ),
                child:  Center(child: Text(tag,style:Theme.of(context).textTheme.bodySmall?.copyWith(color:AppColors.primaryColor))),
              )
              ],)
              
            ]),
          )
            ],
          )),
    );
  }
}
