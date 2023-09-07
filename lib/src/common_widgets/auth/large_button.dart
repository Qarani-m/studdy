
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/constants/colors.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({
    super.key,
    required this.text,
    required this.background,
  });
  final String text;
  final bool background;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 54.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: background ? AppColors.darkColor : AppColors.whiteColor,
          border: Border.all(color: AppColors.darkColor)),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: background ? Colors.white : AppColors.blackTextColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}


class WelcomeButton2 extends StatelessWidget {
  const WelcomeButton2({
    super.key,
    required this.text,
    required this.background,
    required this.height,
    required this.width
  });
  final String text;
  final double? height;
  final double? width;
  final bool background;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: background ? AppColors.darkColor : AppColors.whiteColor,
          border: Border.all(color: AppColors.darkColor)),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
              color: background ? Colors.white : AppColors.blackTextColor,
              fontSize: 15.sp,
              fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
