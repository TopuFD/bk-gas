import 'package:bk_gas/core/dependency.dart';
import 'package:bk_gas/core/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DependancyInjection di = DependancyInjection();
  di.dependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return GetMaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Demo',
          theme: ThemeData(
            scaffoldBackgroundColor: AppColor.textwhite,
          ),
          getPages: getPage,
          initialRoute: _getInitialRoute(),
        );
      },
    );
  }
  //============================================= login user checking method here
    String _getInitialRoute() {
    if (FirebaseAuth.instance.currentUser != null) {
      return AppRoute.bottomBarScreen;
    } else {
      return AppRoute.initialRout;
    }
  }
}
