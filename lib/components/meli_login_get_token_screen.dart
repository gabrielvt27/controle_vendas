import 'package:controle_vendas/modules/modules.dart';
import 'package:controle_vendas/routes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MeliLoginGetTokenScreen extends StatefulWidget {
  const MeliLoginGetTokenScreen({
    Key? key,
    required this.code,
  }) : super(key: key);

  final String code;

  @override
  State<MeliLoginGetTokenScreen> createState() =>
      _MeliLoginGetTokenScreenState();
}

class _MeliLoginGetTokenScreenState extends State<MeliLoginGetTokenScreen> {
  @override
  void initState() {
    super.initState();

    final userController = Provider.of<UserController>(
      Routes.mainNavigatorKey.currentContext!,
      listen: false,
    );

    userController.getMeliToken(widget.code);
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
