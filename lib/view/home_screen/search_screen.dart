import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class SearchBarScreen extends StatelessWidget {
  SearchBarScreen({super.key});
  var searchText = Get.arguments["searchText"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
        child: AppBar(
          backgroundColor: AppColor.textwhite,
          automaticallyImplyLeading: false,
          scrolledUnderElevation: 0,
          surfaceTintColor: AppColor.textwhite,
          shadowColor: AppColor.textwhite,
          flexibleSpace: searchAppbar(),
        ),
      ),
      body: const Column(
        children: [],
      ),
    );
  }

  Widget searchAppbar() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 15.h),
            child: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: AppColor.textblack,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 35.h),
            child: SizedBox(
              width: Get.width / 1.3,
              child: CustomTextFormField(
                prefixIcon: const Icon(Icons.search, color: AppColor.textgrey),
                controller: searchText,
                suffixIcon: IconButton(
                  onPressed: () {
                    searchText.clear();
                  },
                  icon: const Icon(Icons.cancel, color: AppColor.colorRed),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
