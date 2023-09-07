// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/home/repository/db_helper.dart';
import 'package:studdy/src/repository/auth_repo/auth_repo.dart';
import 'package:studdy/src/utils/controllers/controller_list.dart';
import 'firebase_options.dart';
import 'src/common_widgets/auth/logo.dart';
import 'src/utils/theme/themes.dart';

Future<void> main() async{
   SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark
    ),
  );
   WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ).then((value) => Get.put(AuthRepo()));
  await DbHelper.initDb();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) {
        return GetMaterialApp(
          initialBinding: InitDep(),
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        themeMode: ThemeMode.light,
        home:LogoScreen(),
      );
      },
    );
  }
}


class LogoScreen extends StatelessWidget {
  const LogoScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.primaryColor,
        height:MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.height,
        child: Center(child: Logo()),
      ),
    );
  }
}