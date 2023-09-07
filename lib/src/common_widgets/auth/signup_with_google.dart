
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/constants/image_strings.dart';
class SignupWithGoogle extends StatelessWidget {
  const SignupWithGoogle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 50.h,
        decoration: BoxDecoration(
            border: Border.all(
                color: AppColors.primaryDarkColor),
            borderRadius: BorderRadius.circular(8.r)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(
              height: 25.h,
              image:const AssetImage(AppImages.googleLogoImage),
            ),
            SizedBox(width: 10.w),
            Text(
              " Sign-In With Google",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall
                  ?.copyWith(
                      color: AppColors.primaryDarkColor,
                      fontWeight: FontWeight.w500),
            )
          ],
        ));
  }
}