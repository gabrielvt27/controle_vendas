import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../user_module.dart';

class UserRepository {
  Future<UserModel?> currentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jwt = prefs.getString('jwt');

    if (jwt != null) {
      try {
        final response = await http.get(
            Uri.parse('http://192.168.4.182:3002/users/validatetoken'),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
              'x-access-token': jwt
            });

        final json = jsonDecode(response.body);
        if (response.statusCode == 200) {
          return UserModel.fromMap(json);
        } else {
          return null;
        }
      } catch (e) {
        print(e.toString());
        return null;
      }
    }

    return null;
  }

  Future<void> logout() async {
    /*final ParseUser currentUser = await ParseUser.currentUser();
    await currentUser.logout(deleteLocalUserData: true);*/
  }
}
