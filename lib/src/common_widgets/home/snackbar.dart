  import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/constants/colors.dart';



class CustomSnackBar{
GetSnackBar snackBar(String text) {
    return GetSnackBar(
      messageText: Center(
        child: Text(
          text,
          style: TextStyle(
              color: Colors.white,
              fontSize: 13.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
      duration: const Duration(seconds: 10),
      backgroundColor: AppColors.primaryColor.withOpacity(1),
      margin: const EdgeInsets.all(10),
      borderRadius: 50,
      snackStyle: SnackStyle.GROUNDED,
      isDismissible: true,
    );
  }
}