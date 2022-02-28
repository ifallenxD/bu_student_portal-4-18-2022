import 'package:bu_portal_app/services/storage_service/storage_service.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorage extends StorageService {
  final _storage = const FlutterSecureStorage();

  static const _studentKey = 'student';
  static const _profileKey = 'profile';
  static const _academicTermsKey = 'academicterms';
  static const _gradesKey = 'grades';
  static const _schedulesKey = 'schedules';
  static const _yearTermsKey = 'yearterms';
  static const _lastUser = 'lastuser';

  @override
  Future setStudent(String student) async {
    await _storage.write(key: _studentKey, value: student);
  }

  @override
  Future setProfile(String profile) async {
    await _storage.write(key: _profileKey, value: profile);
  }

  @override
  Future setAcademicTerms(String academicterms) async {
    await _storage.write(key: _academicTermsKey, value: academicterms);
  }

  @override
  Future setGrades(String grades) async {
    await _storage.write(key: _gradesKey, value: grades);
  }

  @override
  Future setSchedules(String schedules) async {
    await _storage.write(key: _schedulesKey, value: schedules);
  }

  @override
  Future setYearTerms(String yearterms) async {
    await _storage.write(key: _yearTermsKey, value: yearterms);
  }

  @override
  Future setLastUser(String lastuser) async {
    await _storage.write(key: _lastUser, value: lastuser);
  }

  @override
  Future<String?> getStudent() async {
    return await _storage.read(key: _studentKey);
  }

  @override
  Future<String?> getProfile() async {
    return await _storage.read(key: _profileKey);
  }

  @override
  Future<String?> getAcademicTerms() async {
    return await _storage.read(key: _academicTermsKey);
  }

  @override
  Future<String?> getGrades() async {
    return await _storage.read(key: _gradesKey);
  }

  @override
  Future<String?> getSchedules() async {
    return await _storage.read(key: _schedulesKey);
  }

  @override
  Future<String?> getYearTerms() async {
    return await _storage.read(key: _yearTermsKey);
  }

  @override
  Future<String?> getLastUser() async {
    return await _storage.read(key: _lastUser);
  }

  @override
  Future clearStudent() async {
    await _storage.delete(key: _studentKey);
  }

  @override
  Future clearProfile() async {
    await _storage.delete(key: _profileKey);
  }

  @override
  Future clearAcademicTerms() async {
    await _storage.delete(key: _academicTermsKey);
  }

  @override
  Future clearGrades() async {
    await _storage.delete(key: _gradesKey);
  }

  @override
  Future clearSchedules() async {
    await _storage.delete(key: _schedulesKey);
  }

  @override
  Future clearYearTerms() async {
    await _storage.delete(key: _yearTermsKey);
  }

  @override
  Future clearLastUser() async {
    await _storage.delete(key: _lastUser);
  }

  @override
  Future clearStorage() async {
    await _storage.delete(key: _studentKey);
    await _storage.delete(key: _profileKey);
    await _storage.delete(key: _academicTermsKey);
    await _storage.delete(key: _gradesKey);
    await _storage.delete(key: _schedulesKey);
    await _storage.delete(key: _yearTermsKey);
  }
}
