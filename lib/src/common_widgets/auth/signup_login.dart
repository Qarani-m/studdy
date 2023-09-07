
import 'package:flutter/material.dart';
import 'package:studdy/src/constants/colors.dart';

class SignupLogin extends StatelessWidget {
  const SignupLogin({
    super.key, required this.text1, required this.text2,
  });
  final String text1;
  final String text2;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          text1,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(
                  color: AppColors.primaryDarkColor,
                  fontWeight: FontWeight.w500),
        ),
        Text(
          text2,
          style: Theme.of(context)
              .textTheme
              .bodySmall
              ?.copyWith(
                  color: AppColors.primaryColor,
                  fontWeight: FontWeight.w500),
        )
      ],
    );
  }
}