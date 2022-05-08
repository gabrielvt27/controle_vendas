import 'package:flutter/widgets.dart';

import '../../modules.dart';
import '../../../routes.dart';

class UserController {
  UserModel? user;

  bool isLoggedIn = false;
  bool loading = false;

  UserController() {
    _getCurrentUser();
  }

  _getCurrentUser() async {
    final respUser = await UserRepository().currentUser();
    if (respUser is UserModel) {
      user = respUser;
      isLoggedIn = true;
    }
    loading = true;
    Navigator.of(Routes.mainNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil('/', (route) => false);
  }

  Future<void> logout() async {
    await UserRepository().logout();
    user = null;
    isLoggedIn = false;
    Navigator.of(Routes.mainNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil('/', (route) => false);
  }
}
