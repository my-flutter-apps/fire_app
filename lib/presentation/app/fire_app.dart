import 'package:fire_app/config/constants/app_colors.dart';
import 'package:fire_app/config/router/navigation_service.dart';
import 'package:fire_app/config/router/pages.dart';
import 'package:fire_app/data/local/shared_preferences_manager.dart';
import 'package:fire_app/presentation/providers/providers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:provider/provider.dart';

class FireApp extends StatelessWidget {
  const FireApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: providers,
      child: CupertinoApp(
        navigatorKey: NavigationService().navigatorKey,
        debugShowCheckedModeBanner: false,
        theme: const CupertinoThemeData(
          scaffoldBackgroundColor: AppColor.scaffoldBgColor,
          barBackgroundColor: AppColor.whiteColor,
          primaryColor: AppColor.violetColor,
        ),
        title: 'Fire App',
        initialRoute: Pages.loading,
        onGenerateRoute: NavigationService().generateRoute,
        builder: EasyLoading.init(),
      ),
    );
  }
}
