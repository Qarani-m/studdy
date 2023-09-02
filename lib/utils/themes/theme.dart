// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/utils/constants/colors.dart';

class AppTheme {
  AppTheme._();
  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    fontFamily: "Poppins",
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    buttonTheme: ButtonThemeData(
      height: 56.h,
      buttonColor: AppColors.primaryDarkColor
    ),
    iconTheme: IconThemeData(
      color: AppColors.primaryDarkColor
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(//he jenny wilson
        fontFamily: "Poppins",
        color: AppColors.primaryDarkColor,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,

      ),
      titleLarge: TextStyle( //choose your topic of interest
        fontFamily: "Poppins",
        color: AppColors.primaryDarkColor,
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,

      ),
      bodyMedium: TextStyle( //signup
        fontFamily: "Poppins",
        color: AppColors.blackTextColor,
        fontWeight: FontWeight.w600,
        fontSize: 17.sp,

      ),
      bodySmall: TextStyle(//i agree with the terms
        fontSize: 13.sp,
fontFamily: 'Poppins',
fontWeight: FontWeight.w400,
height: 1.69,
letterSpacing: 0.20,
color:Colors.white.withOpacity(0.5)

      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputFillColor,
       border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(width: 0, color: AppColors.borderColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(width: 1.5, color: AppColors.borderColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(width: 1.5, color: AppColors.borderColor)),
        errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(width: 1.5, color: AppColors.errorColor)),

      errorStyle: TextStyle(
        fontSize: 35.sp, 
        fontWeight: FontWeight.w400,
        color: AppColors.errorColor ,
        fontFamily: "Poppins",

      ),


//       )

    )
  );
}

