
import 'package:bk_gas/view/authe_screen/get_otp_screen.dart';
import 'package:bk_gas/view/authe_screen/login_screen.dart';
import 'package:bk_gas/view/authe_screen/profile_setup.dart';
import 'package:bk_gas/view/authe_screen/signup_screen.dart';
import 'package:bk_gas/view/bottom_bar.dart';
import 'package:bk_gas/view/splash_screen/onbording.dart';
import 'package:bk_gas/view/splash_screen/splash.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoute {
  static String initialRout = "/initialRout";
  static String onbording = "/onbording";
  static String loginScreen = "/loginScreen";
  static String signupScreen = "/signUpScreen";
  static String getOtpScreen = "/getOtpScreen";
  static String profileSetup = "/profileSetup";
  static String bottomBarScreen = "/bottomBarScreen";
}

List<GetPage> getPage = [
  GetPage(name: AppRoute.initialRout, page: () => const SplashScreen(),curve: Curves.bounceOut,),
  GetPage(name: AppRoute.onbording, page: () => const OnbordingScreen(),curve: Curves.bounceOut,),
  GetPage(name: AppRoute.loginScreen, page: () => LoginScreen(),curve: Curves.bounceOut,),
  GetPage(name: AppRoute.signupScreen, page: () => SignupScreen(),curve: Curves.bounceOut,),
  GetPage(name: AppRoute.getOtpScreen, page: () =>const OtpCodeScreen(),curve: Curves.bounceOut,),
  GetPage(name: AppRoute.profileSetup, page: () =>ProfileSetup(),curve: Curves.bounceOut,),
  GetPage(name: AppRoute.bottomBarScreen, page: () =>BottomBarScreen(),curve: Curves.bounceOut,),
];
