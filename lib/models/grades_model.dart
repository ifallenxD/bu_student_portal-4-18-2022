class Grades {
  int academicterm_id;
  String school_year;
  String semester;
  String course_code;
  String course_title;
  String final_grade;

  Grades(this.academicterm_id, this.school_year, this.semester,
      this.course_code, this.course_title, this.final_grade);

  Grades.fromJson(Map<String, dynamic> json)
      : academicterm_id = json['academicterm_id'],
        school_year = json['school_year'],
        semester = json['semester'],
        course_code = json['course_code'] ?? 'n/a',
        course_title = json['course_title'] ?? 'n/a',
        final_grade = json['final_grade'];

  Map toJson() => {
        'academicterm_id': academicterm_id,
        'school_year': school_year,
        'semester': semester,
        'course_code': course_code,
        'course_title': course_title,
        'final_grade': final_grade,
      };
}

class GradesList {
  List<Grades> grades;

  GradesList(this.grades);

  int get length => grades.length;

  GradesList.fromJson(List<dynamic> json)
      : grades = json.map((e) => Grades.fromJson(e)).toList();

  List toJson() => grades;
}

class AcademicTerm {
  int academicterm_id;
  String school_year;
  String semester;
  GradesList grades = GradesList([]);

  AcademicTerm(this.academicterm_id, this.school_year, this.semester);

  AcademicTerm.fromJson(Map<String, dynamic> json)
      : academicterm_id = json['academicterm_id'],
        school_year = json['school_year'],
        semester = json['semester'];

  Map toJson() => {
        'academicterm_id': academicterm_id,
        'school_year': school_year,
        'semester': semester,
      };
}

class AcademicTermList {
  List<AcademicTerm> academicterms;

  AcademicTermList(this.academicterms);

  AcademicTermList.fromJson(List<dynamic> json)
      : academicterms = json.map((e) => AcademicTerm.fromJson(e)).toList();

  List toJson() => academicterms;
}
