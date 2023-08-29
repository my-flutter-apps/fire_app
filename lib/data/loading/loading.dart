import 'package:fire_app/config/constants/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

void configLoading() {
  EasyLoading.instance
    ..displayDuration = const Duration(milliseconds: 2000)
    ..toastPosition = EasyLoadingToastPosition.bottom
    ..indicatorType = EasyLoadingIndicatorType.fadingCircle
    ..loadingStyle = EasyLoadingStyle.light
    ..maskType = EasyLoadingMaskType.custom
    ..indicatorSize = 40.0
    ..radius = 10.0
    ..boxShadow = [
      BoxShadow(
        color: AppColor.blackColor.withOpacity(0.1),
        offset: const Offset(1.0, 2.0),
        blurRadius: 50.0,
      )
    ]
    ..backgroundColor = AppColor.whiteColor
    ..indicatorColor = AppColor.violetColor
    ..maskColor = AppColor.blackColor.withOpacity(0.2)
    ..userInteractions = false
    ..dismissOnTap = false;
}