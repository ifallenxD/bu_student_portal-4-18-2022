import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/models/grades_model.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:bu_portal_app/services/storage_service/storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ViewGradesPageManager {
  GradesList? gradesList;
  var academicTermList = ValueNotifier<AcademicTermList?>(null);

  final _storageService = getIt<StorageService>();

  int? studentId;

  Future initGradesList(int id) async {
    studentId = id;
    var internetState = await checkInternetConnection();
    if (internetState == InternetState.connected) {
      await _getGrades();
      await _getAcadTerms();
      if (academicTermList.value != null && gradesList != null) {
        setupGrades(academicTermList.value!, gradesList!);
        await _storageService.setGrades(jsonEncode(gradesList!.toJson()));
        await _storageService
            .setAcademicTerms(jsonEncode(academicTermList.value!.toJson()));
      }
    } else {
      gradesList = await _loadGrades();
      academicTermList.value = await _loadAcademicTerms();
      if (academicTermList.value != null && gradesList != null) {
        setupGrades(academicTermList.value!, gradesList!);
      }
    }
  }

  void setupGrades(AcademicTermList academicTermList, GradesList gradesList) {
    for (AcademicTerm atl in academicTermList.academicterms) {
      for (Grades g in gradesList.grades) {
        if (g.academicterm_id == atl.academicterm_id) {
          atl.grades.grades.add(g);
        }
      }
    }
  }

  Future<GradesList?> _loadGrades() async {
    final savedGradesList = await _storageService.getGrades();
    if (savedGradesList == null) return null;
    var parsed = jsonDecode(savedGradesList);
    return GradesList.fromJson(parsed);
  }

  Future<AcademicTermList?> _loadAcademicTerms() async {
    final savedAcademicTerms = await _storageService.getAcademicTerms();
    if (savedAcademicTerms == null) return null;
    var parsed = jsonDecode(savedAcademicTerms);
    return AcademicTermList.fromJson(parsed);
  }

  Future<void> _getAcadTerms() async {
    try {
      // var url = 'http://10.0.2.2/flutter_api/bu_portal2/readAcademicTerms.php';
      var url = BASE_URL + '/readAcademicTerms.php';
      var _get = '$url?id=$studentId';
      var response = await http.get(Uri.parse(_get), headers: {});

      // TODO: make if statement if academicterms not found
      var parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        academicTermList.value = AcademicTermList.fromJson(parsed);
      } else if (response.statusCode == 404) {
        academicTermList.value = null;
      }
    } on SocketException catch (e) {
      debugPrint('socketException: ' + e.message);
      // return errorSnackbar(context, 'Error: No internet connection');
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

  Future<void> _getGrades() async {
    try {
      // var url = 'http://10.0.2.2/flutter_api/bu_portal2/readGrades.php';
      var url = BASE_URL + '/readGrades.php';
      var _get = '$url?id=$studentId';
      var response = await http.get(Uri.parse(_get), headers: {});

      // TODO: make if statement if grades not found
      var parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        gradesList = GradesList.fromJson(parsed);
      } else if (response.statusCode == 404) {
        gradesList = null;
      }
    } on SocketException catch (e) {
      debugPrint('socketException: ' + e.message);
      // return errorSnackbar(context, 'Error: No internet connection');
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
}
