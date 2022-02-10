import 'dart:convert';
import 'package:bu_portal_app/models/student_model.dart';
import 'package:bu_portal_app/pages/home/home_page.dart';
import 'package:bu_portal_app/pages/login/login_page.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:bu_portal_app/services/storage_service/storage_service.dart';
import 'package:flutter/material.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  final _storageService = getIt<StorageService>();

  @override
  void initState() {
    super.initState();
    _init().then((student) => _loadStudent(student));
  }

  Future<Student?> _init() async {
    final savedStudent = await _storageService.getStudent();
    if (savedStudent == null) {
      await _storageService.clearStorage();
      return null;
    }
    var parsedJson = json.decode(savedStudent);
    return Student.fromJson(parsedJson);
  }

  void _loadStudent(Student? student) {
    if (student != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(
            student: student,
          ),
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const LoginPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
