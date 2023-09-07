import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsTab extends StatelessWidget {
  final Color color;
  final String text1;
  final String text2;
  const StatsTab(
      {super.key,
      required this.color,
      required this.text1,
      required this.text2});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 18.w, top: 20.h),
      height: 90.h,
      width: 158.1.w,
      decoration: BoxDecoration(
          color: Color(0xFFFFFFFF), borderRadius: BorderRadius.circular(10.r)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text("val", style: Theme.of(context).textTheme.displayLarge),
          Text(text1,
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  height: 1.4,
                  color: color)),

          Text(
            text2,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}