import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/constants/colors.dart';

class RightLeft extends StatelessWidget {
  final String right;
  final String left;
  final Function onTap;
  const RightLeft({
    required this.left,
    required this.right,
    required this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Text(
          left,
          style: Theme.of(context)
              .textTheme
              .titleMedium
              ?.copyWith(fontSize: 18.sp),
        ),
      ),
      GestureDetector(
        onTap: () {
          onTap();
        },
        child: Text(
          right,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(color: AppColors.primaryColor, fontSize: 14.sp),
        ),
      )
    ]);
  }
}