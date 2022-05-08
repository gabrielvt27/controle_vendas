import 'package:flutter/material.dart';

import '../helpers/helpers.dart';

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(
            AppStyles.secondaryColor,
          ),
        ),
      ),
    );
  }
}
