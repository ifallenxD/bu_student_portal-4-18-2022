import 'dart:io';
import 'package:bu_portal_app/pages/home/home_page_controller.dart';
import 'package:bu_portal_app/pages/view_grades/view_grades_page_controller.dart';
import 'package:bu_portal_app/pages/view_profile/view_profile_page_controller.dart';
import 'package:bu_portal_app/pages/view_schedules/view_schedules_page_controller.dart';
import 'package:bu_portal_app/services/storage_service/secure_storage_service.dart';
import 'package:bu_portal_app/services/storage_service/storage_service.dart';
import 'package:get_it/get_it.dart';
import 'package:bu_portal_app/pages/login/login_page_controller.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  // state management layer
  getIt.registerLazySingleton<LoginPageManager>(() => LoginPageManager());
  getIt.registerLazySingleton<HomePageManager>(() => HomePageManager());
  getIt.registerLazySingleton<ViewProfilePageManager>(() => ViewProfilePageManager());
  getIt.registerLazySingleton<ViewGradesPageManager>(() => ViewGradesPageManager());
  getIt.registerLazySingleton<ViewSchedulesPageManager>(() => ViewSchedulesPageManager());

  // service layer
  getIt.registerLazySingleton<StorageService>(() => SecureStorage());
}

void clearGetIt() {
  getIt.resetLazySingleton<LoginPageManager>();
  getIt.resetLazySingleton<HomePageManager>();
  getIt.resetLazySingleton<ViewProfilePageManager>();
  getIt.resetLazySingleton<ViewGradesPageManager>();
  getIt.resetLazySingleton<ViewSchedulesPageManager>();
  getIt.resetLazySingleton<StorageService>();  
}

Future<InternetState> checkInternetConnection() async {
    try {
      final result = await InternetAddress.lookup('example.com');
      if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
        return InternetState.connected;
      }
    } on SocketException {
      // debugPrint('Not connected to the internet.\nMore info: ${e.message}');
      return InternetState.disconnected;
    }
    return InternetState.disconnected;
  }

enum InternetState { connected, disconnected }
