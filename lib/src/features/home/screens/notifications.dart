// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:studdy/src/common_widgets/home/top_back_nav_bar.dart';
import 'package:studdy/src/constants/colors.dart';

class Notifications extends StatefulWidget {
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 23.w, right: 23.w, top: 50.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const BackNavBar(title: "Notifications"),
              SizedBox(
                height: 15.h,
              ),
              const NotificationRightLeft(
                left: "Today",
              ),
              SizedBox(
                height: 5.h,
              ),
              OneNotification(
                icon:Icon(Icons.phone_missed_sharp, size: 40.h,color: AppColors.primaryDarkColor,),
                title: "New course available", 
                text: "Lorem ipsum dolor sit amet, consec tetur adipiscing elit. Lorem ipsum dolor sit amet, consectetur adipiscing elit.", 
                time: "1h"),



            ],
          ),
        ),
      ),
    );
  }
}



class OneNotification extends StatelessWidget {
  const OneNotification({
    super.key,
    required this.title,
    required this.text,
    required this.time,
    required this.icon
  });

  final String title;
  final String text;
  final String time;
  final Widget icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 15.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration:BoxDecoration(
              color: AppColors.primaryDarkColor.withOpacity(0.025)
            ),
            height: 100.h,
            width: 70.w,
            child: icon
          ),
          SizedBox(
            width: 5.w,
          ),
          Container(
            height: 100.h,
            width: 220.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style: Theme.of(context).textTheme.bodyMedium),
                Text(text,
                overflow:  TextOverflow.ellipsis,
                maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall)
              ],
            ),
          ),
          Container(
            alignment: Alignment.topCenter,
            height: 100.h,
            width: 30.w,
            child: Text(time,
                overflow:  TextOverflow.ellipsis,
                maxLines: 3,
                    style: Theme.of(context).textTheme.bodySmall),

          )
        ],
      ),
    );
  }
}

class NotificationRightLeft extends StatelessWidget {
  final String left;
  const NotificationRightLeft({
    super.key,
    required this.left,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 10.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            left,
            style: Theme.of(context)
                .textTheme
                .bodyMedium
                ?.copyWith(fontWeight: FontWeight.w300),
          ),
          GestureDetector(
              onTap: () {},
              child: Text(
               "",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: AppColors.primaryColor, fontWeight: FontWeight.w300),
              )),
        ],
      ),
    );
  }
}
