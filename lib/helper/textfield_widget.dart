// ignore_for_file: prefer_const_constructors, sort_child_properties_last, must_be_immutable

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:jayraj_task/helper/fontfamily.dart';
import 'package:lottie/lottie.dart';

class TextFieldWidget extends StatelessWidget {
  String? hintText;
  Color? color;
  bool? readOnly;
  TextEditingController? controller;

  TextFieldWidget(
      {super.key, this.hintText, this.color, this.readOnly, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.sp,
      margin: EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
      child: TextFormField(
        controller: controller,
        readOnly: readOnly ?? false,
        style: TextStyle(
          color: Color(0xFF023470),
          fontFamily: FontFamily.poppinsRegular,
        ),
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF023470),
            ),
          ),
          contentPadding: EdgeInsets.only(bottom: 0, left: 10),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Color(0xFF023470),
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
            ),
          ),
          label: Text(hintText ?? ""),
          labelStyle: TextStyle(
            color: color ?? Color(0xFF023470),
            fontFamily: FontFamily.poppinsRegular,
            fontSize: 14.sp,
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
    );
  }
}

showTost(String tost) {
  Fluttertoast.showToast(
    msg: tost,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
    timeInSecForIosWeb: 1,
    backgroundColor: Color(0xFF023470),
    textColor: Colors.white,
    fontSize: 16.0,
  );
}

loadingWidget() {
  return Lottie.asset(
    "assets/lottie/loading.json",
    height: 70.sp,
    width: 70.sp,
    fit: BoxFit.fill,
  );
}

loadingWhiteWidget() {
  return Lottie.asset(
    "assets/lottie/loadingwhite.json",
    height: 60.sp,
    width: 60.sp,
  );
}
