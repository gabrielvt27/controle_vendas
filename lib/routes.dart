import 'package:flutter/material.dart';

import './modules/modules.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> mainRoutes =
      <String, WidgetBuilder>{
    '/login': (_) => LoginScreen(),
    '/home': (_) => const HomeScreen(),
  };

  static String mainInitialRoute = '/login';

  static GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey<NavigatorState>();
}
