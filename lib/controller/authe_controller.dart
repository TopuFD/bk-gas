import 'package:bk_gas/core/route/app_route.dart';
import 'package:email_otp/email_otp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AutheController extends GetxController {
  //=============================================email and pass controller here
  Rx<TextEditingController> emailController = TextEditingController().obs;
  Rx<TextEditingController> passwordController = TextEditingController().obs;

  // ======================================================send otp code here
  String? sendOtp;

  //=======================================firebaseauth instance here=======================
  final firebaseAuth = FirebaseAuth.instance;

  //=======================================sign up method here==========================>
  signUp() async {
    try {
      if (emailController.value.text.isNotEmpty &&
          passwordController.value.text.isNotEmpty) {
        await EmailOTP.sendOTP(email: emailController.value.text);
        var otp = EmailOTP.getOTP();
        sendOtp = otp;
        Get.toNamed(AppRoute.getOtpScreen);
        Get.snackbar("OTP", "Send OTP in your Email");
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.snackbar("Pass Error", "Password is weak");
      } else if (e.code == 'email-already-in-use') {
        Get.snackbar("Email", "Email is used");
      }
    } catch (e) {
      Get.snackbar("Error!", "Error!");
    }
  }

  // =================================================verify OTP code and create user
  verifyOtp(String userInputOtp) async {
    try {
      if (sendOtp != null && sendOtp == userInputOtp) {
        await firebaseAuth.createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passwordController.value.text,
        );
        Get.snackbar("Sign In", "Sign In successfully");
        Get.offAllNamed(AppRoute.profileSetup);
      } else {
        Get.snackbar("Error", "OTP does not match");
      }
    } catch (e) {
      Get.snackbar("Error", "Error creating user");
    }
  }
}
