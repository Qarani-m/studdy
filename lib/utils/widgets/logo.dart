import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/utils/constants/colors.dart';

class Logo extends StatelessWidget {
  final bool showText;
  final bool inverseColors;
  final double height;
  final double fontSize;
  final double radius;
  const Logo({
    this.showText=true,
    this.inverseColors=true,
    this.height = 24,
    this.fontSize= 15,
    this.radius = 9,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    // double height =24;
    return IntrinsicWidth(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: height.h,
                height: height.h,
                decoration: BoxDecoration(
                    color:inverseColors? Colors.white:AppColors.primaryColor, // c1
                    borderRadius: BorderRadius.circular(radius)),
                child: Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: height*0.7.h, // Three-quarters of c1's width
                    height: height*0.7.h, // Three-quarters of c1's height
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: inverseColors? AppColors.primaryColor:Colors.white,  // c2
                    ),
                    child: Center(
                      child: Container(
                        width: height*0.25.h, // Three-quarters of c2's width
                        height:height*0.25.h, // Three-quarters of c2's height
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: inverseColors? Colors.white:AppColors.primaryColor, 
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            width: 10.w,
          ),
          Text(
            "Studdy",
            style: TextStyle(
              fontWeight: FontWeight.w600, 
              fontSize:fontSize,
              color: inverseColors?Colors.white:Colors.black
              ),
          )
        ],
      ),
    );
  }
}