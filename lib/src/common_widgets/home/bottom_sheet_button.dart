
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/colors.dart';

class BottomSheetButton extends StatelessWidget {
  const BottomSheetButton({
    Key? key,
    required this.bottomSheetOnTap,
    required this.backgroundColor,
    this.textColor = const Color(0xFFFFFFFF),
    this.backgroundfill = true,
  }) : super(key: key);

  final Function() bottomSheetOnTap;
  final Color backgroundColor;
  final Color textColor;
  final bool backgroundfill;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        bottomSheetOnTap();
      },
      child: Container(
        height: 55.h,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          border: Border.all(width: 1, color: backgroundColor),
          color: backgroundfill ? backgroundColor : Colors.transparent,
          borderRadius: BorderRadius.circular(50.r),
        ),
        child: Center(
          child: Text(
            !backgroundfill
                ? "Close"
                : backgroundColor == AppColors.accentColor
                    ? "Task Completed"
                    : "Delete Task",
            style: TextStyle(
              color: backgroundfill ? textColor : backgroundColor,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      ),
    );
  }
}
