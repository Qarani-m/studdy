import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/common_widgets/home/search_result.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/screens/finalize_payment.dart';
import 'package:studdy/src/features/courses/screens/payment_methods.dart';
import 'package:studdy/src/routing/navigation.dart';

class PaymentSummary extends StatelessWidget {
  const PaymentSummary({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
            padding: EdgeInsets.only(top: 50.h, left: 23.w, right: 23.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const BackNavBar(title: "Review Summary"),
                SizedBox(
                  height: 20.h,
                ),
                const CourseSearchResult(
                  review: true,
                ),
                SizedBox(
                  height: 30.h,
                ),
                Column(
                  children: [
                    const LeftRightSummary(left: "Lessons", right: "32"),
                    SizedBox(
                      height: 10.h,
                    ),
                    const LeftRightSummary(left: "Level", right: "Form 4"),
                    SizedBox(
                      height: 15.h,
                    ),
                    const LeftRightSummary(left: "Language", right: "English"),
                    SizedBox(
                      height: 15.h,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5.h, bottom: 5.h),
                      width: 327.w,
                      height: 1.h,
                      color: AppColors.secondaryColor.withOpacity(0.2),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    const LeftRightSummary(left: "Amount", right: "\$ 180"),
                  ],
                ),
                SizedBox(
                  height: 30.h,
                ),
                GestureDetector(
                  onTap: () {
                AppNavigation.navigateTo(const FinalizePayment());
              },
                  
                  child: SelectPaymentButton(width: 327.w,text: "Finalzie",))
              ],
            )));
  }
}

class LeftRightSummary extends StatelessWidget {
  final String left;
  final String right;

  const LeftRightSummary({
    required this.left,
    required this.right,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          left,
          style: TextStyle(
              fontWeight: FontWeight.w400,
              color: AppColors.secondaryColor.withOpacity(0.6)),
        ),
        Text(
          right,
          style: const TextStyle(
              fontWeight: FontWeight.w400, color: AppColors.secondaryColor),
        ),
      ],
    );
  }
}
