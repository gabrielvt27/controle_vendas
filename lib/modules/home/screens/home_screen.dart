import 'package:controle_vendas/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modules.dart';
import '../../../routes.dart';
import '../../../helpers/helpers.dart';

class HomeScreen extends StatelessWidget {
  HomeScreen({Key? key}) : super(key: key);

  final HomeController homeController = HomeController();

  @override
  Widget build(BuildContext context) {
    final userController = Provider.of<UserController>(
      context,
      listen: false,
    );
    return Scaffold(
      appBar: Responsive.isMobile(context)
          ? AppBar(
              title: ValueListenableBuilder<String>(
                  valueListenable: homeController.pageTitle,
                  builder: (context, pageTitle, _) {
                    return Text(
                      pageTitle,
                      style: AppStyles.titleTextStyle,
                    );
                  }),
              centerTitle: true,
              iconTheme: IconThemeData(
                color: AppStyles.secondaryColor,
              ),
            )
          : null,
      drawer: SideMenu(
        homeController: homeController,
      ),
      body: SafeArea(
        child: Row(
          children: [
            if (Responsive.isDesktop(context) || Responsive.isTablet(context))
              Expanded(
                child: SideMenu(
                  homeController: homeController,
                ),
              ),
            Expanded(
              flex: 5,
              child: Navigator(
                key: Routes.homeNavigatorKey,
                initialRoute: '/dashboards',
                onGenerateRoute: Routes.onGenerateRouteHome,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
