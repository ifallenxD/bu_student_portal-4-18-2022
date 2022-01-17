import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:bu_portal_app/globals.dart';
import 'package:bu_portal_app/models/schedules_model.dart';
import 'package:bu_portal_app/services/service_locator.dart';
import 'package:bu_portal_app/services/storage_service/storage_service.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class ViewSchedulesPageManager {
  var scheduleList = ValueNotifier<ScheduleList?>(null);
  var yearTermList = ValueNotifier<YearTermList?>(null);
  var schedCardList = ValueNotifier<ScheduleCardList?>(null);

  final _storageService = getIt<StorageService>();

  int? studentId;

  Future initialize(int id) async {
    studentId = id;
    var internetState = await checkInternetConnection();
    if (internetState == InternetState.connected) {
      await _getYearTerms();
      await _getSchedules();
      if (scheduleList.value != null && yearTermList.value != null) {
        setupSchedules(yearTermList.value!, scheduleList.value!);
        await _storageService
            .setSchedules(jsonEncode(scheduleList.value!.toJson()));
        await _storageService
            .setYearTerms(jsonEncode(yearTermList.value!.toJson()));
      }
    } else {
      scheduleList.value = await _loadSchedules();
      yearTermList.value = await _loadYearTerms();
    }
  }

  Future<ScheduleList?> _loadSchedules() async {
    final savedSchedules = await _storageService.getSchedules();
    if (savedSchedules == null) return null;
    var parsed = jsonDecode(savedSchedules);
    return ScheduleList.fromJson(parsed);
  }

  Future<YearTermList?> _loadYearTerms() async {
    final savedYearTerms = await _storageService.getYearTerms();
    if (savedYearTerms == null) return null;
    var parsed = jsonDecode(savedYearTerms);
    return YearTermList.fromJson(parsed);
  }

  void setupSchedules(YearTermList ytl, ScheduleList sl) {
    // setup weeks
    schedCardList.value = ScheduleCardList([]);
    var scl = schedCardList.value!.scheduleCards;

    start:
    for (Schedule s in sl.schedules) {
      var sc = ScheduleCard();
      if (scl.isNotEmpty) {
        for (ScheduleCard scw in scl) {
          if (s.course_code == scw.course_code) {
            scw.schedules.add(s);
            continue start;
          }
        }
        sc.course_code = s.course_code;
        sc.academicterm_id = s.academicterm_id;
        sc.schedules.add(s);
        scl.add(sc);
      } else {
        sc.course_code = s.course_code;
        sc.academicterm_id = s.academicterm_id;
        sc.schedules.add(s);
        scl.add(sc);
      }
    }
  }

  Future<void> _getYearTerms() async {
    try {
      // var url = 'http://10.0.2.2/flutter_api/bu_portal2/readYearTerms.php';
      var url = BASE_URL + '/readYearTerms.php';
      var _get = '$url?id=$studentId';
      var response = await http.get(Uri.parse(_get), headers: {});

      // TODO: make if statement
      var parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        yearTermList.value = YearTermList.fromJson(parsed);
      } else if (response.statusCode == 404) {
        yearTermList.value = null;
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

  Future<void> _getSchedules() async {
    try {
      // var url = 'http://10.0.2.2/flutter_api/bu_portal2/readClassSchedules.php';
      var url = BASE_URL + '/readClassSchedules.php';
      var _get = '$url?id=$studentId';
      var response = await http.get(Uri.parse(_get), headers: {});

      // TODO: make if statement
      var parsed = jsonDecode(response.body);

      if (response.statusCode == 200) {
        scheduleList.value = ScheduleList.fromJson(parsed);
      } else if (response.statusCode == 404) {
        scheduleList.value = null;
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
