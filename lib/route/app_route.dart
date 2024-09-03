
import 'package:bk_gas/view/authe_screen/get_otp_screen.dart';
import 'package:bk_gas/view/authe_screen/login_screen.dart';
import 'package:bk_gas/view/authe_screen/profile_setup.dart';
import 'package:bk_gas/view/authe_screen/signup_screen.dart';
import 'package:bk_gas/view/bottom_bar.dart';
import 'package:bk_gas/view/home_screen/notification_screen.dart';
import 'package:bk_gas/view/home_screen/search_screen.dart';
import 'package:bk_gas/view/splash_screen/onbording.dart';
import 'package:bk_gas/view/splash_screen/splash.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoute {
  static String initialRout = "/initialRout";
  static String onbording = "/onbording";
  static String loginScreen = "/loginScreen";
  static String signupScreen = "/signUpScreen";
  static String getOtpScreen = "/getOtpScreen";
  static String profileSetup = "/profileSetup";
  static String bottomBarScreen = "/bottomBarScreen";
  static String searchScreen = "/searchScreen";
  static String notificationScreen = "/notificationScreen";
}

List<GetPage> getPage = [
  GetPage(name: AppRoute.initialRout, page: () => const SplashScreen(),transition: Transition.leftToRight,),
  GetPage(name: AppRoute.onbording, page: () => const OnbordingScreen(),transition: Transition.leftToRight,),
  GetPage(name: AppRoute.loginScreen, page: () => LoginScreen(),transition: Transition.leftToRight,),
  GetPage(name: AppRoute.signupScreen, page: () => SignupScreen(),transition: Transition.leftToRight,),
  GetPage(name: AppRoute.getOtpScreen, page: () =>const OtpCodeScreen(),transition: Transition.leftToRight,),
  GetPage(name: AppRoute.profileSetup, page: () =>ProfileSetup(),transition: Transition.leftToRight,),
  GetPage(name: AppRoute.bottomBarScreen, page: () =>BottomBarScreen(),transition: Transition.leftToRight,),
  GetPage(name: AppRoute.searchScreen, page: () =>SearchBarScreen(),transition: Transition.leftToRight,),
  GetPage(name: AppRoute.notificationScreen, page: () =>const NotificationScreen(),transition: Transition.fadeIn,),
];
