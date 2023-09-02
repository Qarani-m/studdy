import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:studdy/utils/constants/colors.dart';
final defaultPinTheme = PinTheme(
  width: 56,
  height: 56,
  textStyle: TextStyle(fontSize: 20, color:AppColors.primaryDarkColor , fontWeight: FontWeight.w600),
  decoration: BoxDecoration(
    border: Border.all(color: AppColors.primaryDarkColor),
    borderRadius: BorderRadius.circular(20),
  ),
);

final focusedPinTheme = defaultPinTheme.copyDecorationWith(
  border: Border.all(color: Color.fromRGBO(114, 178, 238, 1)),
  borderRadius: BorderRadius.circular(8),
);

final submittedPinTheme = defaultPinTheme?.copyWith(
  decoration: defaultPinTheme.decoration?.copyWith(
    color: Color.fromRGBO(234, 239, 243, 1),
  ),
);

