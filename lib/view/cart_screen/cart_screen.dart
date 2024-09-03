import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/doc_text.dart';
import 'package:bk_gas/widget/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Cart",
      ),
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(AppImage.cartImage),
            SizedBox(height: 20.h,),
            const HeadingText(headingText: "Add items to start a basket"),
            SizedBox(height: 10.h,),
            const DocumentText(documentText: "Once you add items from a store, your basket will appear here."),
            SizedBox(height: 10.h,),
            SizedBox(width: Get.width / 2,child: CustomBodyBtn(title: "Start Shopping", ontap: (){}),),
          ],
        ),
      ),
    );
  }
}
