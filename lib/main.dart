import 'package:fire_app/presentation/app/fire_app.dart';
import 'package:flutter/material.dart';

import 'data/loading/loading.dart';
import 'data/local/shared_preferences_manager.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferencesManager().getInstance();
  configLoading();
  runApp(const FireApp());
}
