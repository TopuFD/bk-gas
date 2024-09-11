import 'package:bk_gas/controller/auth_controller.dart';
import 'package:bk_gas/core/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/utils/string.dart';
import 'package:bk_gas/utils/text_style.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/custom_textfield.dart';
import 'package:bk_gas/widget/doc_text.dart';
import 'package:bk_gas/widget/gradient_container.dart';
import 'package:bk_gas/widget/heading_text.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  AutheController autheController = Get.find<AutheController>();
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
                    // =======================================email textfield here
                    CustomTextFormField(
                      hintText: "Write your Email",
                      controller: autheController.emailController.value,
                      textFieldHeading: "Email",
                      prefixIcon: const Icon(Icons.email),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStaticStrings.enterValidEmail;
                        } else if (!AppStaticStrings.emailRegexp.hasMatch(
                            autheController.emailController.value.text)) {
                          return AppStaticStrings.enterValidEmail;
                        } else {
                          return null;
                        }
                      },
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    //=========================================password textfield
                    CustomTextFormField(
                      hintText: "Write your password",
                      controller: autheController.passwordController.value,
                      textFieldHeading: "Email",
                      prefixIcon: const Icon(Icons.key),
                      suffixIcon: IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.visibility_off)),
                      obscureText: true,
                      keyboardType: TextInputType.number,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return AppStaticStrings.passWordMustBeAtLeast;
                        } else if (value.length < 8 ||
                            !AppStaticStrings.passRegexp.hasMatch(value)) {
                          return AppStaticStrings.passwordLengthAndContain;
                        } else {
                          return null;
                        }
                      },
                    ),
                    // ============================================ forget password button
                    Align(
                        alignment: Alignment.topRight,
                        child: TextButton(
                            onPressed: () {
                              Get.toNamed(AppRoute.forgetPassScreen);
                            },
                            child: Text(
                              "Forget password",
                              style: CustomTextStyle.h1(fontSize: 17),
                            ))),
                    const Expanded(child: SizedBox()),
                    //============================================login button start here
                    CustomBodyBtn(
                        title: "LogIn",
                        ontap: () {
                          autheController.logIn();
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
