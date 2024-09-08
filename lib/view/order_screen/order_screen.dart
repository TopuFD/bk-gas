import 'package:bk_gas/controller/cart_controleler.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/utils/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class OrderScreen extends StatelessWidget {
  OrderScreen({super.key});

  CartControleler cartControleler = Get.put(CartControleler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          surfaceTintColor: AppColor.textwhite,
          backgroundColor: AppColor.textwhite,
          shadowColor: AppColor.textwhite,
          title: Text('Order', style: CustomTextStyle.h2()),
        ),
        body: cartControleler.checkList.isNotEmpty
            ? Obx(() {
                return Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 15.w),
                  child: ListView.builder(
                      itemCount: cartControleler.orderList.length,
                      itemBuilder: (context, index) {
                        var data = cartControleler.orderList[index];
                        cartControleler.checkList.refresh;
                        return customItem(
                            imagePath: data[0],
                            orderId: data[3],
                            productCount: data[2],
                            price: data[1]);
                      }),
                );
              })
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image.asset(AppImage.orderImage),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text(
                      'You have no order item',
                      style: CustomTextStyle.h3(),
                    )
                  ],
                )));
  }

  //===================================================custom item
  customItem({
    imagePath,
    orderId,
    productCount,
    price,
  }) {
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(orderId,
                        style: CustomTextStyle.h2(
                            fontSize: 16.sp, fontWeight: FontWeight.bold)),
                    Row(
                      children: [
                        Text("${productCount.toString()} item",
                            style: CustomTextStyle.h3(fontSize: 14.sp)),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 5.w),
                          child: Container(
                            height: 12.h,
                            width: 12.w,
                            decoration: const BoxDecoration(
                                color: AppColor.textgrey,
                                shape: BoxShape.circle),
                          ),
                        ),
                        Text("US\$$price", style: CustomTextStyle.h3()),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding:  EdgeInsets.only(right: 10.w),
              child: Icon(
                Icons.arrow_forward_ios,
                color: AppColor.textgrey,
                size: 20.h,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
