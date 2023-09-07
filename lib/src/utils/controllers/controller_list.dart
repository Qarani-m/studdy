import 'package:get/get.dart';
import 'package:studdy/src/features/authentication/controllers/forgot_password.dart';
import 'package:studdy/src/features/authentication/controllers/login_controller.dart';
import 'package:studdy/src/features/authentication/controllers/signup_controller.dart';

// Future<void> init() async{

// }



class InitDep implements Bindings{
  @override
  void dependencies() {
  Get.lazyPut(() => LoginController());
  Get.lazyPut(() => RegisterController());
  Get.lazyPut(() => ForgotPasswordController());
  
  }

}