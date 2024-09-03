import 'package:bk_gas/widget/custom_appber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ReadMore extends StatelessWidget {
  const ReadMore({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Read More",
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 15.w,right: 15.w,top: 20.h),
        child: Text(
          "${Get.arguments["readMore"]} Lorem ipsum dolor sit amet consectetur. Enim sagittis mattis sed risus nunc. Non ac vel viverra ut facilisis ultricies leo. Vel nunc eget tellus duis mollis sollicitudin. Eget aliquam leo sed arcu. Dignissim enim dolor rhoncus nam nisi ullamcorper sed suscipit pellentesque. Volutpat magna imperdiet cum adipiscing quam curabitur consectetur. At tortor consectetur ut ut scelerisque nec elementum tellus. Consectetur quis amet duis quisque suspendisse. Pellentesque scelerisque venenatis blandit velit ac eu.",
          style: const TextStyle(
            color: Color(0xFF333333),
            fontSize: 14,
            fontFamily: 'Open Sans',
            fontWeight: FontWeight.w400,
            height: 0,
          ),
          textAlign: TextAlign.justify,
        ),
      ),
    );
  }
}
