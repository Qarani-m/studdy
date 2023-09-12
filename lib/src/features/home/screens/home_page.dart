import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studdy/src/features/authentication/repository/auth_helper.dart';
import 'package:studdy/src/features/home/controllers/home_controller_main.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeControllerMain mainController  = Get.put(HomeControllerMain());
  @override
  Widget build(BuildContext context) {
  mainController.getStudentFromLocalDb();
    return Scaffold(
      body: Center(child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(()=>Text(mainController.userList.isNotEmpty?mainController.userList[0].id.toString()!:"empty")),
          Obx(()=>Text(mainController.userList.isNotEmpty?mainController.userList[0].name!:"empty")),
          Obx(()=>Text(mainController.userList.isNotEmpty?mainController.userList[0].email!:"empty")),
          Obx(()=>Text(mainController.userList.isNotEmpty?mainController.userList[0].phone!:"empty")),
          Obx(()=>Text(mainController.userList.isNotEmpty?mainController.userList[0].school!:"empty")),
          Obx(()=>Text(mainController.userList.isNotEmpty?mainController.userList[0].courses.toString():"empty")),
          Obx(()=>Text(mainController.userList.isNotEmpty?mainController.userList[0].studentId!:"empty")),
          Obx(()=>Text(mainController.userList.isNotEmpty?mainController.userList[0].level!:"empty")),
          Obx(()=>Text(mainController.userList.isNotEmpty?mainController.userList[0].dob!:"empty")),
          TextButton(onPressed:(){AuthHelper.instance.signoutUser();}, child: const Text("Sign Out")),
        ],
      )),
    );
  }
}