import 'package:controle_vendas/helpers/appstyles.dart';
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
        theme: ThemeData().copyWith(
          scaffoldBackgroundColor: const Color(0xFFBBBBBB),
          appBarTheme: AppBarTheme(
            backgroundColor: AppStyles.primaryColor,
          ),
        ),
        debugShowCheckedModeBanner: false,
        navigatorKey: Routes.mainNavigatorKey,
        initialRoute: Routes.mainInitialRoute,
        onGenerateRoute: Routes.onGenerateRouteMain,
      ),
    );
  }
}
