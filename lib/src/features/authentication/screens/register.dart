import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:studdy/src/common_widgets/auth/large_button.dart';
import 'package:studdy/src/common_widgets/auth/signup_login.dart';
import 'package:studdy/src/common_widgets/auth/signup_with_google.dart';
import 'package:studdy/src/common_widgets/auth/text_field.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/constants/image_strings.dart';
import 'package:studdy/src/features/authentication/controllers/signup_controller.dart';
import 'package:studdy/src/features/home/controller/home_controller.dart';

class Register extends StatefulWidget {
  const Register({super.key});

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    RegisterController registerController = Get.put(RegisterController());
    HomeController homeController = Get.put(HomeController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 23.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: SvgPicture.asset(AppImages.welcomeScreenImage),
                ),
                Text(
                  textAlign: TextAlign.start,
                  "Hello there 👋, \nWelcome to studdy",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                SizedBox(height: 10.h,),
            
                Form(
                    child: Column(
                      children: [
                        TextField1(
                            obscureText: false,
                            controller: registerController.nameController,
                            label: "Name",
                            hint: "Enter your name",
                            prefixIcon: Icons.person_2_outlined),
                        SizedBox(height: 20.h),
                        TextField1(
                            obscureText: false,
                            controller: registerController.emailController,
                            label: "Email",
                            hint:"studdy@example.com",
                            prefixIcon: Icons.alternate_email_sharp),
                        SizedBox(height: 20.h),
                        TextField1(
                            obscureText: false,
                            controller: registerController.phoneController,
                            label: "Phone",
                            hint :"07XX XXX XXX",
                            prefixIcon: Icons.local_phone_outlined),
                        SizedBox(height: 20.h),
                        
                        Obx(
                          () => TextField1(
                            obscureText: registerController.obscureText.value,
                            controller: registerController.passwordController,
                            label: "Password",
                            hint: "Enter your password",
                            prefixIcon: Icons.fingerprint,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                registerController.togglePasswordVisibility();
                              },
                              child: Icon(registerController.obscureText.value? Icons.visibility: Icons.visibility_off),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        
                        GestureDetector(
                          onTap: () {
                            registerController.signupAction();
                            homeController.getUser();
                          },
                          child: const WelcomeButton(
                            text: "REGISTER",
                            background: true,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          "Or",
                          style: Theme.of(context)
                              .textTheme
                              .bodySmall
                              ?.copyWith(
                                  color: AppColors.blackTextColor,
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w400),
                        ),
                        SizedBox(height: 10.h),
                        const SignupWithGoogle(),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap: (){registerController.goToLoginPage();},
                          
                          child: Padding(
                            padding:  EdgeInsets.only(bottom: 8.h),
                            child: const SignupLogin(
                              text1:   "Already have an account? ",
                              text2:"Login"
                            ),
                          ),
                        ),
                        Obx(
                          () => registerController.isAuthenticating.value
                              ? const CircularProgressIndicator(
                                backgroundColor: AppColors.primaryColor,
                                color: AppColors.whiteColor,
                              ) // Show progress indicator when authenticating
                              : Container(), // Hide it when not authenticating
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}





