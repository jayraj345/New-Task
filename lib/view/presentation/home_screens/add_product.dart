// ignore_for_file: sort_child_properties_last, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jayraj_task/helper/fontfamily.dart';
import 'package:jayraj_task/helper/textfield_widget.dart';
import 'package:jayraj_task/view/presentation/home_screens/controller/home_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class AddProduct extends StatefulWidget {
  int? index;
  AddProduct({super.key, this.index});

  @override
  State<AddProduct> createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {
  HomeController controller = Get.find();

  @override
  void initState() {
    super.initState();
    if (widget.index != null) {
      controller.name.text =
          controller.productList[widget.index ?? 0].name ?? "";
      controller.moq.text = controller.productList[widget.index ?? 0].moq ?? "";
      controller.price.text =
          controller.productList[widget.index ?? 0].price ?? "";
      controller.discountedPrice.text =
          controller.productList[widget.index ?? 0].discountedPrice ?? "";
    } else {
      controller.clearData();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () {
            Get.back();
          },
        ),
        title: const Text(
          'Add Product',
          style: TextStyle(
            color: Colors.black,
            fontFamily: FontFamily.poppinsMedium,
          ),
        ),
      ),
      body: Column(
        children: [
          TextFieldWidget(
            controller: controller.name,
            hintText: "Name",
          ),
          TextFieldWidget(
            controller: controller.moq,
            hintText: "Moq",
          ),
          TextFieldWidget(
            controller: controller.price,
            hintText: "Price",
          ),
          TextFieldWidget(
            controller: controller.discountedPrice,
            hintText: "Discounted Price",
          ),
          50.h.heightBox,
          InkWell(
            onTap: () {
              if (widget.index != null) {
                controller.updateProduct(widget.index ?? 0);
              } else {
                controller.addProduct();
              }
            },
            child: Container(
              height: 45.sp,
              width: Get.size.width,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 8),
              child: controller.isLoading.value
                  ? Text(
                      widget.index != null ? "Update" : "Add Product",
                      style: TextStyle(
                        color: Colors.white,
                        fontFamily: FontFamily.poppinsMedium,
                      ),
                    )
                  : loadingWhiteWidget(),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8.sp),
                color: const Color(0xFF023470),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
