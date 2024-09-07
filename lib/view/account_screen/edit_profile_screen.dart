import 'dart:io';
import 'package:bk_gas/controller/image_controller.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/text_style.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

//ignore: must_be_immutable
class EditProfileScreen extends StatelessWidget {
  EditProfileScreen({super.key}) {
    var userData = Get.arguments;

    nameController.text = (userData["name"] as RxString).value;
    emailController.text = (userData["email"] as RxString).value;
    locationController.text = (userData["location"] as RxString).value;
  }

  ImagePicController imageController = ImagePicController();
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController locationController = TextEditingController();

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
          child: SingleChildScrollView(
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
                      //======================profile image here=================>
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
                        ),
                      ),
                    )
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
                    "Change Picture",
                    style: CustomTextStyle.h1(fontSize: 16),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                //=============================================text fields start here
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.person),
                  controller: nameController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  prefixIcon: const Icon(Icons.email),
                  controller: emailController,
                ),
                SizedBox(
                  height: 10.h,
                ),
                CustomTextFormField(
                  maxLine: 2,
                  prefixIcon: const Icon(CupertinoIcons.location_solid),
                  controller: locationController,
                ),
                SizedBox(
                  height: Get.height * .1,
                ),
                CustomBodyBtn(
                    title: "Update Profile",
                    ontap: () {
                      Get.back();
                    })
              ],
            ),
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
              topLeft: Radius.circular(20.r), topRight: Radius.circular(20.r))),
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
