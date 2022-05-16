import 'dart:convert';

import 'package:controle_vendas/modules/modules.dart';
import 'package:controle_vendas/modules/user/models/user_view_model.dart';

import 'package:http/http.dart' as http;

class LoginRepository {
  Future<UserModel> loginComEmail(UserViewModel user) async {
    try {
      final response =
          await http.post(Uri.parse('http://192.168.4.182:3002/users/login'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: user.toJson());

      final json = jsonDecode(response.body);
      if (response.statusCode == 200) {
        return UserModel.fromMap(json);
      } else {
        return Future.error(json["message"]);
      }
    } catch (e) {
      return Future.error('Erro insperado');
    }
  }
}
