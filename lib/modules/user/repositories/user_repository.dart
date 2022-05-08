import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../user_module.dart';

class UserRepository {
  Future<UserModel?> currentUser() async {
    final parseUser = await ParseUser.currentUser();

    if (parseUser != null) {
      final response =
          await ParseUser.getCurrentUserFromServer(parseUser.sessionToken);

      if (response != null && response.success) {
        return UserModel.mapParseToUser(response.result);
      } else {
        await parseUser.logout();
      }
    }

    return null;
  }

  Future<void> logout() async {
    final ParseUser currentUser = await ParseUser.currentUser();
    await currentUser.logout(deleteLocalUserData: true);
  }
}
