// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/home/model/schedule_model.dart';
import 'package:studdy/src/features/home/repository/db_helper.dart';
import 'package:studdy/src/features/home/screens/home_page.dart';

class AddTaskController extends GetxController {
  @override
  void onReady() {
    super.onReady();
  }

  void goHome() {
    Get.off(
      HomePage(),
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 400)
    );
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController noteController = TextEditingController();

  Rx<DateTime> selectedDate = DateTime.now().obs;
  RxString startTime =
      DateFormat("hh:mm a").format(DateTime.now()).toString().obs;
  RxString stopTime =
      DateFormat("hh:mm a").format(DateTime.now()).toString().obs;
  RxInt selectedColor = 0.obs;
  var title = "";
  var note = "";

  pickDate(BuildContext context) async {
    DateTime? _pickerDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primaryColor, // <-- SEE HERE
              onPrimary: Colors.white, // <-- SEE HERE
              onSurface: AppColors.primaryDarkColor, // <-- SEE HERE
            ),
            textButtonTheme: TextButtonThemeData(
              style: TextButton.styleFrom(
                foregroundColor: AppColors.primaryColor, // button text color
              ),
            ),
          ),
          child: child!,
        );
      },
    );
    if (_pickerDate != null) {
      selectedDate.value = _pickerDate;
    }
  }

  Future<void> pickTime(BuildContext context, String stage) async {
    TimeOfDay? _startTime = await showTimePicker(
      context: context,
      initialEntryMode: TimePickerEntryMode.inputOnly,
      initialTime: const TimeOfDay(hour: 8, minute: 0),
    );

    if (_startTime != null) {
      String formattedStartTime = DateFormat.Hm().format(
        DateTime(0, 1, 1, _startTime.hour, _startTime.minute),
      );
      if (stage == "start") {
        startTime.value = formattedStartTime;
      }
      if (stage == "end") {
        stopTime.value = formattedStartTime;
      }
    }
  }

  void createTask() async {
    title = titleController.text;
    note = noteController.text;
    String date = DateFormat.yMd().format(selectedDate.value);
    String status = validator(title, note, startTime.value, stopTime.value);

    if (status == "0") {
      print("object");
      //save to db
      ScheduleModel task = ScheduleModel(
          date: date,
          title: title,
          note: note,
          start: startTime.value,
          end: stopTime.value,
          bgColor: selectedColor.value,
          isComplete: 0);

      int dbResponse = await DbHelper.insert(task);
      print("===================================$dbResponse");

      //show snackbar
      Get.snackbar("Succes", "Task added successfully",
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(
            Icons.check,
            color: Colors.white,
            weight: 20,
          ),
          backgroundColor: AppColors.primaryDarkColor,
          colorText: Colors.white,
          duration: const Duration(seconds: 10));
    } else {
      Get.snackbar("Requried", status,
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(
            Icons.warning_amber_rounded,
            color: Colors.amber,
          ),
          backgroundColor: AppColors.primaryColor,
          colorText: Colors.white,
          duration: const Duration(seconds: 10));
      return;
    }
  }

  String validator(
      String title, String note, String timeStart, String timestop) {
    String message = "";
    if (titleController.text.isNotEmpty && noteController.text.isNotEmpty) {
      List<int> startTimeParts = startTime.split(':').map(int.parse).toList();
      List<int> stopTimeParts = stopTime.split(':').map(int.parse).toList();
      if (stopTimeParts[0] < startTimeParts[0] ||
          (stopTimeParts[0] == startTimeParts[0] &&
              stopTimeParts[1] <= startTimeParts[1])) {
        // stopTime is not greater than startTime
        message = "stop time must be greater than start time";
      } else {
        message = "0";
      }
    } else {
      titleController.text.isNotEmpty
          ? message = "Schedule title is required"
          : message = "Schedule note is required";
    }

    return message;
  }
 RxList<ScheduleModel> _tasks = RxList<ScheduleModel>();

  void getfrom() async {
    _tasks.assignAll(await DbHelper.getTasks());
    print(_tasks);
  }

//   void getTasks() async {
//     List<Map<String, dynamic>> tasks = await DbHelper.query();
// tasks.assignAll(tasks.map((data) => new ScheduleModel.fromJson(data))).toList();
  
//   }
}
