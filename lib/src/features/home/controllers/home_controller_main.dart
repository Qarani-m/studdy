// ignore_for_file: avoid_print

import 'dart:ffi';

import 'package:get/get.dart';
import 'package:studdy/src/features/authentication/models/student_model.dart';
import 'package:studdy/src/features/authentication/repository/user_dbhelper.dart';

class HomeControllerMain extends GetxController{
  RxList<Student> userList = <Student>[].obs;
  RxBool showFilterBar = false.obs;
  var searchFilter = "none";

  Future<void> getStudentFromLocalDb() async {
    userList.assignAll(await UserDbHelper.getStudentFromLocalDb());
  }
  void toggleFilterBar(){
    showFilterBar.value=!showFilterBar.value;
  }










}








class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeControllerMain());
  }
}



