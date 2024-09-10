import 'dart:async';

import 'package:bk_gas/core/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/widget/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      Get.toNamed(AppRoute.onbording);
    });
  }
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: AppColor.textwhite,
      statusBarIconBrightness: Brightness.dark
    ));
    
    return SafeArea(
      child: Scaffold(
          body: GradientContainer(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: 280.h,
                width: 280.h,
                decoration: BoxDecoration(
                    color: AppColor.primaryColor,
                    borderRadius: BorderRadius.circular(50.r)),
                child: Center(
                  child: Image.asset(AppImage.logo),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "B.K. Shop",
                style: TextStyle(
                  fontSize: 60.sp,
                  color: AppColor.primaryColor,
                  fontFamily: "InriaSans",
                ),
              )
            ],
          ),
        ),
      )),
    );
  }
}
