// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jayraj_task/helper/fontfamily.dart';
import 'package:jayraj_task/helper/route_helpar.dart';
import 'package:jayraj_task/helper/textfield_widget.dart';
import 'package:jayraj_task/view/presentation/signup_screens/controller/signup_controller.dart';
import 'package:velocity_x/velocity_x.dart';

class SignUpScreen extends GetView<SignUpController> {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: SizedBox(
              child: Container(
                width: Get.size.width,
                alignment: Alignment.center,
                margin: EdgeInsets.all(20.sp),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    50.h.heightBox,
                    Text(
                      "Sign-UP",
                      style: TextStyle(
                        fontSize: 35.sp,
                        color: Color(0xFF023470),
                        fontFamily: FontFamily.poppinsMedium,
                      ),
                    ),
                    Container(
                      height: 45.sp,
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: TextFormField(
                        controller: controller.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontFamily.poppinsRegular,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.only(bottom: 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Name",
                            hintStyle: TextStyle(
                              color: Color(0xFFBCBCBC),
                              fontFamily: FontFamily.poppinsRegular,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(13.sp),
                              child: Image.asset(
                                "assets/images/user.png",
                                height: 13.sp,
                                width: 13.sp,
                              ),
                            )),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            offset: const Offset(
                              3.0,
                              3.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                    ),
                    8.h.heightBox,
                    Container(
                      height: 45.sp,
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: TextFormField(
                        controller: controller.email,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontFamily.poppinsRegular,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.only(bottom: 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "E-Mail",
                            hintStyle: TextStyle(
                              color: Color(0xFFBCBCBC),
                              fontFamily: FontFamily.poppinsRegular,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(13.sp),
                              child: Image.asset(
                                "assets/images/email.png",
                                height: 13.sp,
                                width: 13.sp,
                              ),
                            )),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            offset: const Offset(
                              3.0,
                              3.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                    ),
                    8.h.heightBox,
                    Container(
                      height: 45.sp,
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: TextFormField(
                        controller: controller.mobile,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontFamily.poppinsRegular,
                        ),
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            contentPadding: EdgeInsets.only(bottom: 0),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide.none,
                            ),
                            hintText: "Mobile",
                            hintStyle: TextStyle(
                              color: Color(0xFFBCBCBC),
                              fontFamily: FontFamily.poppinsRegular,
                            ),
                            prefixIcon: Padding(
                              padding: EdgeInsets.all(13.sp),
                              child: Image.asset(
                                "assets/images/phonecall.png",
                                height: 13.sp,
                                width: 13.sp,
                                color: Color(0xFF023470),
                              ),
                            )),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            offset: const Offset(
                              3.0,
                              3.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                    ),
                    8.h.heightBox,
                    Container(
                      height: 45.sp,
                      margin: EdgeInsets.symmetric(
                          horizontal: 20.sp, vertical: 10.sp),
                      child: TextFormField(
                        controller: controller.password,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: FontFamily.poppinsRegular,
                        ),
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          contentPadding: EdgeInsets.only(bottom: 0),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide.none,
                          ),
                          hintText: "Password",
                          hintStyle: TextStyle(
                            color: Color(0xFFBCBCBC),
                            fontFamily: FontFamily.poppinsRegular,
                          ),
                          prefixIcon: Padding(
                            padding: EdgeInsets.all(13.sp),
                            child: Image.asset(
                              "assets/images/eye.png",
                              height: 13.sp,
                              width: 13.sp,
                            ),
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(5),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade100,
                            offset: const Offset(
                              3.0,
                              3.0,
                            ),
                            blurRadius: 5.0,
                            spreadRadius: 1.0,
                          ),
                        ],
                      ),
                    ),
                    10.h.heightBox,
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Don’t have account? ",
                          style: TextStyle(
                            color: Color(0xFF023470),
                            fontSize: 13.sp,
                            fontFamily: FontFamily.poppinsRegular,
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Get.offAndToNamed(Routes.initialRoute);
                          },
                          child: Text(
                            "Sign-in",
                            style: TextStyle(
                              color: Color(0xFF023470),
                              fontSize: 13.sp,
                              decoration: TextDecoration.underline,
                              fontFamily: FontFamily.poppinsRegular,
                            ),
                          ),
                        ),
                        20.w.widthBox,
                      ],
                    ),
                    40.h.heightBox,
                    Obx(
                      () {
                        return InkWell(
                          onTap: () {
                            if (controller.name.text.trim() == "") {
                              Get.snackbar(
                                "Alert",
                                "Please Enter Your Name!",
                                colorText: Colors.white,
                                backgroundColor: Colors.red.shade300,
                              );
                            } else if (controller.email.text.trim() == "") {
                              Get.snackbar(
                                "Alert",
                                "Please Enter Your Email!",
                                colorText: Colors.white,
                                backgroundColor: Colors.red.shade300,
                              );
                            } else if (controller.mobile.text.trim() == "") {
                              Get.snackbar(
                                "Alert",
                                "Please Enter Your Mobile Number!",
                                colorText: Colors.white,
                                backgroundColor: Colors.red.shade300,
                              );
                            } else if (controller.password.text == "") {
                              Get.snackbar(
                                "Alert",
                                "Please Enter Your Password!",
                                colorText: Colors.white,
                                backgroundColor: Colors.red.shade300,
                              );
                            } else {
                              controller.registerUser();
                            }
                          },
                          child: Container(
                            height: 45.sp,
                            alignment: Alignment.center,
                            margin: EdgeInsets.symmetric(horizontal: 30.sp),
                            width: Get.size.width,
                            child: controller.isLoading.value
                                ? loadingWhiteWidget()
                                : Text(
                                    "Sign-In",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20.sp,
                                      fontFamily: FontFamily.poppinsMedium,
                                    ),
                                  ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFF023470),
                            ),
                          ),
                        );
                      },
                    ),
                    50.h.heightBox,
                  ],
                ),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15.sp),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black12,
                      offset: const Offset(
                        3.0,
                        3.0,
                      ),
                      blurRadius: 5.0,
                      spreadRadius: 1.0,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
