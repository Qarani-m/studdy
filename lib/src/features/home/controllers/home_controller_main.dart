// ignore_for_file: avoid_print


import 'package:get/get.dart';
import 'package:studdy/src/features/authentication/models/student_model.dart';
import 'package:studdy/src/features/authentication/repository/user_dbhelper.dart';
import 'package:studdy/src/features/home/repository/navigation.dart';
import 'package:studdy/src/features/home/screens/categories.dart';

class HomeControllerMain extends GetxController {
  RxList<Student> userList = <Student>[].obs;
  RxBool showFilterBar = false.obs;
  var searchFilter = "none";

  Future<void> getStudentFromLocalDb() async {
    userList.assignAll(await UserDbHelper.getStudentFromLocalDb());
  }

  void toggleFilterBar() {
    showFilterBar.value = !showFilterBar.value;
    print(searchFilter);
  }

  void seeAllCategories() {
    AppNavigation.navigateTo(const Categories());
  }
}




class HomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeControllerMain());
  }
}
