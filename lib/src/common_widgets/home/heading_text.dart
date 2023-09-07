import 'package:flutter/material.dart';

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
