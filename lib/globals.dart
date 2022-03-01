import 'package:bu_portal_app/pages/login/login_page_controller.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:flutter/material.dart';

// AppBar
Widget titleAppBar() {
  return Row(
    mainAxisSize: MainAxisSize.min,
    children: [
      Image.asset(
        'assets/images/bicol_university_logo.png',
        fit: BoxFit.contain,
        height: 32,
      ),
      const Text(' Bicol University'),
    ],
  );
}

// Get Remember Me State
bool gRememberMe = getIt<LoginPageManager>().isRemember;

// Colors
Color primaryColor = Colors.blue.shade600;
Color secondaryColor = Colors.deepOrange.shade400;
Color tertiaryColor = Colors.white;
Color colorRaisinBlack = const Color(0xFF202030);
Color colorCultured = const Color(0xFFF7F9F9);
Color colorOpal = const Color(0xFFBED8D4);
Color colorSpaceGray = const Color(0xFF4C5454);
Color shadowColor = const Color(0x36000000);

// TextStyle
TextStyle fontSize16 = const TextStyle(fontSize: 16);

// URL
bool IS_ONLINE = false;
var BASE_URL = IS_ONLINE
    ? 'http://bucapstoneportal.mooo.com' // freedns
    : 'http://10.0.2.2/bu_portal_api'; // local
    // : 'http://10.20.30.234';
