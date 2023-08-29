import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import 'login_provider.dart';

List<SingleChildWidget> get providers => _providers;
List<SingleChildWidget> _providers = [
  ChangeNotifierProvider(
    create: (_) => LoginProvider(),
  ),
];
