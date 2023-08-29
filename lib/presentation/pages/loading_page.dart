import 'dart:async';

import 'package:fire_app/config/constants/app_colors.dart';
import 'package:fire_app/config/constants/app_strings.dart';
import 'package:fire_app/config/constants/app_text_styles.dart';
import 'package:fire_app/config/router/navigation_service.dart';
import 'package:fire_app/config/router/pages.dart';
import 'package:fire_app/data/local/shared_preferences_manager.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingPage extends StatefulWidget {
  const LoadingPage({super.key});

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {
  final _sharedPrefManager = SharedPreferencesManager();

  @override
  initState() {
    super.initState();
    _sharedPrefManager.getInstance();
    loading();
  }

  loading() async {
    return Timer(const Duration(seconds: 2), checkUserLoginState);
  }

  checkUserLoginState() async {
    String initialRoute = Pages.loading;
    if (_sharedPrefManager.token.isEmpty) {
      _sharedPrefManager.removeAll();
      initialRoute = Pages.loginPage;
    } else {
      initialRoute = Pages.profilePage;
    }
    await NavigationService().navigateAndRemoveUntil(initialRoute);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.violetColor,
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(24.0),
            child: Text(
              AppString.loading,
              textAlign: TextAlign.center,
              style: AppTextStyles.textStyleSemiBold24
                  .copyWith(color: AppColor.whiteColor),
            ),
          ),
          const CupertinoActivityIndicator(
            radius: 20,
            color: AppColor.whiteColor,
          ),
        ],
      )),
    );
  }
}
