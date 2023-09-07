// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studdy/src/common_widgets/auth/large_button.dart';
import 'package:studdy/src/common_widgets/home/heading_text.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/home/controller/add_task_controller.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  AddTaskController controller = Get.put(AddTaskController());

  @override
  Widget build(BuildContext context) {
    DateTime _selectDate = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.only(top: 25.w, left: 23.w, right: 23.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                    onTap: () {
                      controller.goHome();
                    },
                    child: TopBar()),
                SizedBox(
                  height: 10.h,
                ),
                HeadingText(
                  text: "Add Task",
                  fontSize: 25.sp,
                ),
                SizedBox(
                  height: 20.h,
                ),
                Column(
                  children: [
                    AddTaskInput(controller: controller.titleController,title: "Title", hint: "Enter you title"),
                    SizedBox(
                      height: 20.h,
                    ),
                    AddTaskInput(
                      controller: controller.noteController,
                      title: "Note",
                      hint: "Enter your note",
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Obx(
                      () => TimeDatePicker(
                        onTap: () {
                          controller.pickDate(context);
                        },
                        controller: controller,
                        hint: DateFormat.yMd()
                            .format(controller.selectedDate.value),
                        icon: Icons.calendar_today_outlined,
                        label: "Date",
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      children: [
                        Container(
                          width: 158.w,
                          color: Colors.transparent,
                          child: Obx(
                            () => TimeDatePicker(
                              onTap: () {
                                controller.pickTime(context, "start");
                              },
                              controller: controller,
                              hint: controller.startTime.value,
                              icon: Icons.alarm,
                              label: "Start",
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 13.w,
                        ),
                        Container(
                          width: 158.w,
                          color: Colors.transparent,
                          child: Obx(
                            () => TimeDatePicker(
                              onTap: () {
                                controller.pickTime(context, "end");
                              },
                              controller: controller,
                              hint: controller.stopTime.value,
                              icon: Icons.alarm,
                              label: "Stop",
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Color", style: TextStyle(
                            color:AppColors.fadedTextColor
                          ),),
                          SizedBox(
                      height: 8.h,
                    ),
        
                          Row(
                            children: List<Widget>.generate(3, (index){
                              return GestureDetector(
                                onTap: (){
                                  controller.selectedColor.value = index;
                                },
                                child: Padding(
                                  padding: EdgeInsets.only(right: 8.w),
                              
                                  child: Obx(()=>Container(
                                      height: 21.h,
                                      width: 21.h,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:index==0? AppColors.primaryColor:index==1? AppColors.primaryDarkColor: AppColors.accentColor,
                                      ),
                                    child: controller.selectedColor.value==index? Center(child: Icon(Icons.done, color: Colors.white,size: 16.r,)):null,
                                    )),
                                  
                                ),
                              );
                            }),
                          )
                        ],
                      ),
        
                      GestureDetector(
                        onTap: (){controller.createTask();},
                        child: WelcomeButton2(
                          height: 50.h,
                          width: 130.w,
                          text: "Create Task",
                          background: true,
                        ),
                      )
                    ],)
                  ],
                ),
        
        
                TextButton(onPressed: (){controller.getfrom();}, child: Text("sssss"))
        
        
        
        
              ],
            ),
          ),
        ),
      ),
    );
  }
}










class TimeDatePicker extends StatelessWidget {
  const TimeDatePicker(
      {super.key,
      required this.controller,
      required this.hint,
      required this.icon,
      required this.label,
      required this.onTap});

  final AddTaskController controller;
  final String hint;
  final IconData icon;
  final String label;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: AddTaskInput(
            icon: Icon(icon),
            readOnly: true,
            title: label,
            hint: hint,
          ),
        ),
        Positioned(
            top: 30,
            right: 0,
            child: GestureDetector(
              onTap: () {},
              child: GestureDetector(
                onTap: onTap,
                child: Container(
                    height: 69, width: 500.w, color: Colors.transparent),
              ),
            ))
      ],
    );
  }
}

class AddTaskInput extends StatelessWidget {
  final String title;
  final String hint;
  final bool readOnly;
  final Widget icon;
  final Function? onTap;
  final TextEditingController? controller;
  final TextEditingController cont= TextEditingController();
   AddTaskInput({
    super.key,
    this.onTap,
    required this.title,
    required this.hint,
    this.readOnly = false,
    this.controller,
    this.icon = const Icon(Icons.calendar_month),
    // equired this.,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
              color: AppColors.primaryDarkColor.withOpacity(0.7),
              fontSize: 15.sp,
              fontWeight: FontWeight.w500),
        ),
        SizedBox(
          height: 5.h,
        ),
        TextFormField(
          controller: controller,
          readOnly: readOnly,
          style: Theme.of(context)
            .textTheme
            .bodySmall
            ?.copyWith(color: AppColors.primaryDarkColor),
          decoration: InputDecoration(
              suffixIcon: readOnly
                  ? Icon(
                      Icons.calendar_month,
                      color: Colors.grey,
                    )
                  : null,
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(width: 0, color: Color(0xFFDADADA))),
              enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(width: 1.5, color: Color(0xFFDADADA))),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.r),
                  borderSide: BorderSide(width: 1.5, color: Color(0xFFDADADA))),
              filled: true,
              fillColor: Color(0xFFF7F8F9),
              hintText: hint,
              contentPadding:
                  EdgeInsets.symmetric(horizontal: 16.w, vertical: 14.h),
              hintStyle:
                  TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),
        )
      ],
    );
  }
}

class TopBar extends StatelessWidget {
  const TopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Image(
      image: AssetImage("assets/images/home/back-arrow.png"),
    );
  }
}
