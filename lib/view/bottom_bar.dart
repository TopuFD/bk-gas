import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/view/account_screen/account_screen.dart';
import 'package:bk_gas/view/cart_screen/cart_screen.dart';
import 'package:bk_gas/view/home_screen/home_screen.dart';
import 'package:bk_gas/view/order_screen/order_screen.dart';
import 'package:bk_gas/widget/gradient_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class BottomBarScreen extends StatelessWidget {
  BottomBarScreen({super.key});

  final RxInt currentIndex = 0.obs;
  final List<Widget> pages = [
    const HomeScreen(),
    CartScreen(),
     OrderScreen(),
    AccountScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientContainer(child: Obx(
        () {
          return pages[currentIndex.value];
        },
      )),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.w),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50.r),
          child: Obx(() {
            return BottomNavigationBar(
              onTap: (index) {
                currentIndex.value = index;
              },
              currentIndex: currentIndex.value,
              selectedItemColor: AppColor.textwhite,
              unselectedItemColor: AppColor.textwhite,
              showSelectedLabels: true,
              showUnselectedLabels: true,
              items: [
                BottomNavigationBarItem(
                  backgroundColor: AppColor.primaryColor,
                  icon: CircleAvatar(
                    // ignore: unrelated_type_equality_checks
                    backgroundColor: currentIndex == 0
                        ? const Color(0xFFC2C2C2)
                        : Colors.transparent,
                    child: const Icon(
                      Icons.home,
                      color: AppColor.textwhite,
                    ),
                  ),
                  label: "Home",
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColor.primaryColor,
                  icon: CircleAvatar(
                    // ignore: unrelated_type_equality_checks
                    backgroundColor: currentIndex == 1
                        ? const Color(0xFFC2C2C2)
                        : Colors.transparent,
                    child: const Icon(
                      Icons.card_travel,
                      color: AppColor.textwhite,
                    ),
                  ),
                  label: "Cart",
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColor.primaryColor,
                  icon: CircleAvatar(
                    // ignore: unrelated_type_equality_checks
                    backgroundColor: currentIndex == 2
                        ? const Color(0xFFC2C2C2)
                        : Colors.transparent,
                    child: const Icon(
                      Icons.shopping_bag,
                      color: AppColor.textwhite,
                    ),
                  ),
                  label: "Order",
                ),
                BottomNavigationBarItem(
                  backgroundColor: AppColor.primaryColor,
                  icon: CircleAvatar(
                    // ignore: unrelated_type_equality_checks
                    backgroundColor: currentIndex == 3
                        ? const Color(0xFFC2C2C2)
                        : Colors.transparent,
                    child: const Icon(
                      Icons.person,
                      color: AppColor.textwhite,
                    ),
                  ),
                  label: "Account",
                ),
              ],
            );
          }),
        ),
      ),
    );
  }
}
