import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: AppColor.textwhite,
            flexibleSpace: customAppber(),
          )
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                        width: Get.width / 1.5,
                        child: CustomTextFormField(
                            hintText: "Search", controller: searchController)),
                    Container(
                      height: 50.h,
                      width: 74.w,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Text(
                          'Search',
                          style: TextStyle(
                            color: AppColor.textwhite,
                            fontSize: 16.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  customAppber() {
    return Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
            //leading part here ===========================>
            Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Row(
                      children: [
                        Icon(
                          CupertinoIcons.location_solid,
                          color: AppColor.primaryColor,
                          size: 20.h,
                        ),
                        Row(
                          children: [
                            Text(
                              "Dhaka",
                              style: TextStyle(
                                color: AppColor.textblack,
                                fontSize: 14.sp,
                                fontFamily: 'Poppins',
                                fontWeight: FontWeight.w500,
                                height: 0,
                              ),
                            ),
                            const Icon(
                              Icons.keyboard_arrow_down,
                              color: AppColor.textblack,
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(left: 5.w),
                      child: Text(
                        'Dhaka - 1216,  Bangladesh',
                        style: TextStyle(
                          color: AppColor.textgrey,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          height: 0,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    )
                  ],
                ),
            //action value here=====================================================>
            Row(children: [
              IconButton(
                    onPressed: () {},
                    icon: Stack(
                      children: [
                        Icon(
                          Icons.notifications,
                          color: AppColor.primaryColor,
                          size: 24.h,
                        ),
                        Positioned(
                            top: 0,
                            right: 3,
                            child: Container(
                              decoration: const BoxDecoration(
                                  color: AppColor.colorRed,
                                  shape: BoxShape.circle),
                              child: Center(
                                child: Padding(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 2.w, vertical: 5.h),
                                  child: Text(
                                    '12',
                                    style: TextStyle(
                                      color: AppColor.textwhite,
                                      fontSize: 6.sp,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w500,
                                      height: 0.17,
                                    ),
                                  ),
                                ),
                              ),
                            ))
                      ],
                    )),
                    Container(
                      height: 50.h,
                      width: 50.w,
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle
                      ),
                      child: Image.asset(AppImage.accountImage),
                    )
            ],),
        ],
      ),
    );
  }
}
