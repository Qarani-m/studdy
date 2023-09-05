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
import 'package:studdy/src/features/authentication/controllers/login_controller.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.find();

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
                  "Welcome back! \nGlad to see you again",
                  style: Theme.of(context).textTheme.titleLarge,
                ),
              
                SizedBox(
                  height: 23.h,
                ),
                Form(
                    child: Column(
                      children: [
                        TextField1(
                            obscureText: false,
                            controller: controller.emailController,
                            label: "Email",
                            hint:"studdy@example.com",

                            prefixIcon: Icons.alternate_email_sharp),
                        SizedBox(height: 20.h),
                        Obx(
                          () => TextField1(
                            obscureText: controller.obscureText.value,
                            controller: controller.passwordController,
                            label: "Password",
                            hint: "Enter your password",

                            prefixIcon: Icons.fingerprint,
                            suffixIcon: GestureDetector(
                              onTap: () {
                                controller.togglePasswordVisibility();
                              },
                              child: Icon(controller.obscureText.value
                                  ? Icons.visibility
                                  : Icons.visibility_off),
                            ),
                          ),
                        ),
                        SizedBox(height: 15.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {controller.goToForgotPassword();},
                              child: Text(
                                "Forgot password?",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(
                                        color: AppColors.primaryColor,
                                        fontWeight: FontWeight.w500),
                              ),
                            )
                          ],
                        ),
                        SizedBox(height: 15.h),
                        GestureDetector(
                          onTap: () {
                            controller.loginAction();
                          },
                          child: const WelcomeButton(
                            text: "LOGIN",
                            background: true,
                          ),
                        ),
                        SizedBox(height: 20.h),
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
                        SizedBox(height: 20.h),
                        const SignupWithGoogle(),
                        SizedBox(
                          height: 20.h,
                        ),
                        GestureDetector(
                          onTap:(){controller.goToRegisterPage();},
                          child:const  Padding(
                            padding: EdgeInsets.only(bottom: 8.0),
                            child:SignupLogin(text1:"Don't have an account? ",text2:"Register"),
                          ),
                        ),
                        Obx(
                          () => controller.isAuthenticating.value
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
