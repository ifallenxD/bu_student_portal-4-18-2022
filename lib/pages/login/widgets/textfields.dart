import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/pages/login/login_page_controller.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:flutter/material.dart';

class StudentNoTextField extends StatelessWidget {
  const StudentNoTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateManager = getIt<LoginPageManager>();
    return ValueListenableBuilder<ButtonState>(
        valueListenable: stateManager.loginButtonNotifier,
        builder: (context, loginBtnState, child) {
          return TextFormField(
            controller: stateManager.studentNoController,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Student No.',
              labelStyle: fontSize16,
              hintText: 'Enter Student No.',
              hintStyle: fontSize16,
              prefixIcon: const Icon(Icons.person),
            ),
            style: fontSize16,
            maxLines: 1,
            readOnly: loginBtnState == ButtonState.Loading ? true : false,
          );
        });
  }
}

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({Key? key}) : super(key: key);

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  @override
  Widget build(BuildContext context) {
    final stateManager = getIt<LoginPageManager>();
    return ValueListenableBuilder<ButtonState>(
        valueListenable: stateManager.loginButtonNotifier,
        builder: (context, loginBtnState, child) {
          return TextFormField(
            controller: stateManager.passwordController,
            obscureText: !stateManager.isPasswordVisible,
            decoration: InputDecoration(
              border: InputBorder.none,
              labelText: 'Password',
              labelStyle: fontSize16,
              hintText: 'Enter Password',
              hintStyle: fontSize16,
              prefixIcon: const Icon(Icons.lock),
              suffixIcon: ClipOval(
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () => setState(() {
                      stateManager.showPassword();
                    }),
                    child: Icon(
                      stateManager.isPasswordVisible
                          ? Icons.visibility_outlined
                          : Icons.visibility_off_outlined,
                    ),
                  ),
                ),
              ),
            ),
            style: fontSize16,
            maxLines: 1,
            readOnly: loginBtnState == ButtonState.Loading ? true : false,
          );
        });
  }
}
