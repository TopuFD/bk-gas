import 'package:bk_gas/controller/auth_controller.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/doc_text.dart';
import 'package:bk_gas/widget/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpCodeScreen extends StatefulWidget {
  const OtpCodeScreen({
    super.key,
  });
  @override
  State<OtpCodeScreen> createState() => _OtpCodeScreenState();
}

class _OtpCodeScreenState extends State<OtpCodeScreen> {
  AutheController autheController = Get.find<AutheController>();
  TextEditingController enteredOtp = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: const CustomAppbar(title: "Verify Email"),
        body: GradientContainer(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: Get.width * .05),
            child: SizedBox(
              height: Get.height,
              child: Column(
                children: [
                  SizedBox(
                    height: 30.h,
                  ),
                  const DocumentText(
                      documentText:
                          "We have sent a verification code to your number.Please check your number and enter the code."),
                  SizedBox(
                    height: Get.height * .03,
                  ),
                  //======================================= otp pin code field here
                  PinCodeTextField(
                    controller: enteredOtp,
                    appContext: context,
                    length: 6,
                    obscureText: false,
                    animationType: AnimationType.fade,
                    pinTheme: PinTheme(
                      inactiveColor: const Color.fromARGB(66, 73, 73, 73),
                      inactiveFillColor: AppColor.textwhite,
                      shape: PinCodeFieldShape.box,
                      borderRadius: BorderRadius.circular(5),
                      fieldHeight: size.height * .07,
                      fieldWidth: size.width * .13,
                      activeFillColor: AppColor.textwhite,
                    ),
                    animationDuration: const Duration(milliseconds: 300),
                    enableActiveFill: true,
                    beforeTextPaste: (text) {
                      return true;
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Didn’t get the code?',
                        style: TextStyle(
                          color: AppColor.textgrey,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      //====================================resend otp code button here
                      TextButton(
                          onPressed: () {},
                          child: Text(
                            'Resend',
                            textAlign: TextAlign.right,
                            style: TextStyle(
                              color: AppColor.textlightBlue,
                              fontSize: 16.sp,
                              fontFamily: 'Open Sans',
                              fontWeight: FontWeight.w600,
                              height: 0,
                            ),
                          ))
                    ],
                  ),
                  const Expanded(child: SizedBox()),
                  //=========================================================confirm button here
                  CustomBodyBtn(
                      title: "Confirm",
                      ontap: () {
                        autheController.verifyOtp(enteredOtp.text);
                      }),
                  SizedBox(
                    height: Get.height * .04,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
