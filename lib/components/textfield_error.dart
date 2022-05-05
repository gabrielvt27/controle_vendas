import 'package:flutter/material.dart';

class TextFieldError extends StatelessWidget {
  const TextFieldError({
    Key? key,
    this.errorMessage,
  }) : super(key: key);

  final String? errorMessage;

  @override
  Widget build(BuildContext context) {
    return errorMessage != null
        ? Padding(
            padding: const EdgeInsets.only(top: 5, left: 5),
            child: Text(
              errorMessage!,
              style: const TextStyle(
                color: Colors.red,
                fontWeight: FontWeight.w500,
              ),
            ),
          )
        : Container();
  }
}
