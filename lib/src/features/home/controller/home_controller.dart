import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studdy/src/common_widgets/home/bottom_sheet_button.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/home/model/schedule_model.dart';
import 'package:studdy/src/features/home/model/student_model.dart';
import 'package:studdy/src/features/home/repository/db_helper.dart';
import 'package:studdy/src/features/home/repository/user_dbhelper.dart';
import 'package:studdy/src/features/home/screens/add_task.dart';

class HomeController extends GetxController {
  RxBool isDoneInitializing  = false.obs;


  var userList = <Student>[].obs;

 Future<void> getUser() async {
    userList.assignAll(await UserDbHelper.getUser());
    isDoneInitializing.value =true;
  }

  @override
  void onInit(){
    super.onInit();
    getUser();
  } 









































































  RxList<Task> tasks = RxList<Task>();
  var taskList = <Task>[].obs;
  RxString selectedDate = mainDate().obs;

  static String mainDate() {
    DateTime taskDate = DateTime.now();
    String formattedDate = DateFormat('M/d/yyyy').format(taskDate);
    return formattedDate; // Output: e.g., "9/8/23"
  }

  void addTask() async {
    await Get.to(const AddTask(),
        transition: Transition.cupertinoDialog,
        duration: const Duration(milliseconds: 400));
    getfrom();
  }

  @override
  void onReady() {
    getfrom();
  }

  void getfrom() async {
    taskList.assignAll(await DbHelper.getTasks(selectedDate.value));
  }

  void deleteTask(int id) {
    DbHelper.deleteTask(id);
  }

  void bottomSheetOnTapDelete(int? id) {}
  void bottomSheetOnTap() {}

  void showBottomShet(BuildContext context, Task task) {
    bottomSheetBar(task, context);
  }

  Future<dynamic> bottomSheetBar(Task task, BuildContext context) {
    print(task.isComplete);
    return Get.bottomSheet(Container(
      color: Colors.white,
      padding: EdgeInsets.only(top: 5.h, left: 23.w, right: 23.w),
      height: task.isComplete == 0 ? 190.h : 150.h,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            height: 5.h,
            width: 100.w,
            decoration: BoxDecoration(
                color: const Color(0xFF316D86),
                borderRadius: BorderRadius.circular(10.r)),
          ),
          Container(
            height: 140.h,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                // color: const Color(0xFF316D86),
                borderRadius: BorderRadius.circular(10.r)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                task.isComplete == 0
                    ? BottomSheetButton(
                        bottomSheetOnTap: () {
                          DbHelper.updateCompleteStatus(task.id!);
                          getfrom();
                          showSnackBar("Task completed successfully");
                        },
                        backgroundColor: AppColors.accentColor,
                      )
                    : Container(),
                BottomSheetButton(
                  bottomSheetOnTap: () {
                    DbHelper.deleteTask(task.id!);
                    getfrom();
                    showSnackBar("Task Deleted successfully");
                  },
                  backgroundColor: AppColors.primaryColor,
                ),
                SizedBox(height: 10.h)
              ],
            ),
          )
        ],
      ),
    ));
  }

  showSnackBar(String text) {
    return Get.snackbar("Success", text,
        snackPosition: SnackPosition.BOTTOM,
        icon: const Icon(
          Icons.check,
          color: Colors.white,
          weight: 20,
        ),
        backgroundColor: AppColors.primaryDarkColor,
        colorText: Colors.white,
        duration: const Duration(seconds: 1));
  }
}
