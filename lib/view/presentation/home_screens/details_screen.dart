// ignore_for_file: prefer_const_constructors

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jayraj_task/helper/color_helper.dart';
import 'package:jayraj_task/helper/custom_text.dart';
import 'package:jayraj_task/helper/fontfamily.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({super.key});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int _currentPage = 0;
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Container(
        color: whiteColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 50,
              width: 70,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(color: Colors.grey.shade300),
                color: whiteColor,
              ),
              child: Image.asset(
                "assets/images/favorite.png",
                height: 20,
                width: 20,
                color: greyColor,
              ),
            ),
            SizedBox(width: Get.width * 0.02),
            Container(
              height: 50,
              width: Get.width * 0.68,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                color: const Color(0xff38cb82),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/cart.png",
                    height: 20,
                    width: 20,
                    color: whiteColor,
                  ),
                  SizedBox(width: Get.width * 0.02),
                  CommonTextWidget(
                    title: "Add to cart".toUpperCase(),
                    textColor: whiteColor,
                    fontSize: 14,
                    fontFamily: FontFamily.poppinsMedium,
                    // height: 0,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: Stack(
        children: [
          SizedBox(
            height: Get.size.height,
            width: Get.size.width,
          ),
          Stack(
            children: [
              SizedBox(
                height: 300.sp,
                child: PageView(
                  controller: pageController,
                  onPageChanged: handlingOnPageChanged,
                  children: [
                    Image.asset(
                      "assets/images/img1.png",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/images/img1.png",
                      fit: BoxFit.cover,
                    ),
                    Image.asset(
                      "assets/images/img1.png",
                      fit: BoxFit.cover,
                    ),
                  ],
                ),
              ),
              Positioned(
                bottom: 55,
                right: 0,
                left: 0,
                child: buildPageIndicator(),
              ),
            ],
          ),
          Positioned(
            bottom: 0,
            child: Container(
              height: Get.height * 0.65,
              width: Get.width,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
                color: whiteColor,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CommonTextWidget(
                    title: "Boston Lettuce",
                    textColor: textColor,
                    fontSize: 22,
                    fontFamily: FontFamily.poppinsMedium,
                    // height: 0,
                  ),
                  SizedBox(height: Get.height * 0.01),
                  Row(
                    children: [
                      CommonTextWidget(
                        title: "1.70",
                        textColor: textColor,
                        fontSize: 22,
                        fontFamily: FontFamily.poppinsMedium,
                      ),
                      SizedBox(width: Get.width * 0.018),
                      CommonTextWidget(
                        title: "₹ /",
                        textColor: greyColor,
                        fontSize: 22,
                        fontFamily: FontFamily.poppinsMedium,
                        // height: 0,
                      ),
                      SizedBox(width: Get.width * 0.02),
                      CommonTextWidget(
                        title: "Piece",
                        textColor: greyColor,
                        fontSize: 18,
                        fontFamily: FontFamily.poppinsMedium,
                        // height: 0,
                      ),
                    ],
                  ),
                  SizedBox(height: Get.height * 0.015),
                  CommonTextWidget(
                    title: "~ 150 gr / Piece",
                    textColor: const Color(0xff38cb82),
                    fontSize: 16,
                    fontFamily: FontFamily.poppinsMedium,
                    // height: 0,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  CommonTextWidget(
                    title: "Spain",
                    textColor: textColor,
                    fontSize: 20,
                    fontFamily: FontFamily.poppinsMedium,
                    // height: 0,
                  ),
                  SizedBox(height: Get.height * 0.02),
                  Text(
                    "Lettuce is an annual plant of the daisy family, Asteraceae. It is most often grown as a leaf vegetable, but sometimes for its stem and seeds. Lettuce is most often used for salads, although it is also seen in other kinds of food, such as soups, sandwiches and wraps; it can also be grilled.",
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: FontFamily.poppinsMedium,
                    ),
                  ),
                  SizedBox(height: Get.height * 0.1),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  void handlingOnPageChanged(int page) {
    setState(() {
      _currentPage = page;
    });
  }

  // building page indicator
  Widget buildPageIndicator() {
    Row row = Row(mainAxisAlignment: MainAxisAlignment.center, children: []);
    for (int i = 0; i < 3; i++) {
      row.children.add(buildPageIndicatorItem(i));
      if (i != 3 - 1)
        // ignore: curly_braces_in_flow_control_structures
        row.children.add(const SizedBox(
          width: 6,
        ));
    }
    return row;
  }

  Widget buildPageIndicatorItem(int index) {
    return index == _currentPage
        ? Container(
            width: 10,
            height: 10,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == _currentPage ? whiteColor : Colors.grey,
            ),
          )
        : Container(
            width: 8,
            height: 8,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: index == _currentPage ? whiteColor : greyColor,
            ),
          );
  }
}
