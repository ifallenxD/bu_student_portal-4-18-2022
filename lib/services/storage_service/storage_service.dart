abstract class StorageService {
  Future setStudent(String student);
  Future setProfile(String profile);
  Future setAcademicTerms(String academicterms);
  Future setGrades(String grades);
  Future setSchedules(String schedules);
  Future setYearTerms(String yearterms);
  Future<String?> getStudent();
  Future<String?> getProfile();
  Future<String?> getAcademicTerms();
  Future<String?> getGrades();
  Future<String?> getSchedules();
  Future<String?> getYearTerms();
  Future clearStudent();
  Future clearProfile();
  Future clearAcademicTerms();
  Future clearGrades();
  Future clearSchedules();
  Future clearStorage();
  Future clearYearTerms();
}