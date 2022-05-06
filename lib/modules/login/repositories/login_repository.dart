import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../modules.dart';
import '../../../helpers/helpers.dart';

class LoginRepository {
  Future<UserModel> loginComEmail(UserModel user) async {
    final parseUser = ParseUser(user.email, user.senha, null);

    var response = await parseUser.login();

    if (response.success) {
      return UserModel.mapParseToUser(response.result);
    } else {
      return Future.error(ParseErrors.getDescription(response.error!.code));
    }
  }
}
