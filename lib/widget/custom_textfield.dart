import 'package:bk_gas/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomTextFormField extends StatelessWidget {
  final String? hintText;
  final TextEditingController controller;
  final FormFieldValidator<String>? validator;
  final TextInputType keyboardType;
  final bool obscureText;
  final Icon? prefixIcon;
  final IconButton? suffixIcon;
  final String? textFieldHeading;
  final int? maxLine;

  const CustomTextFormField({
    super.key,
    this.hintText,
    required this.controller,
    this.validator,
    this.keyboardType = TextInputType.text,
    this.obscureText = false,
    this.prefixIcon,
    this.suffixIcon,
    this.textFieldHeading,
    this.maxLine
  });

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      textFieldHeading == null
          ? Container()
          : Align(
              alignment: Alignment.topLeft,
              child: Text(
                textFieldHeading!,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: AppColor.textPrimary,
                  fontSize: 22.sp,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w600,
                  height: 0,
                ),
              ),
            ),
      TextFormField(
        controller: controller,
        validator: validator,
        keyboardType: keyboardType,
        maxLines: obscureText ? 1 : maxLine??1,
        obscureText: obscureText,
        decoration: InputDecoration(
            filled: true,
            fillColor: AppColor.secondaryColor,
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColor.primaryColor)),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColor.primaryColor)),
            disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColor.primaryColor)),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColor.primaryColor)),
            contentPadding: EdgeInsets.only(
                left: Get.height * .02,
                top: Get.height * .022,
                bottom: Get.height * .022),
            hintText: hintText,
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
            prefixIconColor: AppColor.primaryColor,
            suffixIconColor: AppColor.primaryColor),
      ),
    ]);
  }
}

