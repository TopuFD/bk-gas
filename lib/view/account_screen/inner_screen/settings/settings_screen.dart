import 'package:bk_gas/core/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/text_style.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Settings",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20.h,
            ),
          
            settingItems(
              title: "Change Password",
              iconData: Icons.key,
              ontap: () {
                Get.toNamed(AppRoute.changePassScreen);
              },
            ),
            settingItems(
              title: "About Us",
              iconData: CupertinoIcons.exclamationmark_circle_fill,
              ontap: () {
                Get.toNamed(AppRoute.aboutScreen);
              },
            ),
            settingItems(
              title: "Terms & Conditions",
              iconData: CupertinoIcons.exclamationmark_triangle_fill,
              ontap: () {
                Get.toNamed(AppRoute.termConditionScreen);
              },
            ),
            settingItems(
              title: "Privacy Policy",
              iconData: CupertinoIcons.question_circle_fill,
              ontap: () {
                Get.toNamed(AppRoute.privacyScreen);
              },
            ),
          ],
        ),
      ),
    );
  }

  settingItems({String? title, IconData? iconData, VoidCallback? ontap}) {
    return ListTile(
      onTap: ontap,
      leading: Icon(
        iconData,
        color: AppColor.primaryColor,
        size: 24.h,
      ),
      title: Text(
        title!,
        style: CustomTextStyle.h2(fontSize: 16, color: AppColor.textgrey),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios,
        color: AppColor.textgrey,
        size: 16.h,
      ),
    );
  }
}
