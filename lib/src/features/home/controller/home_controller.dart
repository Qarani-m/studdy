import 'package:get/get.dart';
import 'package:studdy/src/features/home/model/schedule_model.dart';
import 'package:studdy/src/features/home/repository/db_helper.dart';
import 'package:studdy/src/features/home/screens/add_task.dart';

class HomeController extends GetxController{
   RxList<ScheduleModel> tasks = RxList<ScheduleModel>();
   var taskList = <ScheduleModel>[].obs;

  void addTask()async{
    await Get.to(
      const AddTask(),
      transition: Transition.cupertinoDialog,
      duration: const Duration(milliseconds: 400)
    );
    getfrom();

  }

  @override
  void onReady(){
    getfrom();

  }





  void getfrom() async {
    taskList.assignAll(await DbHelper.getTasks());

  }
  
}