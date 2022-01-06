import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/models/student_profile_model.dart';
import 'package:bu_portal_app/pages/login/widgets/snackbar.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:bu_portal_app/services/storage_service/storage_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class ViewProfilePageManager {
  var studentProfile = ValueNotifier<StudentProfile?>(null);

  final _storageService = getIt<StorageService>();

  int? studentId;

  Future initialize(int id) async {
    studentId = id;
    var internetState = await checkInternetConnection();
    if (internetState == InternetState.connected) {
      await _getStudentInfo();
      if (studentProfile.value != null) {
        await _storageService
            .setProfile(jsonEncode(studentProfile.value!.toJson()));
      }
    } else {
      await _loadProfile();
    }
  }

  Future<void> _loadProfile() async {
    final savedProfile = await _storageService.getProfile();
    if (savedProfile == null) {
      studentProfile.value = null;
    } else {
      var parsed = jsonDecode(savedProfile);
      studentProfile.value = StudentProfile.fromJson(parsed);
    }
  }

  Future<void> _getStudentInfo() async {
    try {
      // var url = 'http://10.0.2.2/flutter_api/bu_portal2/readStudentProfile.php';
      var url = BASE_URL + '/readStudentProfile.php';
      var _get = '$url?id=$studentId';
      var response = await http.get(Uri.parse(_get), headers: {});

      // TODO: make if statement
      var parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        studentProfile.value = StudentProfile.fromJson(parsed);
      } else if (response.statusCode == 404) {
        studentProfile.value = null;
      }
    } on SocketException catch (e) {
      debugPrint('socketException: ' + e.message);
      errorSnackbar(null, 'Error: No internet connection');
    } on HttpException catch (e) {
      debugPrint('httpException: ' + e.message);
      // return errorSnackbar(context, 'Error: Something went wrong');
    } on FormatException catch (e) {
      debugPrint('formatException: ' + e.toString());
      // return errorSnackbar(context, 'Error: Something went wrong');
    } on TimeoutException catch (e) {
      debugPrint('timeoutException: ' + e.message!);
      // return errorSnackbar(context, 'Error: Server took too long to respond');
    }
  }

  StudentProfile get sp => studentProfile.value!;

  String get studentNumber => sp.stud_num;
  String get fullname =>
      sp.stud_fname +
      ' ' +
      // sp.stud_mname.substring(0, 1) +
      '. ' +
      sp.stud_lname;
  String get dateOfBirth {
    if (sp.dateofbirth != 'n/a') {
      return DateFormat.yMMMMd().format(DateTime.parse(sp.dateofbirth));
    }
    return sp.dateofbirth;
  }

  String get gender => sp.gender;
  String get nationality => sp.studp_nationality;
  String get altEmail => sp.studp_alternate_email_address;
  String get mobileNo => sp.studp_mobile_no;
  String get placeOfBirth => sp.studp_place_of_birth;
  String get address =>
      sp.studp_current_houseno_street + ', ' + sp.studp_current_barangay;
  String get city => sp.studp_current_town_city;
  String get zipcode => sp.studp_current_zipcode;
  String get province => sp.studp_current_province;
  String get cityProvince =>
      sp.studp_current_town_city + ', ' + sp.studp_current_province;
  String get fatherName => sp.studp_father_name;
  String get fatherMobileNo => sp.studp_father_mobile_no;
  String get fatherOccupation => sp.studp_father_occupation;
  String get motherName => sp.studp_mother_name;
  String get motherMobileNo => sp.studp_mother_mobile_no;
  String get motherOccupation => sp.studp_mother_occupation;
}
