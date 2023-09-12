
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:studdy/src/common_widgets/home/heading_text.dart';
// import 'package:studdy/src/constants/colors.dart';

// class OneSchedule extends StatelessWidget {
//   const OneSchedule({
//     super.key,
//     required this.model
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Container(
//           // height: 110.h,
//           width: 327.w,
//           decoration: BoxDecoration(
//               color: model.bgColor==0?AppColors.primaryColor:model.bgColor==1? AppColors.primaryDarkColor:AppColors.accentColor,
//               borderRadius: BorderRadius.circular(10.r)),
//           child: Row(
//             children: [
//               Container(
//                 // height: 110.h,
//                 width: 290.w,
//                 padding: EdgeInsets.only(top: 10.h, left: 20.w, bottom: 12.h),
//                 decoration:
//                     BoxDecoration(borderRadius: BorderRadius.circular(10.r)),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     HeadingText(
//                       text: model.title!,
//                       color: const Color(0xFFF3F5F8),
//                       fontSize: 15.sp,
//                     ),
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                     Row(
//                       children: [
//                         const Icon(
//                           Icons.lock_clock_sharp,
//                           color: Color(0xFFF3F5F8),
//                         ),
//                         SizedBox(
//                           width: 2.w,
//                         ),
//                         HeadingText(
//                             text: "${model.start} - ${model.end}",
//                             color: const Color(0xFFF3F5F8),
//                             fontSize: 13.sp,
//                             fontWeight: FontWeight.w400,
//                             alignment: TextAlign.start)
//                       ],
//                     ),
//                     SizedBox(
//                       height: 12.h,
//                     ),
//                     HeadingText(
//                         text:
//                             model.note!,
//                         color: const Color(0xFFF3F5F8),
//                         fontSize: 13.sp,
//                         fontWeight: FontWeight.w400,
//                         alignment: TextAlign.start),
//                   ],
//                 ),
//               ),
//               Container(
//                 height: 130.h,
//                 width: 26.w,
//                 decoration: BoxDecoration(
//                     // color: Colors.blue,
//                     borderRadius: BorderRadius.circular(10.r)),
//                 child: Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Container(
//                       color: const Color(0xFFF3F5F8),
//                       height: 90.h,
//                       width: 1.w,
//                     ),
//                      RotatedBox(
//                         quarterTurns: 3, child: NormalText(text: model.isComplete ==0?"Todo":"Completed"))
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 20.h,
//               )
//             ],
//           ),
//         ),
//         SizedBox(
//           height: 20.h,
//         )
//       ],
//     );
//   }
// }
