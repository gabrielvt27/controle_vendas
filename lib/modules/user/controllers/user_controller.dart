import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../modules.dart';
import '../../../routes.dart';

class UserController {
  AuthRepository repository;
  UserModel? user;

  Map? meliToken;

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

      final prefs = await SharedPreferences.getInstance();
      final meliTokenStr = prefs.getString('meliToken');

      if (meliTokenStr is String) {
        meliToken = jsonDecode(meliTokenStr);
      }
    }
    loading = true;
    Navigator.of(Routes.mainNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil('/home', (route) => false);
  }

  Future<void> logout() async {
    user = null;
    isLoggedIn = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('meliToken');
    await prefs.remove('jwt');
    Navigator.of(Routes.mainNavigatorKey.currentContext!)
        .pushNamedAndRemoveUntil('/', (route) => false);
  }

  getMeliToken(String code) async {
    final res = await repository.getMeliAccessToken(code);
    print(res);
    if (res['access_token'] is String) {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setString('meliToken', jsonEncode(res));

      meliToken = res;

      Navigator.of(Routes.mainNavigatorKey.currentContext!)
          .pushNamedAndRemoveUntil('/home', (route) => false);
    }
  }
}
