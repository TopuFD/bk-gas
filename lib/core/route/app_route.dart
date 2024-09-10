import 'package:bk_gas/view/account_screen/account_profile_screen.dart';
import 'package:bk_gas/view/account_screen/edit_profile_screen.dart';
import 'package:bk_gas/view/account_screen/inner_screen/settings/about_screen.dart';
import 'package:bk_gas/view/account_screen/inner_screen/settings/change_pass_screen.dart';
import 'package:bk_gas/view/account_screen/inner_screen/settings/privacy_policy_screen.dart';
import 'package:bk_gas/view/account_screen/inner_screen/settings/settings_screen.dart';
import 'package:bk_gas/view/account_screen/inner_screen/settings/terms_screen.dart';
import 'package:bk_gas/view/authe_screen/forget_pass_screen.dart';
import 'package:bk_gas/view/authe_screen/get_otp_screen.dart';
import 'package:bk_gas/view/authe_screen/login_screen.dart';
import 'package:bk_gas/view/authe_screen/profile_setup.dart';
import 'package:bk_gas/view/authe_screen/signup_screen.dart';
import 'package:bk_gas/view/bottom_bar.dart';
import 'package:bk_gas/view/cart_screen/checkout_screen.dart';
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
  static String forgetPassScreen = "/forgetPassScreen";

  static String signupScreen = "/signUpScreen";
  static String getOtpScreen = "/getOtpScreen";
  static String profileSetup = "/profileSetup";
  static String bottomBarScreen = "/bottomBarScreen";
  static String searchScreen = "/searchScreen";
  static String notificationScreen = "/notificationScreen";
  static String productDetailsScreen = "/productDetailsScreen";
  static String readMoreScreen = "/readMoreScreen";
  static String checkoutScreen = "/checkoutScreen";

  static String accountProfileScreen = "/accountProfileScreen";
  static String editProfilScreen = "/editProfilScreen";
  static String settingsScreen = "/settingsScreen";
  static String changePassScreen = "/changePassScreen";
  static String aboutScreen = "/aboutScreen";
  static String termConditionScreen = "/termConditionScreen";
  static String privacyScreen = "/privacyScreen";
}

List<GetPage> getPage = [
  GetPage(
    name: AppRoute.initialRout,
    page: () => const SplashScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.onbording,
    page: () => const OnbordingScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.loginScreen,
    page: () => LoginScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.forgetPassScreen,
    page: () => ForgetPassScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.signupScreen,
    page: () => SignupScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.getOtpScreen,
    page: () => const OtpCodeScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.profileSetup,
    page: () => ProfileSetup(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.bottomBarScreen,
    page: () => BottomBarScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.searchScreen,
    page: () => SearchBarScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.notificationScreen,
    page: () => const NotificationScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.productDetailsScreen,
    page: () => ProductDetailsScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.readMoreScreen,
    page: () => const ReadMore(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.checkoutScreen,
    page: () => CheckoutScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.accountProfileScreen,
    page: () => AccountProfileScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.editProfilScreen,
    page: () => EditProfileScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.settingsScreen,
    page: () => const SettingsScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.changePassScreen,
    page: () => ChangePassScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.aboutScreen,
    page: () => const AboutScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.termConditionScreen,
    page: () => const TermsScreen(),
    transition: Transition.fade,
  ),
  GetPage(
    name: AppRoute.privacyScreen,
    page: () => const PrivacyPolicyScreen(),
    transition: Transition.fade,
  ),
];
