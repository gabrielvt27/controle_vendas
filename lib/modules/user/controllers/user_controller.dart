import 'package:flutter/widgets.dart';

import '../../modules.dart';
import '../../../routes.dart';

class UserController {
  AuthRepository repository;
  UserModel? user;

  bool isLoggedIn = false;
  bool loading = false;

  UserController(this.repository) {
    _getCurrentUser();
  }

  _getCurrentUser() async {
    final respUser = await repository.currentUser();
    if (respUser is UserModel) {
      user = respUser;
      isLoggedIn = true;
    }
    loading = true;
    Navigator.of(Routes.mainNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil('/', (route) => false);
  }

  Future<void> logout() async {
    user = null;
    isLoggedIn = false;
    Navigator.of(Routes.mainNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil('/', (route) => false);
  }
}
