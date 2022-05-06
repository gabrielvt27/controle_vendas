import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../modules.dart';
import '../../../routes.dart';
import '../../../helpers/helpers.dart';

class LoginController {
  BuildContext context = Routes.mainNavigatorKey.currentContext!;

  ValueNotifier<String?> email = ValueNotifier(null);
  ValueNotifier<String?> senha = ValueNotifier(null);
  ValueNotifier<bool> verSenha = ValueNotifier(true);
  ValueNotifier<bool> loading = ValueNotifier(false);
  ValueNotifier<String?> errorLogin = ValueNotifier(null);
  ValueNotifier<VoidCallback?> login = ValueNotifier(null);

  setEmail(String? val) {
    email.value = val;
    _checkEnableLogin();
  }

  setSenha(String? val) {
    senha.value = val;
    _checkEnableLogin();
  }

  setVerSenha(bool val) => verSenha.value = val;

  bool get emailValid => email.value != null && email.value!.isEmailValid();
  bool get senhaValid => senha.value != null && senha.value!.length > 4;

  String? get emailError {
    if (email.value == null || emailValid) {
      return null;
    } else {
      return "E-mail inválido";
    }
  }

  String? get senhaError {
    if (senha.value == null || senhaValid) {
      return null;
    } else {
      return "Senha muito curta";
    }
  }

  _checkEnableLogin() {
    login.value = emailValid && senhaValid ? _login : null;
  }

  _login() async {
    login.value = null;
    loading.value = true;
    errorLogin.value = null;

    final user = UserModel(email: email.value, senha: senha.value);

    try {
      final resultUser = await LoginRepository().loginComEmail(user);

      Provider.of<UserController>(context, listen: false).user = resultUser;

      Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
    } catch (e) {
      errorLogin.value = e.toString();
    }

    login.value = _login;
    loading.value = false;
  }
}
