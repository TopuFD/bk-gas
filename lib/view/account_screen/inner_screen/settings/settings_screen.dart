import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/text_style.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:bk_gas/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  TextEditingController currentPass = TextEditingController();
  TextEditingController newPass = TextEditingController();
  TextEditingController confirmPass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Settings",
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.visibility_off)),
              controller: currentPass,
              obscureText: false,
              hintText: "Current Password",
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.visibility_off)),
              controller: newPass,
              obscureText: false,
              hintText: "New password",
            ),
            SizedBox(
              height: 10.h,
            ),
            CustomTextFormField(
              prefixIcon: const Icon(Icons.lock),
              suffixIcon:
                  IconButton(onPressed: () {}, icon: const Icon(Icons.visibility_off)),
              controller: confirmPass,
              obscureText: false,
              hintText: "Confirm new password",
            ),
            TextButton(onPressed: (){
              // Get.toNamed(approu)
            }, child: Text("Forget Password",style: CustomTextStyle.h2(color: AppColor.primaryColor),))
          ],
        ),
      ),
    );
  }
}
