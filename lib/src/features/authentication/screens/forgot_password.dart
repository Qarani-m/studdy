import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:studdy/src/common_widgets/auth/large_button.dart';
import 'package:studdy/src/common_widgets/auth/text_field.dart';
import 'package:studdy/src/constants/image_strings.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    // ForgotPasswordController controller = Get.find();
    TextEditingController controller = TextEditingController();

    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.only(left:23.w, right:23,top:150),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
             SizedBox(
                  height: 200.h,
                  width: 200.w,
                  child: SvgPicture.asset(AppImages.forgetPasswordImage),
                ),
            Text(
              textAlign: TextAlign.center,
              "Forgot password",
              style: Theme.of(context).textTheme.titleLarge,
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              textAlign: TextAlign.center,
              "No worries! It happens. Please enter the phone number linked with your account.",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 10.h,
            ),
            TextField1(
                              obscureText: false,
                              controller: controller,
                              label: "Email",
                              hint:"studdy@example.com",

                              prefixIcon: Icons.alternate_email_sharp),
          SizedBox(
              height: 20.h,
            ),
            const WelcomeButton(
              text: "send code",
              background: true,
            )

          ],
        ),
      ),
    );
  }
}
