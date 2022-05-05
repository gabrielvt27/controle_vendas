import 'package:flutter/material.dart';

import 'package:controle_vendas/routes.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Controle de Vendas',
      debugShowCheckedModeBanner: false,
      navigatorKey: Routes.mainNavigatorKey,
      initialRoute: Routes.mainInitialRoute,
      routes: Routes.mainRoutes,
    );
  }
}
