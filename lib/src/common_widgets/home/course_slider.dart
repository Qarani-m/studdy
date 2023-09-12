import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/constants/colors.dart';

class Course extends StatelessWidget {
              final String price;
              final String tag;
              final String instructor;
              final String title;
              final String stars;
              final String imageUrl;
  const Course({
    super.key, required this.price, required this.tag, required this.instructor, required this.title, required this.stars, required this.imageUrl,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 230.h,
        width: 250.w,
        // color: Colors.red,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.symmetric(
                  horizontal: 10.w, vertical: 10.w),
              alignment: Alignment.topCenter,
              height: 150,
              width: 250.w,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.r),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image:
                          AssetImage(imageUrl))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 7.w, vertical: 3.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.r)),
                    child: Row(
                      children: [
                        Icon(Icons.star, color: AppColors.primaryColor),
                        Text(
                          stars,
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600,
                                  fontSize: 14.sp),
                        )
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                        horizontal: 5.w, vertical: 3.w),
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7.r)),
                    child: Icon(Icons.bookmark),
                  )
                ],
              ),
            ),
             SizedBox(
          // color:Colors.amber,
          height: 80.h,
          width: 250.w,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text(title),
            SizedBox(height: 3.h,),
            Row(children: [
              Icon(Icons.person_rounded),
              SizedBox(width: 5.w,),
              Text(instructor,style:Theme.of(context).textTheme.bodySmall)
            ],),
            SizedBox(height: 10.h,),

            Row(children: [
            Text("Ksh$price"),
            SizedBox(width:10.w),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 8.w,),
              decoration: BoxDecoration(
                color: AppColors.primaryColor.withOpacity(0.095),
                borderRadius: BorderRadius.circular(10.r)
              ),
              child:  Center(child: Text(tag,style:Theme.of(context).textTheme.bodySmall?.copyWith(color:AppColors.primaryColor))),
            )
           


            ],)
            
          ]),
        )
          ],
        ));
  }
}
