import 'package:bk_gas/core/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class OnbordingScreen extends StatelessWidget {
  const OnbordingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: GradientContainer(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(
                height: 10.h,
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: () => Get.offNamed(AppRoute.loginScreen),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColor.primaryColor),
                          borderRadius: BorderRadius.circular(20.r)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 20.w, vertical: 5.h),
                        child: Text(
                          'Skip',
                          style: TextStyle(
                            color: AppColor.primaryColor,
                            fontSize: 16.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  )),
              const Expanded(child: SizedBox()),
              Image.asset(
                AppImage.onbording,
                width: Get.width,
              ),
              const Expanded(child: SizedBox()),
              CustomBodyBtn(
                  title: "Get Started",
                  ontap: () {
                    Get.offNamed(AppRoute.loginScreen);
                  }),
              SizedBox(
                height: 60.h,
              )
            ],
          ),
        )),
      ),
    );
  }
}
