import 'package:bk_gas/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DocumentText extends StatelessWidget {
  final String documentText;
  const DocumentText({super.key, required this.documentText});

  @override
  Widget build(BuildContext context) {
    return Text(
      documentText,
      textAlign: TextAlign.center,
      style:  TextStyle(
        color: AppColor.textgrey,
        fontSize: 16.sp,
        fontFamily: 'Poppins',
        fontWeight: FontWeight.w400,
        height: 0,
      ),
    );
  }
}
