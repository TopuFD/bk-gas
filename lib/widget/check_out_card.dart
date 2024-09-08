import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CheckOutCard extends StatelessWidget {
  CheckOutCard({
    super.key,
    required this.imagePath,
    this.title,
    required this.price,
    this.weight,
    this.orderId,
    required this.productCount,
  });
  String imagePath;
  String? title;
  String price;
  String? weight;
  RxInt productCount;
  String? orderId;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.h),
      height: 83.h,
      width: Get.width,
      decoration: BoxDecoration(
          color: AppColor.secondaryColor,
          borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 5.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Image.asset(
                  AppImage.productImage,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    title != null?Text(
                      title!,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 14.sp,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ):Text(
                      orderId!,
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 14.sp,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                    Text(
                      "$weight kg",
                      style: TextStyle(
                        color: const Color(0xFF787676),
                        fontSize: 10.sp,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w400,
                        height: 0,
                      ),
                    ),
                    Text(
                      "\$$price",
                      style: TextStyle(
                        color: const Color(0xFF333333),
                        fontSize: 14.sp,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w600,
                        height: 0,
                      ),
                    ),
                  ],
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: SizedBox(child: Obx(() {
                return Row(
                  children: [
                    InkWell(
                      onTap: () {
                        if (productCount > 0) {
                          productCount--;
                        }
                      },
                      child: Container(
                        height: 24.h,
                        width: 24.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.textgrey),
                            shape: BoxShape.circle),
                        child: const Center(
                            child: Icon(
                          CupertinoIcons.minus,
                          color: AppColor.textblack,
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      productCount.toString(),
                      style: TextStyle(
                        color: AppColor.textblack,
                        fontSize: 16.sp,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w700,
                        height: 0.07,
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                      onTap: () {
                        productCount++;
                      },
                      child: Container(
                        height: 24.h,
                        width: 24.w,
                        decoration: BoxDecoration(
                            border: Border.all(color: AppColor.textgrey),
                            shape: BoxShape.circle),
                        child: const Center(
                            child: Icon(
                          CupertinoIcons.plus,
                          color: AppColor.textblack,
                        )),
                      ),
                    ),
                    SizedBox(
                      width: 10.w,
                    )
                  ],
                );
              })),
            )
          ],
        ),
      ),
    );
  }
}
