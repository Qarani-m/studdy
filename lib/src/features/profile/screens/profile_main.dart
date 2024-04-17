// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/common_widgets/home/bottom_nav_bar.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/home/controllers/home_controller_main.dart';
import 'package:studdy/src/features/profile/screens/faq.dart';
import 'package:firebase_auth/firebase_auth.dart';
class ProfileMain extends StatelessWidget {
   ProfileMain({super.key});

    HomeControllerMain mainController = Get.put(HomeControllerMain());




  @override
  Widget build(BuildContext context) {
    print(mainController.userList[0]);
    return Scaffold(
    bottomNavigationBar: BottomNavigation(initialIndex: 3,),
  
  
      body: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
        child: Column(children: [
          BackNavBar(title:""),
          SizedBox(height: 20.h),
          Container(
            height: 100.h,
            width: 100.w,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                image: AssetImage('assets/images/home/profile.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          SizedBox(height: 20.h),
          Details(icon: Icons.person, title: "${mainController.userList[0].name ?? "NAME"} "),
        SizedBox(height: 50.w),

          Details(icon: Icons.email, title: '${mainController.userList[0].email ?? "EMAIL"} '),
        SizedBox(height: 50.w),

          Details(icon: Icons.phone, title: '${mainController.userList[0].phone ?? "PHONE"} '),
        SizedBox(height: 50.w),
                  Details(icon: Icons.badge, title: '${mainController.userList[0].studentId ?? "Id"} '),
        SizedBox(height: 50.w),

  ButtonsWidget(
          
        )


        ]),
      ),
    );
  }
}


class Details extends StatelessWidget {
  final String title;
  final IconData icon;

   Details({
    Key? key,
    required this.title,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.0),
        border: Border.all(
          color: Colors.grey.shade300,
          width: 1.0,
        ),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 30.sp,
            color: Theme.of(context).primaryColor, // Use theme primary color for icon
          ),
          SizedBox(width: 20.w),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}



class ButtonsWidget extends StatelessWidget {
  


   ButtonsWidget({
    Key? key,

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
  onTap: () {
    Get.to(FaqPage());
  },
  child: Container(
    alignment: Alignment.center,
    padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
    decoration: BoxDecoration(
      color: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(10.0),
      border: Border.all(
        color: Colors.grey.shade300,
        width: 1.0,
      ),
    ),
    child: Text(
      'FAQs',
      style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: AppColors.inputFillColor),
    ),
  ),
),

        SizedBox(height: 20.h),
        GestureDetector(
          onTap: () async {
            await FirebaseAuth.instance.signOut();
          },
          child: Container(
            alignment:Alignment.center,
            width: double.maxFinite,
            height: 50.h,
            padding: EdgeInsets.symmetric(vertical: 14.0, horizontal: 24.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(10.0),
              border: Border.all(
                color: Colors.grey.shade300,
                width: 1.0,
              ),
            ),
            child: Text(
              'Logout',
              style:Theme.of(context).textTheme.bodyMedium?.copyWith(color:AppColors.inputFillColor,),
            ),
          ),
        ),
      ],
    );
  }
}