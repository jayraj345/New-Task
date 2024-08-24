// ignore_for_file: prefer_const_constructors

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jayraj_task/helper/RestServies/api_helpar.dart';
import 'package:jayraj_task/helper/RestServies/rest_servies.dart';
import 'package:jayraj_task/helper/route_helpar.dart';
import 'package:jayraj_task/view/presentation/signup_screens/model/signup_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SignUpController extends GetxController implements GetxService {
  TextEditingController name = TextEditingController(text: "yagnik");
  TextEditingController email = TextEditingController(text: "yagnik@gmail.com");
  TextEditingController mobile = TextEditingController(text: "5674380132");
  TextEditingController password = TextEditingController(text: "yagnik@#_456");
  RxBool isLoading = false.obs;
  SharedPreferences? prefer;
  Rx<SignUpInfo> signUpInfo = SignUpInfo().obs;

  registerUser() async {
    try {
      prefer = await SharedPreferences.getInstance();
      isLoading.value = true;
      var response = await RestServices.fromData(ApiHelpar.registerUser, body: {
        "name": name.text,
        "email": email.text,
        "mobile": mobile.text,
        "password": password.text,
      });
      if (response.statusCode == 200) {
        signUpInfo.value = SignUpInfo.fromJson(jsonDecode(response.body));
        prefer?.setString("token", signUpInfo.value.data?.userToken ?? "");
        prefer?.setBool("isLogin", true);
        isLoading.value = false;
        signUpInfo.refresh();
        Get.snackbar(
          "Success",
          signUpInfo.value.message ?? "",
          colorText: Colors.white,
          backgroundColor: Color(0xFF023470),
        );
        Get.offAllNamed(Routes.homeScreen);
      } else {
        Get.snackbar(
          "Alert",
          jsonDecode(response.body)['message'],
          colorText: Colors.white,
          backgroundColor: Colors.red.shade300,
        );
        isLoading.value = false;
        signUpInfo.refresh();
      }
    } catch (e) {
      isLoading.value = false;
      isLoading.refresh();
      debugPrint(e.toString());
    }
  }
}
