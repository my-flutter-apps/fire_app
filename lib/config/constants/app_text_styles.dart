import 'package:flutter/material.dart';
import 'app_colors.dart';
import 'package:fire_app/config/constants/app_fonts.dart';

abstract class AppTextStyles {
  static TextStyle elevatedButtonTextStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w700,
    height: 1.5,
    color: AppColor.whiteColor,
    fontFamily: AppFonts.geologica,
  );

  static TextStyle inputHintTextStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColor.lightGrayColor,
    fontFamily: AppFonts.geologica,
  );

  static TextStyle inputTextStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.5,
    color: AppColor.blackColor,
    fontFamily: AppFonts.geologica,
  );

  static TextStyle textStyleSemiBold24 = const TextStyle(
    fontSize: 24.0,
    fontWeight: FontWeight.w600,
    height: 1.6,
    color: AppColor.blackColor,
    fontFamily: AppFonts.geologica,
  );

  static TextStyle textStyleNormal16 = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w400,
    height: 1.4,
    color: AppColor.blackColor,
    fontFamily: AppFonts.geologica,
  );

  static TextStyle appBarTextStyle = const TextStyle(
    fontSize: 16.0,
    fontWeight: FontWeight.w500,
    height: 1.4,
    color: AppColor.blackColor,
    fontFamily: AppFonts.geologica,
  );
}
