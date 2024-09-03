
import 'package:bk_gas/view/authe_screen/get_otp_screen.dart';
import 'package:bk_gas/view/authe_screen/login_screen.dart';
import 'package:bk_gas/view/authe_screen/profile_setup.dart';
import 'package:bk_gas/view/authe_screen/signup_screen.dart';
import 'package:bk_gas/view/bottom_bar.dart';
import 'package:bk_gas/view/details_screen/product_details_screen.dart';
import 'package:bk_gas/view/details_screen/read_more.dart';
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
  static String productDetailsScreen = "/productDetailsScreen";
  static String readMoreScreen = "/readMoreScreen";
}

List<GetPage> getPage = [
  GetPage(name: AppRoute.initialRout, page: () => const SplashScreen(),transition: Transition.fade,),
  GetPage(name: AppRoute.onbording, page: () => const OnbordingScreen(),transition: Transition.fade,),
  GetPage(name: AppRoute.loginScreen, page: () => LoginScreen(),transition: Transition.fade,),
  GetPage(name: AppRoute.signupScreen, page: () => SignupScreen(),transition: Transition.fade,),
  GetPage(name: AppRoute.getOtpScreen, page: () =>const OtpCodeScreen(),transition: Transition.fade,),
  GetPage(name: AppRoute.profileSetup, page: () =>ProfileSetup(),transition: Transition.fade,),
  GetPage(name: AppRoute.bottomBarScreen, page: () =>BottomBarScreen(),transition: Transition.fade,),
  GetPage(name: AppRoute.searchScreen, page: () =>SearchBarScreen(),transition: Transition.fade,),
  GetPage(name: AppRoute.notificationScreen, page: () =>const NotificationScreen(),transition: Transition.fade,),
  GetPage(name: AppRoute.productDetailsScreen, page: () => ProductDetailsScreen(),transition: Transition.fade,),
  GetPage(name: AppRoute.readMoreScreen, page: () =>const ReadMore(),transition: Transition.fade,),
];
