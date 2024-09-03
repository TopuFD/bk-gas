import 'package:bk_gas/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CheckOutCard extends StatelessWidget {
  CheckOutCard(
      {super.key,
      required this.imagePath,
      required this.title,
      required this.prich,
      required this.weight,
      required,
      required this.productCount});
  String imagePath;
  String title;
  String prich;
  String weight;
  String productCount;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 83.h,
      width: Get.width,
      decoration: BoxDecoration(
        color: AppColor.secondaryColor,
        borderRadius: BorderRadius.circular(15.r)
      ),
    );
  }
}
