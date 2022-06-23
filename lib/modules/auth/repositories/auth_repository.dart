import 'package:controle_vendas/constants.dart';
import 'package:controle_vendas/modules/modules.dart';
import 'package:controle_vendas/modules/user/models/user_view_model.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  Dio dio;

  AuthRepository(this.dio);

  Future<UserModel> loginComEmail(UserViewModel user) async {
    try {
      final response = await dio.post(
        '${Contants.kApiRoute}/users/login',
        data: user.toMap(),
      );

      if (response.statusCode == 200) {
        return UserModel.fromMap(response.data);
      } else {
        return Future.error('');
      }
    } catch (e) {
      return Future.error('Erro insperado');
    }
  }

  Future<UserModel?> currentUser() async {
    final prefs = await SharedPreferences.getInstance();
    final String? jwt = prefs.getString('jwt');

    if (jwt != null) {
      try {
        final response = await dio.get(
          '${Contants.kApiRoute}/users/validatetoken',
          options: Options(headers: {
            'x-access-token': jwt,
          }),
        );

        if (response.statusCode == 200) {
          return UserModel.fromMap(response.data);
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
}
