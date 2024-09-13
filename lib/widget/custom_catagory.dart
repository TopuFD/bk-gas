import 'package:bk_gas/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// ignore: must_be_immutable
class CustomCatagory extends StatelessWidget {
  CustomCatagory({
    super.key,
    required this.title,
    required this.index,
    required this.currentIndex,
  });
  String title;
  int index;
  int currentIndex;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: currentIndex == index
              ? AppColor.primaryColor
              : AppColor.textwhite,
          border: Border.all(color: AppColor.primaryColor),
          borderRadius: BorderRadius.circular(15.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 14.w,
        ),
        child: Center(
            child: index != 0
                ? Center(
                    child: Text(
                      title,
                      style: TextStyle(
                        color: currentIndex == index
                            ? AppColor.textwhite
                            : AppColor.textblack,
                        fontSize: 12.sp,
                        fontFamily: 'Poppins',
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  )
                : Row(
                    children: [
                      Icon(
                        Icons.window_outlined,
                        color: currentIndex == index
                            ? AppColor.textwhite
                            : AppColor.primaryColor,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text(
                        title,
                        style: TextStyle(
                          color: currentIndex == index
                              ? AppColor.textwhite
                              : AppColor.textblack,
                          fontSize: 12.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  )),
      ),
    );
  }
}
