import 'package:bk_gas/route/app_route.dart';
import 'package:bk_gas/utils/color.dart';
import 'package:bk_gas/utils/image.dart';
import 'package:bk_gas/widget/custom_card.dart';
import 'package:bk_gas/widget/custom_catagory.dart';
import 'package:bk_gas/widget/custom_textfield.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List catagory = [
    "All Item",
    "6 kg",
    "12 kg",
    "36 kg",
  ];

  TextEditingController searchController = TextEditingController();

  int currentIndex = 0;
  // RxInt currentIndex = 0.obs;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: PreferredSize(
            preferredSize: const Size.fromHeight(80),
            child: AppBar(
              scrolledUnderElevation: 0,
              shadowColor: AppColor.textwhite,
              surfaceTintColor: AppColor.textwhite,
              automaticallyImplyLeading: false,
              backgroundColor: AppColor.textwhite,
              flexibleSpace: customAppber(),
            )),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w),
          child: Column(
            children: [
              SizedBox(
                width: Get.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //search bar here======================================================>
                    SizedBox(
                        width: Get.width / 1.5,
                        child: CustomTextFormField(
                            hintText: "Search", controller: searchController)),
                    InkWell(
                      onTap: () {
                        Get.toNamed(AppRoute.searchScreen, arguments: {
                          "searchText": searchController,
                        });
                      },
                      child: Container(
                        height: 50.h,
                        width: 74.w,
                        decoration: BoxDecoration(
                            color: AppColor.primaryColor,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: Center(
                          child: Text(
                            'Search',
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
              //catagory start here===============================================>

              SizedBox(
                height: 20.h,
              ),
              SizedBox(
                height: 40.h,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: catagory.length,
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            currentIndex = index;
                          });

                          debugPrint(index.toString());
                        },
                        child: CustomCatagory(
                          title: catagory[index],
                          index: index,
                          // ignore: unrelated_type_equality_checks
                          currentIndex: currentIndex,
                        ),
                      );
                    }),
              ),
              // Obx(() {
              //   return SizedBox(
              //     height: 50.h,
              //     child: ListView.builder(
              //         scrollDirection: Axis.horizontal,
              //         itemCount: catagory.length,
              //         itemBuilder: (context, index) {
              //           return GestureDetector(
              //             onTap: () {
              //               currentIndex.value = index;
              //               debugPrint(index.toString());
              //             },
              //             child: CustomCatagory(
              //               title: catagory[index],
              //               index: index,
              //               // ignore: unrelated_type_equality_checks
              //               color: currentIndex.value == index?AppColor.primaryColor:AppColor.textwhite,
              //             ),
              //           );
              //         }),
              //   );
              // })

              // product list here=========================================>
              SizedBox(
                height: 20.h,
              ),

              Expanded(
                child: GridView.builder(
                    itemCount: 10,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            crossAxisCount: 2,
                            childAspectRatio: 0.62),
                    itemBuilder: (context, index) {
                      return CustomCard(
                        imagePath: AppImage.productImage,
                        title: 'My Dream',
                        price: '212.99',
                        weight: '6',
                      );
                    }),
              ),
              SizedBox(
                height: 10.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  //custom home appbar========================================>
  customAppber() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 15.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          //leading part here ===========================>
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    CupertinoIcons.location_solid,
                    color: AppColor.primaryColor,
                    size: 20.h,
                  ),
                  Row(
                    children: [
                      Text(
                        "Dhaka",
                        style: TextStyle(
                          color: AppColor.textblack,
                          fontSize: 14.sp,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                          height: 0,
                        ),
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: AppColor.textblack,
                      )
                    ],
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 5.w),
                child: Text(
                  'Dhaka - 1216,  Bangladesh',
                  style: TextStyle(
                    color: AppColor.textgrey,
                    fontSize: 12.sp,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                    height: 0,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
          //action value here=====================================================>
          Row(
            children: [
              IconButton(
                  onPressed: () {
                    Get.toNamed(AppRoute.notificationScreen);
                  },
                  icon: Stack(
                    children: [
                      Icon(
                        Icons.notifications,
                        color: AppColor.primaryColor,
                        size: 24.h,
                      ),
                      Positioned(
                          top: 0,
                          right: 3.w,
                          child: Container(
                            decoration: const BoxDecoration(
                                color: AppColor.colorRed,
                                shape: BoxShape.circle),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 2.w, vertical: 5.h),
                                child: Text(
                                  '12',
                                  style: TextStyle(
                                    color: AppColor.textwhite,
                                    fontSize: 6.sp,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w500,
                                    height: 0.17,
                                  ),
                                ),
                              ),
                            ),
                          ))
                    ],
                  )),
              Container(
                height: 50.h,
                width: 50.w,
                decoration: const BoxDecoration(shape: BoxShape.circle),
                child: Image.asset(AppImage.accountImage),
              )
            ],
          ),
        ],
      ),
    );
  }
}
