import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import './modules/modules.dart';
import './components/components.dart';

class Routes {
  static String mainInitialRoute = '/';

  static GlobalKey<NavigatorState> mainNavigatorKey =
      GlobalKey<NavigatorState>();

  static GlobalKey<NavigatorState> homeNavigatorKey =
      GlobalKey<NavigatorState>();

  static Route? onGenerateRouteMain(RouteSettings settings) {
    final userController = Provider.of<UserController>(
      mainNavigatorKey.currentContext!,
      listen: false,
    );

    // Verificar se a busca do usuário atual já foi terminada
    // caso negativo, retornar a LoadingScreen
    if (!userController.loading) {
      return MaterialPageRoute(builder: (_) => const LoadingScreen());
    }

    // Caso o usuário não esteja logado, redirecionar p/ o login
    if (!userController.isLoggedIn) {
      return MaterialPageRoute(builder: (_) => AuthScreen());
    } else {
      List<String> pathComponents = settings.name!.split('?');
      switch (pathComponents[0]) {
        case '/':
        case '/home':
          return MaterialPageRoute(builder: (_) => HomeScreen());
        default:
          return MaterialPageRoute(builder: (_) => AuthScreen());
      }
    }
  }

  static Route? onGenerateRouteHome(RouteSettings settings) {
    List<String> pathComponents = settings.name!.split('?');
    Widget page;

    switch (pathComponents[0]) {
      case '/dashboards':
        page = const DashboardScreen();
        break;
      case '/produtos':
        page = Container(
          color: Colors.green,
          child: const Text('Page 2'),
        );
        break;
      case '/estoque':
        page = Container(
          color: Colors.blue,
          child: const Text('Page 3'),
        );
        break;
      default:
        page = Container(
          color: Colors.red,
          child: const Text('Page 1'),
        );
        break;
    }

    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
    );
  }
}
