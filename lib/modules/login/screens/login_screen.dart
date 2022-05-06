import 'package:flutter/material.dart';

import '../../modules.dart';
import '../../../components/components.dart';
import '../../../helpers/helpers.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({Key? key}) : super(key: key);

  final controller = LoginController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SizedBox(
          width: size.width > 850 ? size.width / 2.5 : size.width / 1.1,
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius:
                  BorderRadius.circular(AppStyles.defaultBorderRadius),
            ),
            color: AppStyles.primaryColor,
            elevation: AppStyles.defaultElevation,
            child: Container(
              padding: EdgeInsets.all(AppStyles.defaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    "LOGIN",
                    style: AppStyles.titleTextStyle,
                  ),
                  SizedBox(
                    height: AppStyles.defaultPadding,
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: controller.errorLogin,
                    builder: (context, errorLogin, _) {
                      return errorLogin != null
                          ? Text(
                              errorLogin,
                              style: const TextStyle(
                                color: Colors.red,
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            )
                          : Container();
                    },
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: controller.email,
                    builder: (context, value, _) {
                      return CustomTextFormField(
                        hintText: "E-mail",
                        onChanged: controller.setEmail,
                        errorMessage: controller.emailError,
                      );
                    },
                  ),
                  SizedBox(
                    height: AppStyles.defaultPadding,
                  ),
                  ValueListenableBuilder<String?>(
                    valueListenable: controller.senha,
                    builder: (context, value, _) {
                      return ValueListenableBuilder<bool>(
                          valueListenable: controller.verSenha,
                          builder: (context, verSenha, _) {
                            return CustomTextFormField(
                              hintText: "Senha",
                              obscureText: verSenha,
                              suffixIcon: IconButton(
                                icon: verSenha
                                    ? const Icon(
                                        Icons.visibility_off_outlined,
                                        color: Color(0xFFBBBBBB),
                                      )
                                    : const Icon(
                                        Icons.visibility_outlined,
                                        color: Color(0xFFBBBBBB),
                                      ),
                                onPressed: () =>
                                    controller.setVerSenha(!verSenha),
                              ),
                              onChanged: controller.setSenha,
                              errorMessage: controller.senhaError,
                            );
                          });
                    },
                  ),
                  SizedBox(
                    height: AppStyles.defaultPadding * 1.5,
                  ),
                  ValueListenableBuilder(
                    valueListenable: controller.login,
                    builder: (context, snapshot, _) {
                      return SizedBox(
                        height: AppStyles.defaultPadding * 3,
                        child: ElevatedButton(
                          onPressed: controller.login.value,
                          style: AppStyles.buttonStyle,
                          child: ValueListenableBuilder<bool>(
                            valueListenable: controller.loading,
                            builder: (context, loading, _) {
                              return loading
                                  ? const CircularProgressIndicator(
                                      valueColor: AlwaysStoppedAnimation(
                                        Colors.black,
                                      ),
                                    )
                                  : const Text("ENTRAR");
                            },
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
