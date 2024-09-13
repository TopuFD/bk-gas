import 'package:bk_gas/controller/cart_controleler.dart';
import 'package:bk_gas/core/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/widget/check_out_card.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/doc_text.dart';
import 'package:bk_gas/widget/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CartScreen extends StatelessWidget {
  CartScreen({super.key});
  CartControleler cartControleler = Get.put(CartControleler());
  RxInt currentIndex = 0.obs;
  RxInt itemCount = 0.obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: AppColor.textwhite,
        automaticallyImplyLeading: false,
        title: Text(
          cartControleler.checkList.isEmpty ? 'Cart' : "Check Out",
          textAlign: TextAlign.center,
          style: TextStyle(
            color: AppColor.textblack,
            fontSize: 18.sp,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
      body: cartControleler.checkList.isNotEmpty
          ? Obx(() {
              return InkWell(
                onTap: () {
                  Get.toNamed(AppRoute.checkoutScreen, arguments: {
                    'currentIndex': currentIndex.value,
                    "itemCount": itemCount
                  });
                },
                // ================================================cart data here>
                child: ListView.builder(
                    itemCount: cartControleler.checkList.length,
                    itemBuilder: (context, index) {
                      currentIndex.value = index;

                      var data = cartControleler.checkList[index];
                      cartControleler.checkList[currentIndex.value][4] =
                          data[4];
                      cartControleler.checkList.refresh;
                      return CheckOutCard(
                          imagePath: data[0],
                          title: data[1],
                          price: data[2].toString(),
                          weight: data[3].toString(),
                          productCount: data[4]);
                    }),
              );
            })
          : Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(AppImage.cartImage),
                  SizedBox(
                    height: 20.h,
                  ),
                  const HeadingText(headingText: "Add items to start a basket"),
                  SizedBox(
                    height: 10.h,
                  ),
                  const DocumentText(
                      documentText:
                          "Once you add items from a store, your basket will appear here."),
                  SizedBox(
                    height: 10.h,
                  ),
                  SizedBox(
                    width: Get.width / 2,
                    child: CustomBodyBtn(title: "Start Shopping", ontap: () {}),
                  ),
                ],
              ),
            ),
    );
  }
}
