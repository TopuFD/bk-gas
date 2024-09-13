import 'package:bk_gas/controller/cart_controleler.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/utils/text_style.dart';
import 'package:bk_gas/widget/check_out_card.dart';
import 'package:bk_gas/widget/custom_appber.dart';
import 'package:bk_gas/widget/custom_body_btn.dart';
import 'package:bk_gas/widget/custom_textfield.dart';
import 'package:bk_gas/widget/doc_text.dart';
import 'package:bk_gas/widget/heading_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class CheckoutScreen extends StatelessWidget {
  CheckoutScreen({super.key});
  CartControleler cartControleler = Get.put(CartControleler());
  TextEditingController cuponCode = TextEditingController();
  TextEditingController visaCode = TextEditingController();
  RxInt productCount = 1.obs;
  int currentIndex = Get.arguments["currentIndex"];
  RxInt itemCount = Get.arguments["itemCount"];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppbar(
        title: "Check Out",
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: Get.width,
              height: Get.height / 7,
              child: CheckOutCard(
                  imagePath: cartControleler.checkList[currentIndex][0],
                  title: cartControleler.checkList[currentIndex][1],
                  price: cartControleler.checkList[currentIndex][2].toString(),
                  weight: cartControleler.checkList[currentIndex][3].toString(),
                  productCount: cartControleler.checkList[currentIndex][4]),
            ),
            SizedBox(
              height: 5.h,
            ),
            //==================================================>apply coupon code here
            SizedBox(
              width: Get.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  //======================================================>apply coupon code
                  SizedBox(
                      width: Get.width / 1.5,
                      child: CustomTextFormField(
                          hintText: "Apply coupon code",
                          controller: cuponCode)),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50.h,
                      width: 74.w,
                      decoration: BoxDecoration(
                          color: AppColor.primaryColor,
                          borderRadius: BorderRadius.circular(15.r)),
                      child: Center(
                        child: Text(
                          'Apply',
                          style: TextStyle(
                            color: AppColor.textwhite,
                            fontSize: 16.sp,
                            fontFamily: 'Open Sans',
                            fontWeight: FontWeight.w600,
                            height: 0,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            //=======================================here shipping information
            SizedBox(
              height: 30.h,
            ),
            const HeadingText(headingText: "Shipping Information"),
            SizedBox(
              height: 10.h,
            ),
            Container(
              height: Get.height / 9,
              width: Get.width,
              decoration: BoxDecoration(
                color: AppColor.secondaryColor,
                borderRadius: BorderRadius.circular(15.r),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Row(
                    children: [
                      SizedBox(
                          height: 50.h,
                          width: 45.w,
                          child: Image.asset(
                            AppImage.visaImage,
                            height: 50.h,
                            width: 45.w,
                            fit: BoxFit.contain,
                          )),
                      SizedBox(
                        width: 8.w,
                      ),
                      SizedBox(
                        width: Get.width / 1.8,
                        child: TextFormField(
                          controller: visaCode,
                          decoration: const InputDecoration(
                              hintText: "Write your visa id",
                              border: InputBorder.none),
                        ),
                      )
                    ],
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.textblack,
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            // ========================================product information here
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const DocumentText(documentText: "Order Id"),
                    HeadingText(
                        headingText:
                            "${cartControleler.checkList[currentIndex][5]}")
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const DocumentText(documentText: "Total(9 items)"),
                    HeadingText(
                      headingText:
                          "\$${int.tryParse(cartControleler.checkList[currentIndex][2].toString())! * cartControleler.checkList[currentIndex][4].value}"
                              .toString(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    DocumentText(documentText: "Discount"),
                    HeadingText(headingText: "\$00.0")
                  ],
                ),
                SizedBox(
                  height: 60.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const DocumentText(documentText: "Sub Total"),
                    HeadingText(
                      headingText:
                          "\$${int.tryParse(cartControleler.checkList[currentIndex][2].toString())! * cartControleler.checkList[currentIndex][4].value}"
                              .toString(),
                    )
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                //======================================================bottom button here
                CustomBodyBtn(
                    title: "Pay",
                    ontap: () {
                      cartControleler.orderList.add([
                        
                        cartControleler.checkList[currentIndex][0],
                        cartControleler.checkList[currentIndex][2],
                        cartControleler.checkList[currentIndex][4],
                        cartControleler.checkList[currentIndex][5],
                      ]

                      );
                      customDialog();
                    })
              ],
            )
          ],
        ),
      ),
    );
  }

  //==========================================dialog here
  customDialog() {
    Get.defaultDialog(
        title: "dialog",
        content: Column(
          children: [
            SizedBox(
                height: 200.h,
                width: 200.w,
                child: Image.asset(
                  AppImage.dialogImage,
                  height: 200.h,
                )),
            Text(
              'Congratulations!',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: AppColor.primaryColor,
                fontSize: 24.sp,
                fontFamily: 'Open Sans',
                fontWeight: FontWeight.w600,
                height: 0,
              ),
            ),
            SizedBox(height: 10.h,),
            Text(
              'Payment successfully. ',
              textAlign: TextAlign.center,
              style: CustomTextStyle.h3(fontSize: 16.sp)
            ),
            SizedBox(height: 10.h,),
            Container(
              width: 225.w,
              height: 50.h,
              decoration: BoxDecoration(
                border: Border.all(color: AppColor.textblack),
                borderRadius: BorderRadius.circular(10.r)
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(AppImage.koinImage),
                  Text(
                    '+10.5 loyalty point received',
                    style: CustomTextStyle.h3(fontSize: 12.sp)
                  )
                ],
              ),
            ),
            SizedBox(height: 30.h,),
            CustomBodyBtn(title: "Go to Home", ontap: (){})
          ],
        ));
  }
}
