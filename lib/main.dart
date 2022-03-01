import 'package:bu_portal_app/pages/landing_page.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  setupGetIt();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bicol University Student Portal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const LandingPage(),
        // '/login': (context) => const LoginPage(),
        // '/home': (context) => const HomePage(student: ?),
      },
    );
  }
}
