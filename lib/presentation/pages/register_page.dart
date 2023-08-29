import 'package:fire_app/config/constants/app_strings.dart';
import 'package:fire_app/config/constants/app_text_styles.dart';
import 'package:fire_app/presentation/providers/login_provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../config/constants/app_colors.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(
          AppString.register,
          style: AppTextStyles.appBarTextStyle,
        ),
        border: null,
      ),
      child: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildForm(context),
                _buildButtons(context),
              ],
            ),
          ),
        ),
      ),
    );
  }

  _buildForm(BuildContext context) {
    final provider = context.watch<LoginProvider>();
    return Container(
      color: AppColor.whiteColor,
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
      margin: const EdgeInsets.only(bottom: 22.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          CupertinoTextField.borderless(
            placeholderStyle: AppTextStyles.inputHintTextStyle,
            style: AppTextStyles.inputTextStyle,
            placeholder: AppString.loginOrEmail,
            padding: const EdgeInsets.symmetric(vertical: 12),
            controller: provider.loginController,
          ),
          const Divider(),
          CupertinoTextField.borderless(
            placeholderStyle: AppTextStyles.inputHintTextStyle,
            style: AppTextStyles.inputTextStyle,
            placeholder: AppString.password,
            obscureText: true,
            padding: const EdgeInsets.symmetric(vertical: 12),
            controller: provider.passwordController,
          ),
        ],
      ),
    );
  }

  _buildButtons(BuildContext context) => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(
              onPressed: context.read<LoginProvider>().navigateRegister,
              color: AppColor.violetColor,
              borderRadius: BorderRadius.circular(6.0),
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Text(
                AppString.register,
                style: AppTextStyles.elevatedButtonTextStyle,
              ),
            ),
            const SizedBox(height: 20),
            CupertinoButton(
              onPressed: () {},
              color: AppColor.blackColor,
              borderRadius: BorderRadius.circular(6.0),
              padding: const EdgeInsets.all(
                20.0,
              ),
              child: Text(
                AppString.github,
                style: AppTextStyles.elevatedButtonTextStyle,
              ),
            ),
          ],
        ),
      );

  _handleLogin(BuildContext context) {
    final provider = context.read<LoginProvider>();
  }

  _showErrorAlert(BuildContext context, String message) {
    showCupertinoDialog(
      context: context,
      builder: (context) {
        return CupertinoAlertDialog(
          title: Text(message),
          actions: [
            CupertinoButton(
              child: const Text(
                "OK",
                textAlign: TextAlign.center,
              ),
              onPressed: () => Navigator.pop(context),
            )
          ],
        );
      },
    );
  }
}
