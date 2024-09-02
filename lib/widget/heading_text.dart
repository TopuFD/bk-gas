
import 'package:bk_gas/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HeadingText extends StatelessWidget {
  final String headingText;
  const HeadingText({super.key, required this.headingText});

  @override
  Widget build(BuildContext context) {
    return Text(
      headingText,
      textAlign: TextAlign.center,
      style: TextStyle(
        color: AppColor.textblack,
        fontSize: 20.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w600,
        height: 0,
      ),
    );
  }
}
