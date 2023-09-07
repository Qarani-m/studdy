import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SubMenu extends StatelessWidget {
  final String text;
  final Color color;
  final String image;
  const SubMenu({
    super.key,
    required this.text,
    required this.color,
    this.image = "assets/images/home/subjects.png",
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 48.h,
            width: 48.w,
            decoration: BoxDecoration(
                color: color, borderRadius: BorderRadius.circular(17.r)),
            child: Center(child: Image(image: AssetImage(image))),
          ),
          Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          )
        ],
      ),
    );
  }
}