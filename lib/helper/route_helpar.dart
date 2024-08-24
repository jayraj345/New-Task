// ignore_for_file: prefer_const_constructors

import 'package:get/get.dart';
import 'package:jayraj_task/view/presentation/home_screens/add_product.dart';
import 'package:jayraj_task/view/presentation/home_screens/details_screen.dart';
import 'package:jayraj_task/view/presentation/home_screens/home_screen.dart';
import 'package:jayraj_task/view/presentation/login_screens/login_screen.dart';
import 'package:jayraj_task/view/presentation/signup_screens/signup_screen.dart';

class Routes {
  static String initialRoute = "/";
  static String homeScreen = "/homeScreen";
  static String signUpScreen = "/signUpScreen";
  static String addProduct = "/addProduct";
  static String detailsProduct = "/detailsProduct";
}

final getPages = [
  GetPage(
    name: Routes.initialRoute,
    page: () => LoginScreen(),
  ),
  GetPage(
    name: Routes.homeScreen,
    page: () => HomeScreen(),
  ),
  GetPage(
    name: Routes.signUpScreen,
    page: () => SignUpScreen(),
  ),
  GetPage(
    name: Routes.addProduct,
    page: () => AddProduct(),
  ),
  GetPage(
    name: Routes.detailsProduct,
    page: () => DetailsPage(),
  ),
];
