import 'package:bk_gas/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomBodyBtn extends StatelessWidget {
   CustomBodyBtn({super.key, required this.title, required this.ontap});

  final String title;
  Function? ontap;
  @override
  Widget build(BuildContext context) {
    return Container(
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
        child: Text(
          'GET STARTED',
          style: TextStyle(
            color: Colors.white,
            fontSize: 18,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w600,
            height: 0,
          ),
        ),
      ),
    );
  }
}
