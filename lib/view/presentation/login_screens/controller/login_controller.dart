import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:jayraj_task/helper/RestServies/api_helpar.dart';
import 'package:jayraj_task/helper/RestServies/rest_servies.dart';
import 'package:jayraj_task/helper/route_helpar.dart';
import 'package:jayraj_task/view/presentation/login_screens/model/login_info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends GetxController implements GetxService {
  TextEditingController email =
      TextEditingController(text: "user@innovins.com");
  TextEditingController password = TextEditingController(text: "123456");
  RxBool isLoading = false.obs;
  Rx<LoginInfo> loginInfo = LoginInfo().obs;
  SharedPreferences? prefer;

  userLogin() async {
    try {
      prefer = await SharedPreferences.getInstance();
      isLoading.value = true;
      var response = await RestServices.fromData(ApiHelpar.login, body: {
        "email": email.text,
        "password": password.text,
      });
      print(response.body.toString());
      if (response.statusCode == 200) {
        loginInfo.value = LoginInfo.fromJson(jsonDecode(response.body));
        prefer?.setString("token", loginInfo.value.data?.userToken ?? "");
        prefer?.setBool("isLogin", true);
        isLoading.value = false;
        loginInfo.refresh();
        Get.snackbar(
          "Success",
          loginInfo.value.message ?? "",
          colorText: Colors.white,
          backgroundColor: Color(0xFF023470),
        );
        Get.offAllNamed(Routes.homeScreen);
      } else {
        isLoading.value = false;
        loginInfo.refresh();
      }
    } catch (e) {
      isLoading.value = false;
      loginInfo.refresh();
      debugPrint(e.toString());
    }
  }
}
