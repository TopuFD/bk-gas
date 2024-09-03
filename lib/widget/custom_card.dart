import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/widget/doc_text.dart';
import 'package:bk_gas/widget/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CustomCard extends StatelessWidget {
  CustomCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.price,
      required this.weight});
  String imagePath;
  String title;
  String weight;
  String price;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 270.h,
      width: 165.w,
      decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(15)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 6.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
                height: 125.h,
                width: 124.w,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(15.r)),
                child: Image.asset(imagePath)),
            SizedBox(
              height: 5.h,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: HeadingText(headingText: title)),
            SizedBox(
              height: 5.h,
            ),
            Align(
                alignment: Alignment.topLeft,
                child: DocumentText(documentText: "$weight kg")),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  HeadingText(headingText: "\$$price"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SvgPicture.asset(AppImage.koinImage),
                      DocumentText(documentText: "100")
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
