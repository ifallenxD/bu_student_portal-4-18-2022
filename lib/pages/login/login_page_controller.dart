import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/pages/home/home_page.dart';
import 'package:bu_portal_app/pages/login/widgets/snackbar.dart';
import 'package:flutter/material.dart';
import 'package:bu_portal_app/models/student_model.dart';
import 'package:http/http.dart' as http;

class LoginPageManager {
  final TextEditingController _studentNoController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isPasswordVisible = false;
  bool _rememberMe = false;
  final loginButtonNotifier = ValueNotifier<ButtonState>(ButtonState.Idle);

  TextEditingController get studentNoController => _studentNoController;
  TextEditingController get passwordController => _passwordController;
  bool get isPasswordVisible => _isPasswordVisible;
  bool get isRemember => _rememberMe;

  void showPassword() {
    _isPasswordVisible = !_isPasswordVisible;
  }

  void toggleRememberMe() {
    _rememberMe = !_rememberMe;
  }

  void login(context) async {
    String username = _studentNoController.text;
    String password = _passwordController.text;

    loginButtonNotifier.value = ButtonState.Loading;

    if (username.isNotEmpty && password.isNotEmpty) {
      try {
        // var url = 'http://10.0.2.2/flutter_api/bu_portal2/student/login.php';
        var api = '/student/login.php';
        var data = {
          'username': username,
          'password': password,
        };

        String url;

        if (IS_ONLINE) {
          var req = http.Request('Get', Uri.parse(BASE_URL))
            ..followRedirects = false;

          var baseRsp = await req.send();

          url = baseRsp.headers['location']! + api;
        } else {
          url = BASE_URL + api;
        }

        var response = await http.post(Uri.parse(url),
            body: jsonEncode(data),
            headers: {}).timeout(const Duration(seconds: 30));

        final Map<String, dynamic> parsed = jsonDecode(response.body);

        if (response.statusCode == 200) {
          _studentNoController.clear();
          _passwordController.clear();
          _isPasswordVisible = false;
          loginButtonNotifier.value = ButtonState.Done;
          final student = Student.fromJson(parsed);
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (context) => HomePage(
                student: student,
              ),
            ),
          );
        } else if (response.statusCode == 401) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Login Failed'),
                content: Text(parsed['message']),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      loginButtonNotifier.value = ButtonState.Idle;
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        } else {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Login Failed'),
                content: const Text(
                    'Something went wrong. \nPlease try again later'),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      loginButtonNotifier.value = ButtonState.Idle;
                      Navigator.of(context).pop();
                    },
                    child: const Text('Close'),
                  ),
                ],
              );
            },
          );
        }
      } on SocketException catch (e) {
        debugPrint('socketException: ' + e.message);
        loginButtonNotifier.value = ButtonState.Idle;
        return errorSnackbar(context, 'Error: No internet connection');
      } on HttpException catch (e) {
        debugPrint('httpException: ' + e.message);
        loginButtonNotifier.value = ButtonState.Idle;
        return errorSnackbar(context, 'Error: Something went wrong');
      } on FormatException catch (e) {
        debugPrint('formatException: ' + e.toString());
        loginButtonNotifier.value = ButtonState.Idle;
        return errorSnackbar(context, 'Error: Something went wrong');
      } on TimeoutException catch (e) {
        debugPrint('timeoutException: ' + e.message!);
        loginButtonNotifier.value = ButtonState.Idle;
        return errorSnackbar(context, 'Error: Server took too long to respond');
      }
    } else {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error'),
            content: const Text('Please fill required details.'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text('Okay'),
              ),
            ],
          );
        },
      );
    }
    loginButtonNotifier.value = ButtonState.Idle;
  }
}

// ignore: constant_identifier_names
enum ButtonState { Idle, Loading, Done }
