import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NotificationScreen extends StatelessWidget {
  const NotificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const CustomAppbar(title: "Notification"),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: ListView.builder(
              itemCount: 20,
              itemBuilder: (context, index) {
                return notificationItem(
                    "You new product suggestion", "1 hour ago");
              }),
        ));
  }

  notificationItem(String title, String subtitle) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 80.w,
            child: Row(
              children: [
                Icon(
                  Icons.circle,
                  color: AppColor.primaryColor,
                  size: 10.h,
                ),
                SizedBox(
                  width: 5.w,
                ),
                const CircleAvatar(
                    backgroundColor: Color(0xFFE8EBF0),
                    child: Icon(
                      Icons.notifications,
                      color: AppColor.primaryColor,
                    ))
              ],
            ),
          ),
          SizedBox(
            width: 250.w,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Your account has created successfully.',
                  style: TextStyle(
                    color: AppColor.textgrey,
                    fontSize: 15.sp,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
                Text(
                  subtitle,
                  style: TextStyle(
                    color: const Color(0xFFA1A1A1),
                    fontSize: 10.sp,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
