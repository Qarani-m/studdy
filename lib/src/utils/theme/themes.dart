import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/constants/colors.dart';

class AppTheme{
  AppTheme._();
  static const swatch = MaterialColor(0xFFF50057, <int , Color>{
            50: Color(0x1AF50057),
            100: Color(0x33F50057),
            200: Color(0x4DF50057),
            300: Color(0x66F50057),
            400: Color(0x80F50057),
            500: Color(0xFFF50057),
            600: Color(0x99F50057),
            700: Color(0xB3F50057),
            800: Color(0xCCF50057),
            900: Color(0xE6F50057),
            
          });


  static final lightTheme = ThemeData(
    brightness: Brightness.light,
    primarySwatch: Colors.teal,
    fontFamily: "Poppins",
    primaryColor: AppColors.primaryColor,
    primaryColorLight: AppColors.primaryColor,
    buttonTheme: ButtonThemeData(
      height: 56.h,
      buttonColor: AppColors.primaryDarkColor
    ),
    iconTheme: const IconThemeData(
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
color:AppColors.blackTextColor.withOpacity(0.5)

      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputFillColor,
       border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(width: 0, color: AppColors.secondaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(width: 1.5, color: AppColors.secondaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(width: 1.5, color: AppColors.secondaryColor)),
        errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: const BorderSide(width: 1.5, color: AppColors.errorColor)),

      errorStyle: TextStyle(
        fontSize: 35.sp, 
        fontWeight: FontWeight.w400,
        color: AppColors.errorColor ,
        fontFamily: "Poppins",

      ),


//       )

    )
  );







  static final darkTheme = ThemeData(
    brightness: Brightness.dark,
    primarySwatch: swatch,
    fontFamily: "Poppins",
    buttonTheme: ButtonThemeData(
      height: 56.h,
      buttonColor: const Color.fromARGB(255, 220, 187, 24)
    ),
    iconTheme: const IconThemeData(
      color: AppColors.cardBgColor
    ),
    textTheme: TextTheme(
      titleMedium: TextStyle(//he jenny wilson
        fontFamily: "Poppins",
        color: AppColors.cardBgColor,
        fontWeight: FontWeight.w600,
        fontSize: 20.sp,

      ),
      titleLarge: TextStyle( //choose your topic of interest
        fontFamily: "Poppins",
        color: AppColors.cardBgColor,
        fontWeight: FontWeight.w600,
        fontSize: 24.sp,

      ),
      bodyMedium: TextStyle( //signup
        fontFamily: "Poppins",
        color: AppColors.cardBgColor,
        fontWeight: FontWeight.w600,
        fontSize: 17.sp,

      ),
      bodySmall: TextStyle(//i agree with the terms
        fontSize: 13.sp,
fontFamily: 'Poppins',
fontWeight: FontWeight.w400,
height: 1.69,
letterSpacing: 0.20,
color:Colors.black.withOpacity(0.7)

      )
    ),
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: AppColors.inputFillColor,
      
      
       border: OutlineInputBorder(

              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(width: 0, color: AppColors.secondaryColor)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(width: 1.5, color: AppColors.secondaryColor)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(width: 1.5, color: AppColors.secondaryColor)),
        errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8.r),
              borderSide: const BorderSide(width: 1.5, color: AppColors.errorColor)),

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