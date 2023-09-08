import 'package:date_picker_timeline/date_picker_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:studdy/src/common_widgets/home/heading_text.dart';
import 'package:studdy/src/common_widgets/home/schedule.dart';
import 'package:studdy/src/common_widgets/home/stats_tab.dart';
import 'package:studdy/src/common_widgets/home/sub_menu.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/constants/text.dart';
import 'package:studdy/src/features/home/controller/home_controller.dart';
import 'package:studdy/src/features/home/model/schedule_model.dart';
import 'package:studdy/src/features/home/repository/db_helper.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
   HomePage({super.key});

  HomeController controller  = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        elevation: 0,
        currentIndex: 0,
        items: const [
          // ignore: prefer_const_constructors
          BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/home/apps.png")),
              label: "HOME"),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/home/calendar.png")),
              label: "HOME"),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/home/comment.png")),
              label: "HOME"),
          BottomNavigationBarItem(
              icon: Image(image: AssetImage("assets/images/home/user.png")),
              label: "HOME"),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.only(left: 20.w, top: 64.h, right: 20.w),
              height: 362.h,
              width: 375.w,
              color: const Color(0xFFF3F5F8),
              child: Column(
                children: [
                  topBar(context),
                  SizedBox(
                    height: 40.h,
                  ),
                  SizedBox(
                    height: 190.h,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatsTab(
                                  text1: AppText.homeStrings[1][0],
                                  text2: AppText.homeStrings[2][0],
                                  color: const Color(0xFFB45309)),
                              StatsTab(
                                  text1: AppText.homeStrings[1][1],
                                  text2: AppText.homeStrings[2][1],
                                  color: const Color(0xFF4178D4)),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              StatsTab(
                                  text1: AppText.homeStrings[1][2],
                                  text2: AppText.homeStrings[2][2],
                                  color: const Color(0xFF52B6DF)),
                              StatsTab(
                                  text1: AppText.homeStrings[1][3],
                                  text2: AppText.homeStrings[2][3],
                                  color: const Color(0xFFF59E0B)),
                            ],
                          ),
                        ]),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            SizedBox(
              height: 80.h,
              width: 337.w,
              // color:Colors.red,
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SubMenu(
                    text: "Courses",
                    color: Color(0xFF316D86),
                    image: "assets/images/home/courses.png",
                  ),
                  SubMenu(
                    text: "Subject",
                    color: Color(0xFF27487F),
                    image: "assets/images/home/subjects.png",
                  ),
                  SubMenu(
                    text: "Class",
                    color: Color(0xFFF59E0B),
                    image: "assets/images/home/class.png",
                  ),
                  SubMenu(
                      text: "Presence",
                      color: Color(0xFF46BD84),
                      image: "assets/images/home/presence.png"),
                ],
              ),
            ),
            SizedBox(
              height: 38.h,
            ),
            SizedBox(
              // color: Colors.blue,
              // height: 500.h,
              width: 327.w,
              child: Column(
                children: [
                  SizedBox(
                    // color: Colors.blue,
                    height: 55.h,
                    width: 327.w,
                    child: Row(children: [
                      SizedBox(
                        // color: Colors.amber,
                        height: 80.h,
                        width: 220.w,
               
                       child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(height: 5.h,),
                            HeadingText(
                              text: "September 19, 2021",
                              fontSize: 15.sp,
                              fontWeight: FontWeight.w600,
                              color:
                                  AppColors.primaryDarkColor.withOpacity(0.6),
                            ),
                         
                          ],
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          controller.addTask();
                          
                          },
                        child: Container(
                          alignment: Alignment.center,
                          height: 40.h,
                          width: 105.w,
                          decoration: BoxDecoration(
                            color: const Color(0xFF316D86),
                            borderRadius: BorderRadius.circular(8.r),
                          ),
                          child: NormalText(
                            text: "+ Add Task",
                            color: const Color(0xFFF3F5F8),
                            fontSize: 15.sp,
                          ),
                        ),
                      )
                    ]),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    // color: Colors.blue,
                    height: 85.h,
                    width: 327.w,
                    child: DatePicker(
                      DateTime.now(),
                      initialSelectedDate: DateTime.now(),
                      selectionColor: const Color(0xFF316D86),
                      selectedTextColor: Colors.white,
                      monthTextStyle: const TextStyle(
                        color: AppColors.primaryDarkColor,
                        fontWeight: FontWeight.w600,
                        
                      ),
                      dayTextStyle: TextStyle(
                          color: AppColors.primaryDarkColor,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                      dateTextStyle: TextStyle(
                          fontSize: 13.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.grey),
                      onDateChange: (date) {
                       
                      },
                    ),
                  ),
                  
                  Obx(() {
                  return ListView.builder(
                    shrinkWrap: true,
                    itemCount: controller.taskList.length,
                    itemBuilder: (_,index){
                      print("---->${controller.taskList.length}");
                    return GestureDetector(
                      onTap:(){
                        controller.deleteTask(controller.taskList[index].id!);
                        controller.getfrom();
                      },
                      child: controller.taskList.length!=0?OneSchedule(model:controller.taskList[index]):Text("No tasks for today") ,
                      
                    );
                  });

                  }),
                 
                 


                  

                 

               
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Row topBar(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 53.h,
          // color: Colors.amber,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              HeadingText(
                text: AppText.homeStrings[0][0],
                fontSize: 20.sp,
              ),
              SizedBox(
                height: 3.h,
              ),
              Text(
                AppText.homeStrings[0][1],
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ],
          ),
        ),
        const Image(image: AssetImage("assets/images/home/bell.png")),
        // )
      ],
    );
  }
}
