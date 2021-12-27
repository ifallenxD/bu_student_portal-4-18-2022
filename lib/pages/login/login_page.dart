import 'package:bu_portal_app/pages/login/login_page_controller.dart';
import 'package:bu_portal_app/pages/login/widgets/textfields.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:bu_portal_app/globals.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final stateManager = getIt<LoginPageManager>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [primaryColor, colorCultured],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Image.asset(
                    'assets/images/bicol_university_logo.png',
                    width: 100.0,
                    fit: BoxFit.fitWidth,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'BICOL',
                      style: TextStyle(
                        color: primaryColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: colorRaisinBlack,
                            offset: const Offset(1.0, 1.0),
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                    ),
                    Text(
                      'UNIVERSITY',
                      style: TextStyle(
                        color: secondaryColor,
                        fontSize: 36,
                        fontWeight: FontWeight.bold,
                        shadows: [
                          Shadow(
                            color: colorRaisinBlack,
                            offset: const Offset(1.0, 1.0),
                            blurRadius: 1.0,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                Text(
                  'STUDENT PORTAL',
                  style: TextStyle(
                    color: tertiaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: tertiaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const StudentNoTextField(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                        width: double.infinity,
                        height: 60,
                        decoration: BoxDecoration(
                          color: tertiaryColor,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: const PasswordTextField(),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const LoginButton(),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final stateManager = getIt<LoginPageManager>();
    return ValueListenableBuilder<ButtonState>(
        valueListenable: stateManager.loginButtonNotifier,
        builder: (context, loginButton, child) {
          return ElevatedButton.icon(
            onPressed: loginButton == ButtonState.Loading
                ? null
                : () {
                    stateManager.login(context);
                    FocusScope.of(context).unfocus();
                  },
            icon: loginButton == ButtonState.Loading
                ? const SizedBox(
                    width: 24,
                    height: 24,
                    child: Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    ),
                  )
                : const Icon(Icons.login),
            label: Text(
              'LOGIN',
              style: TextStyle(
                fontSize: 16,
                color: tertiaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
            style: ElevatedButton.styleFrom(
              padding:
                  const EdgeInsets.symmetric(vertical: 14.0, horizontal: 30.0),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30.0),
              ),
              primary: primaryColor,
            ),
          );
        });
  }
}
