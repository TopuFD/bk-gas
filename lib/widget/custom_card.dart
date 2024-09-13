import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/widget/doc_text.dart';
import 'package:bk_gas/widget/heading_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
      required this.weight,
      required this.rating,
      this.ontap});
  String imagePath;
  String title;
  String weight;
  String price;
  String rating;
  VoidCallback? ontap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
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
                clipBehavior: Clip.antiAlias,
                decoration: BoxDecoration(
                    border: Border.all(color: AppColor.primaryColor),
                    borderRadius: BorderRadius.circular(15.r)),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.r),
                  child: CachedNetworkImage(
                    fit: BoxFit.cover,
                    imageUrl: imagePath,
                    placeholder: (context, url) => SizedBox(
                        height: 30.h,
                        width: 30.w,
                        child: const Center(
                            child: CircularProgressIndicator(
                          color: AppColor.primaryColor,
                        ))),
                    errorWidget: (context, url, error) =>
                        const Icon(Icons.error),
                  ),
                ),
              ),
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
                        DocumentText(documentText: rating)
                      ],
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
}
