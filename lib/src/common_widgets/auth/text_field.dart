
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/constants/colors.dart';
class TextField1 extends StatelessWidget {
  const TextField1(
      {super.key,
      required this.obscureText,
      required this.controller,
      required this.hint,
      required this.label,
      required this.prefixIcon,
      this.suffixIcon = const Icon(Icons.visibility)});

  final bool obscureText;
  final TextEditingController controller;
  final String hint;
  final String label;
  final IconData prefixIcon;
  final Widget suffixIcon;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      child: TextFormField(
        obscuringCharacter: "●",
        obscureText: obscureText,
        controller: controller,
        style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.primaryDarkColor),
        cursorColor: AppColors.primaryDarkColor,
        decoration: InputDecoration(
            hintMaxLines: 1,
            labelStyle: Theme.of(context)
                .textTheme
                .bodySmall
                ?.copyWith(color: AppColors.primaryDarkColor),
            labelText: hint,
            hintText: label,
            prefixIcon: Icon(prefixIcon),
            suffixIcon: obscureText? suffixIcon : hint=="Enter your password"?suffixIcon:null ,
            suffixIconColor: AppColors.fadedTextColor,
            prefixIconColor: AppColors.fadedTextColor),
      ),
    );
  }
}
