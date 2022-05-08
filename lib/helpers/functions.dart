import 'package:flutter/material.dart';

import '../routes.dart';

class Functions {
  static void showCustomDialog({
    required String title,
    required String message,
  }) {
    showDialog(
      context: Routes.mainNavigatorKey.currentContext!,
      builder: (context) {
        return AlertDialog(
          title: Text(title),
          content: Text(message),
          actions: [
            TextButton(
              child: const Text("OK"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  static void circularIndicator() {
    showDialog(
      context: Routes.mainNavigatorKey.currentContext!,
      builder: (context) {
        Future.delayed(const Duration(seconds: 2), () {
          Navigator.of(context).pop(true);
        });
        return const AlertDialog(
          content: Card(
            child: Padding(
              padding: EdgeInsets.all(32),
              child: CircularProgressIndicator(),
            ),
          ),
        );
      },
    );
  }
}
