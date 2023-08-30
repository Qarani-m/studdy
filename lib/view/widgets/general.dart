import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AltLoginIcon extends StatelessWidget {
  final String image;
  final Function() onTap;
  const AltLoginIcon({
    super.key,
    required this.image,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap,
      child: Container(
        height: 30.h,
        width: 30.w,
        decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                image,
              ),
              fit: BoxFit.contain),
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
