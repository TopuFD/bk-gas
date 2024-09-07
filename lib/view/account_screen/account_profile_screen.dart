import 'dart:io';

import 'package:bk_gas/controller/image_controller.dart';
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
              Stack(
                clipBehavior: Clip.none,
                children: [
                  Container(
                      height: 130,
                      width: 130,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: AppColor.textlightBlue,
                        ),
                        shape: BoxShape.circle,
                      ),
                      //=================================profile image here=================>
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
                      )),
                  Positioned(
                      bottom: -14,
                      right: -22,
                      child: IconButton(
                          onPressed: () {
                            showModalSheet(context);
                          },
                          icon: Icon(
                            Icons.image_outlined,
                            color: AppColor.primaryColor,
                            size: 42.h,
                          )))
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              Text(
                "Subrina Carpernter",
                style: CustomTextStyle.h2(),
              ),
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "Edit Account",
                    style: CustomTextStyle.h1(fontSize: 16),
                  )),
              userCard(iconData: Icons.person, title: "Sabrina Carpenter"),
              userCard(iconData: Icons.email, title: "sabrina@ymail.com"),
              userCard(
                  heights: 100.h,
                  iconData: CupertinoIcons.location_solid,
                  title: "2972 Westheimer Rd. Santa Ana,Illinois 85486"),
            ],
          ),
        ),
      ),
    );
  }

  //===========================userDataCard=====================
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

  // here is modal bottomsheet bellow=======================>
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
                          semanticLabel: "Camera",
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
                          semanticLabel: "Grllary",
                          size: 100.sp,
                        ))
                  ],
                )
              ],
            ),
          );
        });
  }
}
