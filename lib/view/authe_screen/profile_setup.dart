import 'dart:io';
import 'package:bk_gas/controller/image_controller.dart';
import 'package:bk_gas/core/route/app_route.dart';
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
class ProfileSetup extends StatelessWidget {
  ProfileSetup({super.key});

  ImagePicController imagePicController = Get.put(ImagePicController());
  TextEditingController ganderController = TextEditingController();
  TextEditingController birthController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: "Fill out your profile"),
        body: GradientContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: SingleChildScrollView(
              child: SizedBox(
                width: Get.width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 10.h,
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
                              child: ClipOval(
                                child: Obx(() {
                                  return imagePicController.imagePath!.isEmpty
                                      ? Icon(
                                          Icons.person,
                                          color: AppColor.secondaryColor,
                                          size: 100.h,
                                        )
                                      : Image.file(
                                          File(imagePicController
                                              .imagePath!.value),
                                          fit: BoxFit.cover,
                                          height: 130.h,
                                          width: 130.w,
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
                        height: 15.h,
                      ),
                      const HeadingText(headingText: "Upload Profile Picture"),
                      SizedBox(
                        height: 30.h,
                      ),
                      //gender picker here============================================>
                      CustomTextFormField(
                        hintText: "Gender",
                        controller: ganderController,
                        suffixIcon: IconButton(
                          icon: const Icon(Icons.keyboard_arrow_down),
                          onPressed: () {
                            customMenuBtn(context, "Male", "Female", "Custom");
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      //date of birth picker======================================>
                      CustomTextFormField(
                        hintText: "Date of Birth",
                        controller: birthController,
                        suffixIcon: IconButton(
                          onPressed: () async {
                            dateOfBirth(context);
                          },
                          icon: const Icon(Icons.calendar_month),
                        ),
                      ),

                      SizedBox(
                        height: 15.h,
                      ),
                      // address fields start from here============================>
                      CustomTextFormField(
                        hintText: "Email",
                        controller: emailController,
                        prefixIcon: const Icon(Icons.email),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      TextFormField(
                        maxLines: 3,
                        decoration: InputDecoration(
                            filled: true,
                            fillColor: AppColor.secondaryColor,
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide:
                                    const BorderSide(color: AppColor.colorRed)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide:
                                    const BorderSide(color: AppColor.colorRed)),
                            disabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide:
                                    const BorderSide(color: AppColor.colorRed)),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.r),
                                borderSide:
                                    const BorderSide(color: AppColor.colorRed)),
                            contentPadding: EdgeInsets.only(
                                left: Get.height * .02,
                                top: Get.height * .022,
                                bottom: Get.height * .022),
                            hintText: "Address",
                            prefixIconColor: AppColor.primaryColor,
                            suffixIconColor: AppColor.primaryColor),
                      ),
                      SizedBox(
                        height: 30.h,
                      ),
                      CustomBodyBtn(
                          title: "Continue",
                          ontap: () {
                            Get.toNamed(AppRoute.bottomBarScreen);
                          })
                    ]),
              ),
            ),
          ),
        ));
  }

  //custom menu btn here=================================================>
  void customMenuBtn(
      BuildContext context, String btnOne, String btnTwo, String btnThree) {
    showMenu<String>(
      context: context,
      position: const RelativeRect.fromLTRB(50, 50, 0, 0),
      items: [
        PopupMenuItem<String>(
          value: btnOne,
          child: ListTile(
            title: Text(btnOne),
          ),
        ),
        PopupMenuItem<String>(
          value: btnTwo,
          child: ListTile(
            title: Text(btnTwo),
          ),
        ),
        PopupMenuItem<String>(
          value: btnThree,
          child: ListTile(
            title: Text(btnThree),
          ),
        ),
      ],
    ).then((value) {
      if (value != null) {
        ganderController.text = value;
      }
    });
  }

  // date of birth picker here ================================>
  Future dateOfBirth(BuildContext context) async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime(2100),
      builder: (BuildContext context, Widget? child) {
        return Theme(
          data: ThemeData.light().copyWith(
            primaryColor: Colors.pinkAccent,
            buttonTheme:
                const ButtonThemeData(textTheme: ButtonTextTheme.primary),
          ),
          child: child!,
        );
      },
    );
    if (selectedDate != null && selectedDate != DateTime.now()) {
      birthController.text = "${selectedDate.toLocal()}".split(' ')[0];
    }
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
                          imagePicController.pickImageCemara();
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
                          imagePicController.pickImageGellary();
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
