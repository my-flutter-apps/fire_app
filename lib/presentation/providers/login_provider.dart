import 'package:fire_app/config/router/navigation_service.dart';
import 'package:fire_app/config/router/pages.dart';
import 'package:flutter/cupertino.dart';

class LoginProvider extends ChangeNotifier {
  NavigationService navigationService = NavigationService();

  TextEditingController get loginController => _loginController;
  final TextEditingController _loginController = TextEditingController();

  TextEditingController get passwordController => _passwordController;
  final TextEditingController _passwordController = TextEditingController();

  Future<void> navigateRegister() async {
    await navigationService.navigateTo(Pages.registerPage);
  }
}
