import 'dart:convert';
import 'package:bu_portal_app/models/student_model.dart';
import 'package:bu_portal_app/pages/landing_page.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:bu_portal_app/services/storage_service/storage_service.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePageManager {
  Student? _currentStudent;
  final _storageService = getIt<StorageService>();

  int get studentId => _currentStudent!.id;
  String get studFirstname => _currentStudent!.stud_fname.capitalize();
  String get dateToday => DateFormat.yMMMMEEEEd().format(DateTime.now());

  void initialize(Student student) async {
    _currentStudent = student;
    _storageService.setStudent(jsonEncode(_currentStudent!.toJson()));
  }

  void logout(context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            ElevatedButton(
              onPressed: () {
                _storageService.clearStorage();
                clearGetIt();
                Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                        builder: (context) => const LandingPage()),
                    (route) => false);
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}

extension StringExtension on String {
  String capitalize() {
    if (isEmpty) {
      return "";
    } else if (length <= 1) {
      return toUpperCase();
    } else {
      final List<String> words = split(' ');
      final capitalWords = words.map((word) {
        if (word.trim().isNotEmpty) {
          final String firstLetter = word.trim().substring(0, 1).toUpperCase();
          final String remainingLetters =
              word.trim().substring(1).toLowerCase();
          return '$firstLetter$remainingLetters';
        }
        return '';
      });
      return capitalWords.join(' ');
      // return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
    }
  }
}

// ignore: constant_identifier_names
enum InternetState { Connected, Disconnected }
