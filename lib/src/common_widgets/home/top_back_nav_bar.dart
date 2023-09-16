import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/routing/app_navigation.dart';
import 'package:studdy/src/routing/navigation.dart';

class BackNavBar extends StatelessWidget {
  final String title;
  const BackNavBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: () {
            AppNavigationV2.goBack();
          },
          child:Container(
            padding: EdgeInsets.all(5.w),
            
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: AppColors.primaryDarkColor.withOpacity(0.1)
              )
            ),
            child: const Icon(Icons.arrow_back_rounded)),
        ),
        Expanded(
          child: Align(
            alignment: Alignment.center,
            child: Text(title),
          ),
        ),
      ],
    );


  }
}