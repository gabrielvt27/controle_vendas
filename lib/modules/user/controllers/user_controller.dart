import 'package:flutter/material.dart';

import '../../modules.dart';

class UserController with ChangeNotifier {
  UserModel? user;

  bool isLoggedIn = false;

  UserController() {
    _getCurrentUser();
  }

  _getCurrentUser() async {
    await Future.delayed(const Duration(seconds: 1));
    user = await Future.value(UserModel(email: "a"));
    isLoggedIn = false;
    notifyListeners();
  }
}
