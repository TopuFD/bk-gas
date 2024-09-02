import 'package:bk_gas/view/splash_screen/onbording.dart';
import 'package:bk_gas/view/splash_screen/splash.dart';
import 'package:get/get_navigation/get_navigation.dart';

class AppRoute {
  static String initialRout = "/initialRout";
  static String onbording = "/onbording";
}

List<GetPage> getPage = [
  GetPage(name: AppRoute.initialRout, page: () => const SplashScreen()),
  GetPage(name: AppRoute.onbording, page: () => const OnbordingScreen()),
];
