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
        ChangeNotifierProvider(create: (_) => UserController()),
      ],
      child: Builder(
        builder: (context) {
          final userController = Provider.of<UserController>(context);
          return MaterialApp(
            title: 'Controle de Vendas',
            debugShowCheckedModeBanner: false,
            navigatorKey: Routes.mainNavigatorKey,
            home:
                userController.isLoggedIn ? const HomeScreen() : LoginScreen(),
            routes: Routes.mainRoutes,
          );
        },
      ),
    );
  }
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(context);
    return MaterialApp(
      title: 'Controle de Vendas',
      debugShowCheckedModeBanner: false,
      navigatorKey: Routes.mainNavigatorKey,
      home: userController.isLoggedIn ? HomeScreen() : LoginScreen(),
      routes: Routes.mainRoutes,
    );
  }
}
