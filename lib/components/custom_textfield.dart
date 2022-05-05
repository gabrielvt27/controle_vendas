import 'package:controle_vendas/components/textfield_error.dart';
import 'package:controle_vendas/helpers/appstyles.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    Key? key,
    this.onChanged,
    this.errorMessage,
    this.hintText,
    this.suffixIcon,
    this.obscureText = false,
  }) : super(key: key);

  final bool obscureText;
  final String? hintText;
  final String? errorMessage;
  final Widget? suffixIcon;
  final void Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Material(
          elevation: AppStyles.defaultElevation,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppStyles.defaultBorderRadius),
          ),
          child: TextFormField(
            onChanged: onChanged,
            obscureText: obscureText,
            cursorColor: AppStyles.secondaryColor,
            decoration: AppStyles.inputStyle(
              hintText: hintText,
              suffixIcon: suffixIcon,
            ),
          ),
        ),
        TextFieldError(
          errorMessage: errorMessage,
        ),
      ],
    );
  }
}
