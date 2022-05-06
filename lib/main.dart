import 'package:flutter/material.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import './appwidget.dart';
import './helpers/helpers.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initParseServer();
  runApp(const AppWidget());
}

Future<void> initParseServer() async {
  await Parse().initialize(
    Secrets.kAppId,
    Secrets.kServerUrl,
    clientKey: Secrets.kClientKey,
    autoSendSessionId: true,
  );
}
