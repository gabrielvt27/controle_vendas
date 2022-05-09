import 'package:controle_vendas/helpers/helpers.dart';
import 'package:controle_vendas/modules/home/controllers/home_controller.dart';
import 'package:controle_vendas/modules/modules.dart';
import 'package:controle_vendas/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.homeController,
  }) : super(key: key);

  final HomeController homeController;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppStyles.primaryColor,
      child: ListView(
        children: [
          /*DrawerHeader(
            child: Image.asset("assets/images/logo.png"),
          ),*/
          DrawerListTile(
            title: "Dashboard",
            icon: Icons.home,
            press: () {
              homeController.setPageTitle("Dashboard");
              Routes.homeNavigatorKey.currentState!.pushNamed('/dashboards');
            },
          ),
          DrawerListTile(
            title: "Produtos",
            icon: Icons.apps,
            press: () {
              homeController.setPageTitle("Produtos");
              Routes.homeNavigatorKey.currentState!.pushNamed('/produtos');
            },
          ),
          DrawerListTile(
            title: "Estoque",
            icon: Icons.home,
            press: () {
              homeController.setPageTitle("Estoque");
              Routes.homeNavigatorKey.currentState!.pushNamed('/estoque');
            },
          ),
          DrawerListTile(
            title: "Sair",
            icon: Icons.power_settings_new_rounded,
            press: Provider.of<UserController>(context, listen: false).logout,
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    // For selecting those three line once press "Command+D"
    required this.title,
    required this.icon,
    required this.press,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        press();

        Responsive.isMobile(context) ? Navigator.of(context).pop() : null;
      },
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        size: 20,
        color: AppStyles.textColor,
      ),
      title: Text(
        title,
        style: AppStyles.drawerTextStyle,
      ),
    );
  }
}
