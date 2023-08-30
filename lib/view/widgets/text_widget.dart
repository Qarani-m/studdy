import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/constants/colors.dart';

class NormalText extends StatelessWidget {
  const NormalText(
      {super.key,
      required this.text,
      this.color = Colors.white,
      this.fontSize = 15,
      this.fontWeight = FontWeight.w600,
      this.decoration = TextDecoration.none});
  final Color color;
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final TextDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
          fontSize: fontSize,
          color: color,
          fontFamily: "Poppins",
          fontWeight: fontWeight,
          decoration: decoration),
    );
  }
}

class HeadingText extends StatelessWidget {
  const HeadingText({
    super.key,
    required this.text,
    this.fontSize = 15,
    this.fontWeight = FontWeight.bold, this.color=const Color(0xCC0F172A), 
    this.alignment = TextAlign.center,
  });
  final String text;
  final double fontSize;
  final FontWeight fontWeight;
  final Color color;
  final TextAlign alignment;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: alignment,
      style: TextStyle(
          color: color,
          fontWeight: fontWeight,
          
          fontSize: fontSize),
    );
  }
}

class PageLargeText extends StatelessWidget {
  const PageLargeText({
    super.key,
    required this.text,
    this.fontWeight = FontWeight.w600,
    // this.fontSize= const 30.sp,
  });
  final String text;
  final FontWeight fontWeight;
  // final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: TextStyle(
        color: Color(0xFF1E232C),
        fontSize: 25.sp,
        fontFamily: 'Poppins',
        fontWeight: fontWeight,
        height: 1.30,
        letterSpacing: -0.30,
      ),
    );
  }
}

class NoAccout extends StatelessWidget {
  final String t1;
  final String t2;
  const NoAccout({
    super.key,
    required this.t1,
    required this.t2,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
        Text(
          t1,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        Text(t2,
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.w500,
              fontSize: 13.sp,
            ))
      ]),
    );
  }
}

class NormalText2 extends StatelessWidget {
  final String text;
  final Color color;
  final double fontSize;
  final FontWeight fontWeight;
  NormalText2({
    super.key,
    required this.text,
    required this.color,
    this.fontSize = 15,
    this.fontWeight = FontWeight.normal,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      textAlign: TextAlign.center,
      style:
          TextStyle(color: color, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
