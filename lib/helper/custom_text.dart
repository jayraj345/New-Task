// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class CommonTextWidget extends StatelessWidget {
  String? title;
  double? fontSize;
  String? fontFamily;
  Color? textColor;
  TextOverflow? textOverflow;
  CommonTextWidget({
    this.title,
    this.fontSize,
    this.fontFamily,
    this.textColor,
    this.textOverflow,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title ?? "",
      maxLines: 1,
      style: TextStyle(
        fontSize: fontSize,
        fontFamily: fontFamily,
        color: textColor,
        overflow: textOverflow,
      ),
    );
  }
}
