import 'package:bk_gas/controller/cart_controleler.dart';
import 'package:bk_gas/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/widget/check_out_card.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/heading_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class ProductDetailsScreen extends StatelessWidget {
  ProductDetailsScreen({super.key});
  CartControleler cartControleler = Get.put(CartControleler());
  RxInt productCount = 1.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: SizedBox(
          width: Get.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Get.arguments["imagePath"] != null
                  ? Image.asset(Get.arguments["imagePath"])
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
              RichText(
                text: TextSpan(children: [
                  TextSpan(
                    text: Get.arguments["subtitle"],
                    style: TextStyle(
                      color: AppColor.textgrey,
                      fontSize: 14.sp,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  TextSpan(
                      text: "Read More...",
                      style: TextStyle(
                        color: AppColor.textblack,
                        fontSize: 14.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w600,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Get.toNamed(AppRoute.readMoreScreen, arguments: {
                            "readMore": Get.arguments["subtitle"],
                          });
                        })
                ]),
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
              const Expanded(child: SizedBox()),
              CustomBodyBtn(
                  icon: const Icon(
                    Icons.shopping_cart,
                    color: AppColor.textwhite,
                  ),
                  title: "Add To Cart | \$${Get.arguments["price"]}",
                  ontap: () {
                    cartControleler.checkOutItem.add(CheckOutCard(
                      imagePath: Get.arguments["imagePath"],
                      title: Get.arguments["title"],
                      price: Get.arguments["price"],
                      weight: Get.arguments["weight"],
                      productCount: productCount,
                    ));
                    debugPrint("cart added");
                  }),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
