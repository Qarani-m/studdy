// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flux_store/constants/colors.dart';
import 'package:flux_store/view/widgets/text_widget.dart';
import 'package:intl/intl.dart';

class AddTask extends StatefulWidget {
  const AddTask({super.key});

  @override
  State<AddTask> createState() => _AddTaskState();
}

class _AddTaskState extends State<AddTask> {
  @override
  Widget build(BuildContext context) {
    DateTime _selectDate  = DateTime.now();
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(top:25.w, left: 23.w, right: 23.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopBar(),
              SizedBox(height: 10.h,),
              HeadingText(text: "Add Task", fontSize: 25.sp,),
              SizedBox(height: 20.h,),

              Container(
                child:Column(children: [
                  AddTaskInput(title:"Title", hint:"Enter you title"),
                  SizedBox(height: 20.h,),
                  AddTaskInput(title: "Note",hint: "Enter your note",),
                  SizedBox(height: 20.h,),
                  AddTaskInput(
                    onTap: (){print("name");},
                    icon: Icon(Icons.calendar_today_outlined),
                    readOnly:true,title: "Date",
                    hint: DateFormat.yMd().format(_selectDate),),
                ],) ,
              )
            ],
          ),
        ),
      ),
    );
  }

  _getDateFromUser () async{
    DateTime? _pickerDate = await showDatePicker(
      context: context, 
      initialDate: DateTime.now(), 
      firstDate: DateTime(2015), 
      lastDate: DateTime(2125)
      );
  }
}

class AddTaskInput extends StatelessWidget {
  final String title;
  final String hint;
  final bool readOnly;
  final Widget icon;
  final Function? onTap;
  const AddTaskInput({
    super.key, 
    this.onTap = null,
    required this.title, 
    required this.hint,
    this.readOnly = false,
    this.icon =const  Icon(Icons.calendar_month),
    // equired this.,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
            crossAxisAlignment: CrossAxisAlignment.start,

      children: [
        Text(title, style: TextStyle(
          color: primaryDarkColor.withOpacity(0.7),
          fontSize: 15.sp,
          fontWeight: FontWeight.w500
        ),),
        SizedBox(height: 5.h,),
        TextFormField(
          
          readOnly: readOnly,
          decoration: InputDecoration(
            suffixIcon: readOnly?Icon(Icons.calendar_month, color: Colors.grey,): null,
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
          hintStyle: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w400)),



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
    return Container(
      child:Image(image: AssetImage("assets/images/home/back-arrow.png"),)
    );
  }
}