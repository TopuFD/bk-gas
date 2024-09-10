import 'package:bk_gas/core/route/app_route.dart';
import 'package:bk_gas/utils/text_style.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ForgetPassScreen extends StatelessWidget {
  ForgetPassScreen({super.key});

  TextEditingController emailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Forget Password",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          children: [
            SizedBox(
              height: 20.h,
            ),
            Text(
              "Please enter your number to reset your \npassword",
              style: CustomTextStyle.h3(),
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.email),
              controller: emailController,
              hintText: "Enter your email",
            ),
            const Expanded(child: SizedBox()),
            CustomBodyBtn(
                title: "Send OTP",
                ontap: () {
                  Get.toNamed(AppRoute.getOtpScreen);
                }),
            SizedBox(height: 10.h,)
          ],
        ),
      ),
    );
  }
}
