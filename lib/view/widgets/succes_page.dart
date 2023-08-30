import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/view/widgets/button_widget.dart';
import 'package:studdy/view/widgets/text_widget.dart';

class SuccessPage extends StatelessWidget {
  const SuccessPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.buttonText,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final String buttonText;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 23.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image(image: AssetImage("assets/images/Successmark.png")),
          SizedBox(
            height: 30.h,
          ),

          PageLargeText(text: title),
          SizedBox(
            height: 5.h,
          ),
          // NormalText(text: subtitle, color: primaryDarkColor.withOpacity(0.6),),
          NormalText(
              fontWeight: FontWeight.w400,
              color: Color(0xFF8391A1),
              text: subtitle),
          NormalText(
              fontWeight: FontWeight.w400,
              color: Color(0xFF8391A1),
              text: "successfully"),
          SizedBox(
            height: 30.h,
          ),
          ButtonLarge(text: buttonText, onTapFunction: onTap)
        ],
      ),
    );
  }
}
