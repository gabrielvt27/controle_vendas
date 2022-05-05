import 'package:flutter/material.dart';

import 'package:controle_vendas/modules/modules.dart';

class Routes {
  static Map<String, Widget Function(BuildContext)> mainRoutes =
      <String, WidgetBuilder>{
    '/login': (_) => LoginScreen(),
    '/home': (_) => Container(),
  };

  static String mainInitialRoute = '/login';

  static GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey<NavigatorState>();
}
