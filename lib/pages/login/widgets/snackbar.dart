import 'package:flutter/material.dart';

void errorSnackbar(_, String message) {
  ScaffoldMessenger.of(_).showSnackBar(
    SnackBar(
      content: Text(message),
      duration: const Duration(seconds: 2),
    ),
  );
}
