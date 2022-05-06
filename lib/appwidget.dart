import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './routes.dart';
import './modules/modules.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(create: (_) => UserController()),
      ],
      child: MaterialApp(
        title: 'Controle de Vendas',
        debugShowCheckedModeBanner: false,
        navigatorKey: Routes.mainNavigatorKey,
        initialRoute: Routes.mainInitialRoute,
        routes: Routes.mainRoutes,
      ),
    );
  }
}
