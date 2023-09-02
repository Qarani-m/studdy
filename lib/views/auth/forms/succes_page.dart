import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:studdy/utils/widgets/succes_page.dart';

import 'login.dart';

class SuccesPage extends StatefulWidget {
  const SuccesPage({super.key});

  @override
  State<SuccesPage> createState() => _SuccesPageState();
}

class _SuccesPageState extends State<SuccesPage> {
  String title = "Password changed";
  String subtitle = "Your password has been changed";
  String buttonText = "Back to login";
  void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SuccessPage(
          title: title,
          subtitle: subtitle,
          buttonText: buttonText,
          onTap: () {
            Get.to(
                transition: Transition.cupertinoDialog,
                duration: Duration(milliseconds: 500),
                Login());
          }),
    );
  }
}
