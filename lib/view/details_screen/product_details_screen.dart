import 'package:bk_gas/controller/cart_controleler.dart';
import 'package:bk_gas/core/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/heading_text.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  CartControleler cartControleler = Get.put(CartControleler());
  RxInt productCount = 1.obs;
  var argumentData = Get.arguments;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SizedBox(
          width: Get.width,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Get.arguments["imagePath"] != null
                    ? Align(
                      alignment: Alignment.center,
                      child: SizedBox(
                        height: 300.h,
                        width: 300.w,
                        //================================================details image here
                        child: CachedNetworkImage(
                            fit: BoxFit.cover,
                            imageUrl: Get.arguments["imagePath"],
                            placeholder: (context, url) =>
                                const CircularProgressIndicator(),
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                          ),
                      ),
                    )
                    : const CircularProgressIndicator(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    HeadingText(headingText: Get.arguments["title"]),
                    SizedBox(child: Obx(() {
                      return Row(
                        children: [
                          InkWell(
                            onTap: () {
                              if (productCount > 0) {
                                productCount--;
                              }
                            },
                            child: Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.textblack),
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
                          //========================================product counter here
                          InkWell(
                            onTap: () {
                              productCount++;
                            },
                            child: Container(
                              height: 32.h,
                              width: 32.w,
                              decoration: BoxDecoration(
                                  border: Border.all(color: AppColor.textblack),
                                  shape: BoxShape.circle),
                              child: const Center(
                                  child: Icon(
                                CupertinoIcons.plus,
                                color: AppColor.textblack,
                              )),
                            ),
                          ),
                        ],
                      );
                    }))
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                // ===========================================image subtitle here
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      Get.arguments["subtitle"],
                      style: TextStyle(
                        color: AppColor.textgrey,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w400,
                        overflow: TextOverflow.ellipsis,
                      ),
                      maxLines: 3,
                      textAlign: TextAlign.justify,
                    ),
                    //===================================read more button
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.readMoreScreen, arguments: {
                          "readMore": Get.arguments["subtitle"],
                        });
                      },
                      child: Text(
                        "Read More...",
                        style: TextStyle(
                          color: AppColor.textblack,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 20.h,
                ),
                const HeadingText(headingText: "Selected Size"),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 36.h,
                  width: 36.w,
                  decoration: const BoxDecoration(
                      color: AppColor.primaryColor, shape: BoxShape.circle),
                  child: Center(
                    child: Text(
                      "${Get.arguments["weight"]} kg",
                      style: TextStyle(
                        color: AppColor.textwhite,
                        fontSize: 10.sp,
                        fontFamily: 'Encode Sans',
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 30.h,),
                // ============================================================add to card button
                CustomBodyBtn(
                    icon: const Icon(
                      Icons.shopping_cart,
                      color: AppColor.textwhite,
                    ),
                    title: "Add To Cart | \$${Get.arguments["price"]}",
                    ontap: () {
                      cartControleler.checkList.add([
                        argumentData["imagePath"],
                        argumentData["title"],
                        argumentData["price"],
                        argumentData["weight"],
                        productCount,
                        "#GAZ-06-001"
                      ]);
                      Get.back();
                    }),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
