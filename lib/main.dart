// ignore_for_file: prefer_const_constructors, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jayraj_task/helper/route_helpar.dart';
import 'package:jayraj_task/view/presentation/home_screens/controller/home_controller.dart';
import 'package:jayraj_task/view/presentation/login_screens/controller/login_controller.dart';
import 'package:jayraj_task/view/presentation/signup_screens/controller/signup_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefer;

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefer = await SharedPreferences.getInstance();
  registerController();
  runApp(
    ScreenUtilInit(
      designSize: Size(414, 896),
      builder: (context, child) {
        return GetMaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
              child: child!,
            );
          },
          initialRoute: (prefer?.getBool("isLogin") ?? false)
              ? Routes.homeScreen
              : Routes.initialRoute,
          getPages: getPages,
        );
      },
    ),
  );
}

registerController() {
  Get.lazyPut(() => LoginController(), fenix: true);
  Get.lazyPut(() => SignUpController(), fenix: true);
}
