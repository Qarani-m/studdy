import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/courses/screens/payment_summary.dart';
import 'package:studdy/src/routing/navigation.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BackNavBar(
            title: "Payment methods",
          ),
          SizedBox(height: 20.h),
          const Text(
            "Payment M-Pesa Number",
            style: TextStyle(fontWeight: FontWeight.w400),
          ),
          SizedBox(height: 10.h),
          const NumberListing(
            number: "0704847676",
            groupValue: false,
            value: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          const NumberListing(
            number: "0701314057",
            groupValue: false,
            value: true,
          ),
          SizedBox(
            height: 20.h,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            GestureDetector(
              onTap: (){},
              child: SelectPaymentButton(
                text: "Add Number",
                width: 120.w,
              ),
            ),
            GestureDetector(
              onTap: () {
                AppNavigation.navigateTo(PaymentSummary());
              },
              child: SelectPaymentButton(
                text: "Proceed",
                width: 201.w,
              ),
            )
          ])
        ],
      ),
    ));
  }
}

class NumberListing extends StatelessWidget {
  final String number;
  final bool groupValue;
  final bool value;
  const NumberListing({
    required this.number,
    required this.groupValue,
    required this.value,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 10.w),
      alignment: Alignment.centerLeft,
      height: 50.h,
      width: 375.w,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColors.primaryDarkColor.withOpacity(0.5),
            offset: const Offset(
              1.0,
              1.0,
            ),
            blurRadius: 1.0,
            spreadRadius: 0.5,
          ), //BoxShadow
          const BoxShadow(
            color: Colors.white,
            offset: Offset(0.0, 0.0),
            blurRadius: 0.0,
            spreadRadius: 0.0,
          ), //BoxShadow
        ],
        borderRadius: BorderRadius.circular(10.r),
        // border:Border.all(color: AppColors.fadedTextColor.withOpacity(0.5))
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(number,
              style: const TextStyle(
                  color: AppColors.fadedTextColor,
                  fontWeight: FontWeight.w400)),
          Radio(
              activeColor: AppColors.fadedTextColor,
              splashRadius: 80.w,
              value: value,
              groupValue: true,
              onChanged: (val) {})
        ],
      ),
    );
  }
}

class SelectPaymentButton extends StatelessWidget {
  const SelectPaymentButton({
    required this.width,
    required this.text,
    super.key,
  });
  final String text;
  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(left: 10.w),
        alignment: Alignment.centerLeft,
        height: 50.h,
        width: width,
        decoration: BoxDecoration(
          color: AppColors.secondaryColor,
          boxShadow: [
            BoxShadow(
              color: AppColors.primaryDarkColor.withOpacity(0.5),
              offset: const Offset(
                1.0,
                1.0,
              ),
              blurRadius: 1.0,
              spreadRadius: 0.5,
            ), //BoxShadow
            const BoxShadow(
              color: Colors.white,
              offset: Offset(0.0, 0.0),
              blurRadius: 0.0,
              spreadRadius: 0.0,
            ), //BoxShadow
          ],
          borderRadius: BorderRadius.circular(10.r),
          // border:Border.all(color: AppColors.fadedTextColor.withOpacity(0.5))
        ),
        child: Center(
            child: Text(
          text,
          style:
              const TextStyle(fontWeight: FontWeight.w300, color: Colors.white),
        )));
  }
}
