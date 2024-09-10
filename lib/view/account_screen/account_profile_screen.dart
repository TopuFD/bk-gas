
import 'dart:io';
import 'package:bk_gas/controller/image_controller.dart';
import 'package:bk_gas/core/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/text_style.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class AccountProfileScreen extends StatelessWidget {
  AccountProfileScreen({super.key});

  ImagePicController imageController = ImagePicController();
  RxString name = "subrina Carpenter".obs;
  RxString email = "sabrina@ymail.com".obs;
  RxString location = "2972 Westheimer Rd. Santa Ana,Illinois 85486".obs;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Account",
      ),
      body: SizedBox(
        width: Get.width,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
              ),
              // Profile Image with Obx to observe imagePath changes
              Container(
                height: 130,
                width: 130,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: AppColor.textlightBlue,
                  ),
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Obx(() {
                    return imageController.imagePath!.isNotEmpty
                        ? Image.file(
                            File(imageController.imagePath!.value),
                            fit: BoxFit.cover,
                            height: 130.h,
                            width: 130.w,
                          )
                        : Icon(
                            Icons.person,
                            color: AppColor.secondaryColor,
                            size: 100.h,
                          );
                  }),
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              // Name displayed without Obx (since it's already updated elsewhere)
              Text(
                "Subrina Carpernter",
                style: CustomTextStyle.h2(),
              ),
              TextButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.editProfilScreen, arguments: {
                      "name": name,
                      "email": email,
                      "location": location,
                    });
                  },
                  child: Text(
                    "Edit Account",
                    style: CustomTextStyle.h1(fontSize: 16),
                  )),
              // User cards are wrapped in Obx only at the parent level
              Obx(() => userCard(
                  iconData: Icons.person, title: name.value)),
              Obx(() => userCard(
                  iconData: Icons.email, title: email.value)),
              Obx(() => userCard(
                  heights: 100.h,
                  iconData: CupertinoIcons.location_solid,
                  title: location.value)),
            ],
          ),
        ),
      ),
    );
  }

  // User Data Card (No Obx needed here)
  userCard({String? title, double? heights, IconData? iconData}) {
    return Container(
      height: heights ?? 60.h,
      width: Get.width,
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        border: Border.all(color: AppColor.primaryColor),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Center(
        child: ListTile(
          leading: Icon(
            iconData,
            color: AppColor.primaryColor,
          ),
          title: Text(
            title.toString(),
            style: CustomTextStyle.h2(fontSize: 14, color: AppColor.textgrey),
          ),
        ),
      ),
    );
  }

  // Modal Bottom Sheet for Image Picker
  void showModalSheet(BuildContext context) {
    showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.r),
              topRight: Radius.circular(20.r))),
      context: context,
      builder: (context) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 10.h),
          child: ListView(
            shrinkWrap: true,
            children: [
              Text(
                "Pick Your Image",
                style: TextStyle(
                    fontSize: 20.sp,
                    color: Colors.black,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
              SizedBox(
                height: 10.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  IconButton(
                      onPressed: () async {
                        imageController.pickImageCemara();
                        Get.back();
                      },
                      icon: Icon(
                        Icons.camera,
                        color: Colors.blue,
                        size: 100.sp,
                      )),
                  IconButton(
                      onPressed: () async {
                        imageController.pickImageGellary();
                        Get.back();
                      },
                      icon: Icon(
                        Icons.image,
                        color: Colors.blue,
                        size: 100.sp,
                      ))
                ],
              )
            ],
          ),
        );
      },
    );
  }
}

