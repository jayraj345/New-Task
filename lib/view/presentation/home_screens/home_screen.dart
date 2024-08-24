// ignore_for_file: must_be_immutable, sort_child_properties_last

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jayraj_task/helper/color_helper.dart';
import 'package:jayraj_task/helper/custom_text.dart';
import 'package:jayraj_task/helper/fontfamily.dart';
import 'package:jayraj_task/helper/route_helpar.dart';
import 'package:jayraj_task/helper/textfield_widget.dart';
import 'package:jayraj_task/view/presentation/home_screens/add_product.dart';
import 'package:jayraj_task/view/presentation/home_screens/controller/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});

  HomeController controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    controller.searchController.clear();
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      bottomNavigationBar: InkWell(
        onTap: () {
          controller.searchController.clear();
          Get.toNamed(Routes.addProduct);
        },
        child: Container(
          height: 45.sp,
          width: Get.size.width,
          alignment: Alignment.center,
          margin: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 8),
          child: const Text(
            "Add Product",
            style: TextStyle(
              color: Colors.white,
              fontFamily: FontFamily.poppinsMedium,
            ),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.sp),
            color: const Color(0xFF023470),
          ),
        ),
      ),
      body: Obx(() {
        return controller.isLoading.value
            ? Stack(
                children: [
                  Positioned(
                    right: 0,
                    child: Image.asset(
                      "assets/images/unnamed.png",
                      height: 200,
                      width: 200,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    height: Get.height,
                    width: double.infinity,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: Get.height * 0.05),
                        Icon(
                          Icons.arrow_back_ios,
                          color: blackColor,
                        ),
                        SizedBox(height: Get.height * 0.02),
                        CommonTextWidget(
                          title: "Vegetables",
                          fontFamily: FontFamily.poppinsMedium,
                          fontSize: 22,
                          textColor: textColor,
                        ),
                        SizedBox(height: Get.height * 0.03),
                        Container(
                          height: 45,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            border: Border.all(color: Colors.grey.shade300),
                            color: whiteColor,
                          ),
                          child: TextFormField(
                            controller: controller.searchController,
                            cursorColor: blackColor,
                            onChanged: (value) {
                              controller.productList.refresh();
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Image.asset(
                                  "assets/images/search.png",
                                  height: 20,
                                  width: 20,
                                  color: blackColor,
                                ),
                              ),
                              hintText: "Search",
                              hintStyle: TextStyle(
                                fontFamily: FontFamily.poppinsMedium,
                                fontSize: 16,
                                color: greyColor,
                              ),
                            ),
                          ),
                        ),
                        10.h.heightBox,
                        Expanded(
                          child: controller.productList.isNotEmpty
                              ? ListView.builder(
                                  itemCount: controller.productList.length,
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return Visibility(
                                      visible: (controller
                                              .productList[index].name
                                              ?.toLowerCase()
                                              .contains(controller
                                                  .searchController.text) ??
                                          false),
                                      child: InkWell(
                                        onTap: () {
                                          Get.toNamed(Routes.detailsProduct);
                                        },
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              child: Image.asset(
                                                index.isOdd
                                                    ? "assets/images/img1.png"
                                                    : "assets/images/img2.png",
                                                height: 110,
                                                width: 160,
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                            SizedBox(width: Get.width * 0.03),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    CommonTextWidget(
                                                      title: controller
                                                              .productList[
                                                                  index]
                                                              .name ??
                                                          "",
                                                      textColor: textColor,
                                                      fontSize: 17,
                                                      fontFamily: FontFamily
                                                          .poppinsMedium,
                                                      textOverflow:
                                                          TextOverflow.ellipsis,
                                                    ),
                                                    20.w.widthBox,
                                                    InkWell(
                                                      onTap: () {
                                                        Get.to(AddProduct(
                                                          index: index,
                                                        ));
                                                      },
                                                      child: SizedBox(
                                                        height: 20.sp,
                                                        width: 20.sp,
                                                        child: Icon(
                                                          Icons.edit,
                                                          size: 22.sp,
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: Get.height * 0.012),
                                                Row(
                                                  children: [
                                                    CommonTextWidget(
                                                      title: controller
                                                          .productList[index]
                                                          .price,
                                                      textColor: textColor,
                                                      fontSize: 17,
                                                      fontFamily: FontFamily
                                                          .poppinsMedium,
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            Get.width * 0.015),
                                                    CommonTextWidget(
                                                      title: "₹ /",
                                                      textColor: greyColor,
                                                      fontSize: 17,
                                                      fontFamily: FontFamily
                                                          .poppinsMedium,
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            Get.width * 0.02),
                                                    CommonTextWidget(
                                                      title: "Piece",
                                                      textColor: greyColor,
                                                      fontSize: 16,
                                                      fontFamily: FontFamily
                                                          .poppinsMedium,
                                                    ),
                                                  ],
                                                ),
                                                SizedBox(
                                                    height: Get.height * 0.015),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                      onTap: () {
                                                        controller.deleteProduct(
                                                            controller
                                                                    .productList[
                                                                        index]
                                                                    .id ??
                                                                "",
                                                            index);
                                                      },
                                                      child: Container(
                                                        height: 40,
                                                        width: 70,
                                                        alignment:
                                                            Alignment.center,
                                                        decoration:
                                                            BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6),
                                                          border: Border.all(
                                                              color: Colors.grey
                                                                  .shade300),
                                                          color: whiteColor,
                                                        ),
                                                        child: Image.asset(
                                                            "assets/images/delete.png",
                                                            height: 20,
                                                            width: 20),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                        width:
                                                            Get.width * 0.02),
                                                    Container(
                                                      height: 40,
                                                      width: 70,
                                                      alignment:
                                                          Alignment.center,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(6),
                                                        color: const Color(
                                                            0xff38cb82),
                                                      ),
                                                      child: Image.asset(
                                                        "assets/images/cart.png",
                                                        height: 20,
                                                        width: 20,
                                                        color: whiteColor,
                                                      ),
                                                    )
                                                  ],
                                                )
                                              ],
                                            )
                                          ],
                                        ).pOnly(bottom: 20.sp),
                                      ),
                                    );
                                  },
                                )
                              : const Center(
                                  child: Text(
                                    "Product List is Empty!",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: FontFamily.poppinsRegular,
                                    ),
                                  ),
                                ),
                        )
                      ],
                    ),
                  ),
                ],
              )
            : Center(
                child: loadingWidget(),
              );
      }),
    );
  }
}
