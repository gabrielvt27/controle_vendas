import 'package:controle_vendas/constants.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MeliLoginScreen extends StatelessWidget {
  const MeliLoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
          onPressed: () async {
            await launchUrl(
              Uri.parse(Contants.kMeliRoute),
              webOnlyWindowName: '_self',
            );
          },
          child: const Text('Conectar ao Mercado Livre'),
        ),
      ),
    );
  }
}
