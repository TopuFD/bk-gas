import 'package:bk_gas/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/custom_textfield.dart';
import 'package:bk_gas/widget/gradient_container.dart';
import 'package:bk_gas/widget/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SignupScreen extends StatelessWidget {
  SignupScreen({super.key});
  TextEditingController nameController = TextEditingController();
  RxBool isCheck = false.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: "SignUp"),
        body: GradientContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: 10.h,
                  ),
                  const Align(
                      alignment: Alignment.topLeft,
                      child: HeadingText(headingText: "Sign Up To Join")),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    hintText: "Name",
                    controller: nameController,
                    prefixIcon: const Icon(Icons.person),
                    textFieldHeading: "Name",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    hintText: "Last Name",
                    controller: nameController,
                    prefixIcon: const Icon(Icons.person),
                    textFieldHeading: "Last Name",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    hintText: "Password",
                    controller: nameController,
                    prefixIcon: const Icon(Icons.person),
                    textFieldHeading: "Password",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomTextFormField(
                    hintText: "Confirm Password",
                    controller: nameController,
                    prefixIcon: const Icon(Icons.person),
                    textFieldHeading: "Confirm Password",
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(height: 20.h,),
                  SizedBox(
                    width: Get.width,
                    child: Row(
                      children: [
                        Obx(() {
                          return Checkbox(
                              activeColor: AppColor.primaryColor,
                              value: isCheck.value,
                              onChanged: (value) {
                                isCheck.value = value!;
                              });
                        }),
                        Text.rich(
                          TextSpan(
                            children: [
                              TextSpan(
                                text: 'By creating an account, I accept the ',
                                style: TextStyle(
                                  color: AppColor.textgrey,
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '\nTerms& Conditions ',
                                style: TextStyle(
                                  color: AppColor.textlightBlue,
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '& ',
                                style: TextStyle(
                                  color: AppColor.textgrey,
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: AppColor.textlightBlue,
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                              TextSpan(
                                text: '.',
                                style: TextStyle(
                                  color: AppColor.textgrey,
                                  fontSize: 14.sp,
                                  fontFamily: 'Poppins',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: 40.h,),
                  CustomBodyBtn(
                      title: "Sign Up",
                      ontap: () {
                        Get.toNamed(AppRoute.getOtpScreen);
                      }),
                ],
              ),
            ),
          ),
        ));
  }
}
