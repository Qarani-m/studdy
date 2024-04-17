import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';

class FaqPage extends StatelessWidget {
  final List<Map<String, String>> faqData = [
    {
      'question': 'Is there a trial account?',
      'answer': 'Yes, you can try our service for free for 30 days. After that, you\'ll need to sign up for a paid subscription.',
    },
    {
      'question': 'How much is the pricing service?',
      'answer': 'Our pricing plans start from \$9.99 per month. You can find more details on our pricing page.',
    },
    {
      'question': 'What makes the service unique?',
      'answer': 'Our service provides personalized recommendations based on your preferences and needs. We also offer 24/7 customer support.',
    },
    {
      'question': 'How do I get started?',
      'answer': 'Simply sign up on our website, and you\'ll be guided through the onboarding process.',
    },
    {
      'question': 'Is it easy to use, simple, and fast?',
      'answer': 'Absolutely! Our user interface is designed to be intuitive, simple, and efficient.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BackNavBar(title: "FAQs"),
            SizedBox(height: 30.h),
            Text(
              'Frequently Asked Questions',
              style: TextStyle(
                fontSize: 22.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: faqData.length,
                itemBuilder: (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        faqData[index]['question']!,
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        "\t"+faqData[index]['answer']!,
                        style: TextStyle(
                          fontSize: 16.sp,
                        ),
                      ),
                      SizedBox(height: 20.h),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
