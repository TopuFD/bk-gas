import 'package:bk_gas/controller/cart_controleler.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});

  CartControleler cartControleler = Get.put(CartControleler());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Check Out",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: ListView.builder(
          itemCount: cartControleler.checkOutItem.length,
          itemBuilder: (context, index) {
          return cartControleler.checkOutItem[index];
        }),
      ),
    );
  }
}
