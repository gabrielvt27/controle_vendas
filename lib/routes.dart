import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './modules/modules.dart';
import './components/components.dart';

class Routes {
  static String mainInitialRoute = '/';

  static GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey<NavigatorState>();

  static Route? onGenerateRoute(RouteSettings settings) {
    final userController = Provider.of<UserController>(
        mainNavigatorKey.currentContext!,
        listen: false);

    // Verificar se a busca do usuário atual já foi terminada
    // caso negativo, retornar a LoadingScreen
    if (!userController.loading) {
      return MaterialPageRoute(builder: (_) => const LoadingScreen());
    }

    // Caso o usuário não esteja logado, redirecionar p/ o login
    if (!userController.isLoggedIn) {
      return MaterialPageRoute(builder: (_) => LoginScreen());
    } else {
      switch (settings.name) {
        case '/':
        case '/home':
          return MaterialPageRoute(builder: (_) => const HomeScreen());
        default:
          return MaterialPageRoute(builder: (_) => LoginScreen());
      }
    }
  }
}
