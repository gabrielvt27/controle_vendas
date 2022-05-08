import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modules.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late UserController userController;

  @override
  void initState() {
    super.initState();

    userController = Provider.of<UserController>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(userController.user!.email!),
      ),
      floatingActionButton:
          FloatingActionButton(onPressed: userController.logout),
    );
  }
}
