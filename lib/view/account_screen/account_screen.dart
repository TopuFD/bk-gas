import 'dart:io';

import 'package:bk_gas/controller/auth_controller.dart';
import 'package:bk_gas/controller/image_controller.dart';
import 'package:bk_gas/core/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AccountScreen extends StatelessWidget {
  AccountScreen({super.key});

  AutheController autheController = Get.find<AutheController>();
  ImagePicController imageController = ImagePicController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              backgroundColor: AppColor.textwhite,
              automaticallyImplyLeading: false,
              shadowColor: AppColor.textwhite,
              surfaceTintColor: AppColor.textwhite,
              scrolledUnderElevation: 0,
              flexibleSpace: myAppbar("Sabrina Carpenter"),
            )),
        body: Column(
          children: [
            accountBodyItem("Account", Icons.person, () {
              Get.toNamed(AppRoute.accountProfileScreen);
            }),
            accountBodyItem("My order", Icons.shopping_bag_sharp, () {}),
            accountBodyItem(
                "Monthly consumption", Icons.calendar_month_outlined, () {}),
            accountBodyItem("Loyalty", Icons.card_giftcard, () {}),
            accountBodyItem("Settings", Icons.settings, () {
              Get.toNamed(AppRoute.settingsScreen);
            }),
            accountBodyItem("Logout", Icons.logout, () {
              customDialogBox();
            }),
          ],
        ));
  }

  //=====================================> account body items
  Widget accountBodyItem(String title, IconData iconData, VoidCallback ontap) {
    return InkWell(
      onTap: ontap,
      child: ListTile(
        leading: Icon(
          iconData,
          color: AppColor.primaryColor,
        ),
        title: Text(
          title,
          style: TextStyle(
            color: AppColor.textblack,
            fontSize: 16.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w400,
            height: 0.09,
          ),
        ),
        trailing: const Icon(
          Icons.arrow_forward_ios,
          color: AppColor.textblack,
        ),
      ),
    );
  }

  //=============================================custom appbar for that screen
  Widget myAppbar(String title) {
    return Padding(
      padding: EdgeInsets.only(left: 20.w, top: 40.h),
      child: Container(
        color: AppColor.textwhite,
        child: Row(
          children: [
            Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.textlightBlue,
                  ),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Obx(() {
                    return imageController.imagePath!.isNotEmpty
                        ? Center(
                            child: Image.file(
                              File(imageController.imagePath!.value),
                              fit: BoxFit.cover,
                              height: 50.h,
                              width: 50.w,
                            ),
                          )
                        : Center(
                            child: Icon(
                              Icons.person,
                              color: AppColor.secondaryColor,
                              size: 40.h,
                            ),
                          );
                  }),
                )),
            SizedBox(
              width: 10.w,
            ),
            Text(
              title,
              style: TextStyle(
                color: AppColor.textblack,
                fontSize: 18.sp,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            )
          ],
        ),
      ),
    );
  }

  // logout bottom sheet==============================================>
  customDialogBox() {
    return Get.defaultDialog(
      title: "Logout",
      titleStyle: TextStyle(
        color: AppColor.colorRed,
        fontSize: 20.sp,
        fontFamily: 'Open Sans',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
      content: SizedBox(
        height: 130.h,
        width: Get.width,
        child: Column(
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              'Are you sure you want to log out?',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.textgrey,
                fontSize: 16.sp,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w400,
                height: 0,
              ),
            ),
            SizedBox(
              height: 40.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                    width: 100.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColor.primaryColor),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Cancel',
                        textAlign: TextAlign.center,
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
                ),
                InkWell(
                  onTap: () {
                    autheController.logOut().then((value) {
                      Get.offAllNamed(AppRoute.loginScreen);
                    });
                  },
                  child: Container(
                    width: 100.w,
                    height: 45.h,
                    decoration: BoxDecoration(
                      color: AppColor.primaryColor,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Logout',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: AppColor.textwhite,
                          fontSize: 16.sp,
                          fontFamily: 'Open Sans',
                          fontWeight: FontWeight.w600,
                          height: 0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
