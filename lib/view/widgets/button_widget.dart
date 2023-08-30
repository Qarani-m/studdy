import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/view/widgets/text_widget.dart';

class ButtonLarge extends StatelessWidget {
  const ButtonLarge({
    super.key,
    this.buttonColor = const Color(0xFF1E232C),
    this.buttonBorderColor = const Color(0xFF1E232C),
    required this.text,
    this.textColor = Colors.white,
    required this.onTapFunction,
    // required this.fontSize
  });

  final Color buttonColor;
  final Color buttonBorderColor;
  final String text;
  final Color textColor;
  final Function()? onTapFunction;
  
  // final double fontSize;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapFunction,
      child: Container(
        alignment: Alignment.center,
        height: 56.h,
        width: 330.w,
        decoration: BoxDecoration(
            color: buttonColor,
            borderRadius: BorderRadius.circular(8.r),
            border: Border.all(color: buttonBorderColor, width: 1.5)),
        child: NormalText(
          text: text,
          color: textColor,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
