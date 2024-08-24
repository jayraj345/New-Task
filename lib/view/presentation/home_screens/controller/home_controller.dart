// ignore_for_file: prefer_interpolation_to_compose_strings, prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jayraj_task/helper/RestServies/api_helpar.dart';
import 'package:jayraj_task/helper/RestServies/rest_servies.dart';
import 'package:jayraj_task/main.dart';
import 'package:jayraj_task/view/presentation/home_screens/model/product_info.dart';

class HomeController extends GetxController implements GetxService {
  RxBool isLoading = true.obs;
  RxList<ProductInfo> productList = <ProductInfo>[].obs;

  TextEditingController name = TextEditingController();
  TextEditingController moq = TextEditingController();
  TextEditingController price = TextEditingController();
  TextEditingController discountedPrice = TextEditingController();
  TextEditingController searchController = TextEditingController();

  getProductData() async {
    try {
      isLoading.value = false;
      var response = await RestServices.fromData(ApiHelpar.productList, body: {
        "user_login_token": prefer?.getString("token") ?? "",
      });
      if (response.statusCode == 200) {
        var result = jsonDecode(response.body);
        productList.clear();
        for (var element in result) {
          productList.add(ProductInfo.fromJson(element));
        }
        isLoading.value = true;
        productList.refresh();
      } else {
        isLoading.value = true;
        productList.refresh();
      }
    } catch (e) {
      isLoading.value = true;
      productList.refresh();
      debugPrint(e.toString());
    }
  }

  addProduct() async {
    try {
      isLoading.value = false;
      var response = await RestServices.fromData(ApiHelpar.addProduct, body: {
        "user_login_token": prefer?.getString("token") ?? "",
        "name": name.text,
        "moq": moq.text,
        "price": price.text,
        "discounted_price": discountedPrice.text,
      });
      if (response.statusCode == 200) {
        getProductData();
        clearData();
        Get.back();
        Get.snackbar(
          "Success",
          jsonDecode(response.body)["message"],
          colorText: Colors.white,
          backgroundColor: Color(0xFF023470),
        );
        isLoading.value = true;
        isLoading.refresh();
      } else {
        isLoading.value = true;
        isLoading.refresh();
      }
    } catch (e) {
      isLoading.value = true;
      isLoading.refresh();
      debugPrint(e.toString());
    }
  }

  updateProduct(int index) async {
    try {
      isLoading.value = false;
      var response =
          await RestServices.fromData(ApiHelpar.updateProduct, body: {
        "user_login_token": prefer?.getString("token") ?? "",
        "name": name.text,
        "moq": moq.text,
        "price": price.text,
        "discounted_price": discountedPrice.text,
        "id": productList[index].id ?? "",
      });
      if (response.statusCode == 200) {
        getProductData();
        clearData();
        Get.back();
        Get.snackbar(
          "Success",
          jsonDecode(response.body)["message"],
          colorText: Colors.white,
          backgroundColor: Color(0xFF023470),
        );
        isLoading.value = true;
        isLoading.refresh();
      } else {
        isLoading.value = true;
        isLoading.refresh();
      }
    } catch (e) {
      isLoading.value = true;
      isLoading.refresh();
      debugPrint(e.toString());
    }
  }

  clearData() {
    name.clear();
    moq.clear();
    price.clear();
    discountedPrice.clear();
    productList.refresh();
  }

  deleteProduct(String id, int index) async {
    try {
      var response =
          await RestServices.fromData(ApiHelpar.deleteProduct, body: {
        "user_login_token": prefer?.getString("token") ?? "",
        "id": id,
      });
      if (response.statusCode == 200) {
        productList.removeAt(index);
        productList.refresh();
        Get.snackbar(
          "Success",
          jsonDecode(response.body)["message"],
          colorText: Colors.white,
          backgroundColor: Color(0xFF023470),
        );
      }
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void onInit() {
    // if (Get.arguments != null) {
    //   var index = Get.arguments;
    //   print(index.toString());
    // }
    getProductData();
    super.onInit();
  }
}
