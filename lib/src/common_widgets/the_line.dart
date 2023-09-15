import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/constants/colors.dart';

class TheLine extends StatelessWidget {
  const TheLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height:0.5.h, width:327.w, color:AppColors.fadedTextColor.withOpacity(0.5)
    );
  }
}