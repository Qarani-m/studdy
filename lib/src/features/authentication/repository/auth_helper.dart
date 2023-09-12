import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:studdy/src/constants/colors.dart';
import 'package:studdy/src/features/authentication/controllers/onboarding_controller.dart';
import 'package:studdy/src/features/authentication/models/student_model.dart';
import 'package:studdy/src/features/authentication/repository/exceptions/login_exception.dart';
import 'package:studdy/src/features/authentication/repository/exceptions/sigup_exception.dart';
import 'package:studdy/src/features/authentication/repository/user_dbhelper.dart';
import 'package:studdy/src/features/authentication/screens/login.dart';
import 'package:studdy/src/features/authentication/screens/onboarding.dart';
import 'package:studdy/src/features/authentication/screens/welcome.dart';
import 'package:studdy/src/features/home/controllers/home_controller_main.dart';
import 'package:studdy/src/features/home/screens/home_page.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AuthHelper extends GetxController {
  static AuthHelper get instance => Get.find();

  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) async {
    if (user != null) {
      Future.delayed(const Duration(seconds: 1), () {
        Get.offAll(
            transition: Transition.cupertinoDialog,
            duration: const Duration(milliseconds: 700),
            binding: HomeBinding(),
            const HomePage());
      });
    } else {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool isFirstTimeUser = prefs.getBool("firstimer") ?? true;
      if (isFirstTimeUser) {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAll(
              transition: Transition.cupertinoDialog,
              duration: const Duration(milliseconds: 700),
              Onboarding(), binding: BindingsBuilder(() {
            Get.put(OnBoardingController); // Provide the controller here
          }));
        });
      } else {
        Future.delayed(const Duration(seconds: 1), () {
          Get.offAll(
              transition: Transition.cupertinoDialog,
              duration: const Duration(milliseconds: 700),
              const Welcome());
        });
      }
    }
  }

  Future<void> createUser(
      String email, String password, String name, String phone) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);
      if (firebaseUser.value != null) {
        // save to localdb
        await _saveToLocalDB(name, email, phone);
        // save to firestore
        await _saveToFireStore(
          name,
          email,
          phone,
        );
        Get.offAll(() => const HomePage());
        await _saveToFireStore(
          name,
          email,
          phone,
        );
      } else {
        Get.to(const Login());
      }
      firebaseUser.value != null
          ? Get.offAll(() => const HomePage())
          : Get.to(const Login());
    } on FirebaseAuthException catch (e) {
      final ex = SignUpFailure.code(e.code);
      _warningSnackBar("Sign-up failed", ex.message);

      throw ex;
    } catch (_) {
      const ex = SignUpFailure();
      _warningSnackBar("Sign-up failed", ex.message);
      throw ex;
    }
  }

  Future<void> _saveToFireStore(
    String name,
    String email,
    String phone,
  ) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.add({
      "name": name,
      "email": email,
      "phone": phone,
      "school": "",
      "courses": "",
      "studentId": "",
      "level": "",
      "dob": ""
    }).then((value) => print("User Added"));
  }

  Future<void> _saveToLocalDB(String name, String email, String phone) async {
    Student student = Student(
        name: name,
        email: email,
        phone: phone,
        school: "",
        courses: "",
        studentId: "",
        level: "",
        dob: "");
    print(await UserDbHelper.insertStudent(student));
  }

  Future<void> loginUser(String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      if (firebaseUser.value != null) {
        // readfirestore and restore the data
        await _getUserByEmail(email);
        Get.offAll(() => const HomePage());
      } else {
        Get.to(const Login());
      }
    } on FirebaseAuthException {
      const ex = LoginFailure();
      _warningSnackBar("Auth Failed", ex.message);
      throw ex;
    } catch (_) {
      const ex = LoginFailure();
      _warningSnackBar("Auth Failed", ex.message);
      throw ex;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>?> _getUserByEmail(
      String email) async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('users') // Replace with your collection name
              .where('email', isEqualTo: email)
              .limit(1)
              .get();
      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>>? userDoc =
            querySnapshot.docs.first;
        if (userDoc.exists) {
          Map<String, dynamic> userData = userDoc.data()!;
          Student student = Student(
              name: userData['name'],
              email: userData['email'],
              phone: userData['phone'],
              school: userData['school'],
              courses: userData['courses'].toString(),
              studentId: userData['studenId'],
              level: userData['level'],
              dob: userData['dob']);
          await UserDbHelper.insertStudent(student);
        } else {
          _warningSnackBar("Auth Failed", "User not found");
        }
        return querySnapshot.docs.first;
      } else {
        return null;
      }
    } catch (e) {
      print(e);
      _warningSnackBar("Auth Failed", e.toString());
      // print("catch====${e[]}");

      return null;
    }
  }

  Future<void> signoutUser() async => _auth.signOut();
  _warningSnackBar(String title, String message) {
    return Get.snackbar(
        colorText: Colors.white,
        snackPosition: SnackPosition.BOTTOM,
        margin: EdgeInsets.only(bottom: 5.h),
        maxWidth: 327.w,
        title,
        message,
        icon: const Icon(
          Icons.warning_amber_rounded,
          color: Colors.white,
        ),
        backgroundColor: AppColors.primaryDarkColor.withOpacity(0.8));
  }


Future<void> resetPassword(String email)async{
  try{
  await _auth.sendPasswordResetEmail(email: email,);


  }  on FirebaseAuthException catch(e){
    _warningSnackBar("Unknow User", "User does not exist");
    print(e.message );
  }catch(e){
    print(e.toString());
  }
}

}
