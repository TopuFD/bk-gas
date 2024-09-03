import 'package:bk_gas/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomBodyBtn extends StatelessWidget {
  CustomBodyBtn({super.key, required this.title, required this.ontap, this.icon});

  final String title;
  VoidCallback ontap;
  Icon? icon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        width: 353.w,
        height: 57.h,
        padding: EdgeInsets.symmetric(horizontal: 24.w, vertical: 16.h),
        decoration: ShapeDecoration(
          color: AppColor.primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16.r),
          ),
        ),
        child: Center(
          child: icon == null? Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ): Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            icon!,
            SizedBox(width: 4.w,),
            Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontFamily: 'Open Sans',
              fontWeight: FontWeight.w600,
              height: 0,
            ),
          ),
          ],)
        ),
      ),
    );
  }
}
