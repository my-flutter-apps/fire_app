import 'package:fire_app/config/router/pages.dart';
import 'package:fire_app/presentation/pages/loading_page.dart';
import 'package:fire_app/presentation/pages/login_page.dart';
import 'package:fire_app/presentation/pages/profile_page.dart';
import 'package:fire_app/presentation/pages/register_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NavigationService {
  static final NavigationService _instance = NavigationService._internal();

  factory NavigationService() {
    return _instance;
  }

  NavigationService._internal();

  final GlobalKey<NavigatorState> _navigatorKey = GlobalKey<NavigatorState>();

  GlobalKey<NavigatorState> get navigatorKey => _navigatorKey;

  NavigatorState? get _navigatorState => _navigatorKey.currentState;

  BuildContext? get buildContext => _navigatorKey.currentContext;

  Future<dynamic>? navigateTo(String page, {Object? arguments}) {
    return _navigatorState?.pushNamed(page);
  }

  Future<dynamic>? navigateAndRemoveUntil(String page, {Object? arguments}) {
    return _navigatorState?.pushNamedAndRemoveUntil(page, (route) => false,
        arguments: arguments);
  }

  void pop<T extends Object?>([T? result]) {
    _navigatorState!.pop(result);
  }

  void popUntil(String page, {Object? arguments}) {
    _navigatorState!.popUntil((r) => r.settings.name == page);
  }

  Route<dynamic> generateRoute(RouteSettings settings) {
    Widget resultPage;
    String? routeName = settings.name;
    switch (routeName) {
      case Pages.loading:
        resultPage = const LoadingPage();
      case Pages.loginPage:
        resultPage = const LoginPage();
      case Pages.registerPage:
        resultPage = const RegisterPage();
      case Pages.profilePage:
        resultPage = const ProfilePage();

      default:
        resultPage = const Scaffold();
        break;
    }
    return _getRoute(resultPage, settings: settings);
  }

  Route<dynamic> _getRoute(Widget widget, {RouteSettings? settings}) {
    return CupertinoPageRoute(
      builder: (_) => widget,
      settings: settings,
    );
  }

  Route _modalFromBottomRoute(Widget widget, {RouteSettings? settings}) {
    return PageRouteBuilder(
      settings: settings,
      pageBuilder: (context, animation, secondaryAnimation) => widget,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.ease;

        var tween =
            Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
}
