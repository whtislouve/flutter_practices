import 'package:flutter/material.dart';
import 'package:isar_mobx_login_test/dev/api/dio_test_request.dart';
import 'package:isar_mobx_login_test/helpers/dismiss_keyboard.dart';
import 'package:isar_mobx_login_test/pages/login_store.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final loginFormKey = GlobalKey<FormState>();
  bool isValidForm = false;
  LoginStore loginStore = LoginStore();

  @override
  Widget build(BuildContext context) {
    return DismissKeyBoard(
      child: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: const Text('Исправление ошибок'),
        ),
        body: Container(
            padding: const EdgeInsets.only(bottom: 80, left: 10, right: 10),
            color: Colors.amber,
            child: Form(
              onChanged: () {
                setState(() {
                  isValidForm = loginFormKey.currentState?.validate() ?? false;
                });
              },
              key: loginFormKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    onChanged: (value) => loginStore.password = value,
                    keyboardType: TextInputType.name,
                    autofillHints: const [AutofillHints.username],
                    decoration: const InputDecoration(
                      labelText: "Username",
                      hintText: "Enter username",
                    ),
                    validator: (String? value) {
                      if (value != null && value.trim().isEmpty) {
                        return 'Нехуй выносить валидацию формы в стор';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextFormField(
                      onChanged: (value) => loginStore.password = value,
                      autofillHints: const [AutofillHints.password],
                      obscureText: true,
                      decoration: const InputDecoration(
                        labelText: "Password",
                        hintText: "Enter password",
                      ),
                      validator: (String? value) {
                        if (value != null && value.trim().isEmpty) {
                          return 'Такая же хуйня';
                        }
                        return null;
                      }),
                  const SizedBox(
                    height: 16.0,
                  ),
                  TextButton(
                    onPressed: isValidForm
                        ? () {
                            // showDialog(
                            //     context: context,
                            //     builder: (context) => const AlertDialog(
                            //         content: const Text(
                            //             'Не выноси валидацию в mobx ебана в рот')));
                            // request();
                          }
                        : null,
                    child: const Text("Login"),
                  )
                ],
              ),
            )),
      ),
    );
  }
}
