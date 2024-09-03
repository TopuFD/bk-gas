import 'package:bk_gas/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/custom_textfield.dart';
import 'package:bk_gas/widget/doc_text.dart';
import 'package:bk_gas/widget/gradient_container.dart';
import 'package:bk_gas/widget/heading_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
            width: Get.width,
            height: Get.height,
            child: GradientContainer(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50.h,
                    ),
                    Container(
                      height: 150.h,
                      width: 150.h,
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
                    const HeadingText(headingText: "SignIn"),
                    const DocumentText(
                        documentText: "Please enter your data to login"),
                    SizedBox(
                      height: 20.h,
                    ),
                    CustomTextFormField(
                      hintText: "Write your Email",
                      controller: emailController,
                      textFieldHeading: "Email",
                      prefixIcon: const Icon(Icons.email),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    CustomTextFormField(
                      hintText: "Write your password",
                      controller: passController,
                      textFieldHeading: "Email",
                      prefixIcon: const Icon(Icons.key),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_off)),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                    ),
                    const Expanded(child: SizedBox()),
                    CustomBodyBtn(
                        title: "LogIn",
                        ontap: () {
                          Get.toNamed(AppRoute.bottomBarScreen);
                        }),
                    const Expanded(child: SizedBox()),
                    RichText(
                        text: TextSpan(children: [
                      TextSpan(
                          text: "Don't have any Account?",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColor.textgrey,
                              fontFamily: "Poppins")),
                      TextSpan(
                          text: " SignUp",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColor.primaryColor,
                              fontFamily: "Poppins"),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(AppRoute.signupScreen);
                            })
                    ])),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ),
            )),
      ),
    );
  }
}
