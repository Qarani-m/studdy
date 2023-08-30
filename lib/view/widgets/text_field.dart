import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/constants/colors.dart';

class TextFieldCustom extends StatelessWidget {
  TextFieldCustom(
      {super.key,
      required this.hint,
      this.focused = false,
      this.obscureText = false});

  final String hint;
  final bool focused;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return TextField(
      obscuringCharacter: "●",
      obscureText: obscureText,
      autofocus: focused,
      cursorColor: primaryDarkColor,
      decoration: InputDecoration(
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(width: 0, color: Color(0xFFDADADA))),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(width: 1.5, color: Color(0xFFDADADA))),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(4.r),
              borderSide: BorderSide(width: 1.5, color: Color(0xFFDADADA))),
          filled: true,
          fillColor: Color(0xFFF7F8F9),
          hintText: hint,
          contentPadding:
              EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
          hintStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
    );
  }
}

class InputPrompt extends StatelessWidget {
  final String label;
  final String hint;
  final bool obscureText;
  const InputPrompt({
    super.key,
    required this.label,
    required this.hint,
    this.obscureText = false,
  });
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NormalText2(
          //   text: label,
          //   color: Color(0xFF1E232C).withOpacity(0.7),
          //   fontWeight: FontWeight.w500,
          // ),
          SizedBox(
            height: 5.h,
          ),
          TextFieldCustom(
            obscureText: obscureText,
            hint: hint,
          ),
        ],
      ),
    );
  }
}
