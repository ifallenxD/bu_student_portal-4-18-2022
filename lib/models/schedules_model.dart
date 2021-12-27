class Schedule {
  String course_title;
  String course_code;
  String employee_name;
  List<dynamic> time;
  List<dynamic> day;
  int academicterm_id;

  Schedule(this.course_title, this.course_code, this.employee_name, this.time,
      this.day, this.academicterm_id);

  Schedule.fromJson(Map<String, dynamic> json)
      : course_title = json['course_title'],
        course_code = json['course_code'],
        employee_name = json['employee_name'],
        time = json['time'],
        day = json['day'],
        academicterm_id = json['academicterm_id'];

  Map toJson() => {
        'course_title': course_title,
        'course_code': course_code,
        'employee_name': employee_name,
        'time': time,
        'day': day,
        'academicterm_id': academicterm_id,
      };
}

class ScheduleList {
  List<Schedule> schedules;

  ScheduleList(this.schedules);

  int get length => schedules.length;

  ScheduleList.fromJson(List<dynamic> json)
      : schedules = json.map((e) => Schedule.fromJson(e)).toList();

  List toJson() => schedules;
}

class YearTerm {
  int id;
  int year_level;
  String year_level_description;
  String year_term_description;
  int academicterm_id;

  YearTerm(this.id, this.year_level, this.year_level_description,
      this.year_term_description, this.academicterm_id);

  YearTerm.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        year_level = json['year_level'],
        year_level_description = json['year_level_description'],
        year_term_description = json['year_term_description'],
        academicterm_id = json['academicterm_id'];

  Map toJson() => {
        'id': id,
        'year_level': year_level,
        'year_level_description': year_level_description,
        'year_term_description': year_term_description,
        'academicterm_id': academicterm_id,
      };
}

class YearTermList {
  List<YearTerm> yearterms;

  YearTermList(this.yearterms);

  int get length => yearterms.length;

  YearTermList.fromJson(List<dynamic> json)
      : yearterms = json.map((e) => YearTerm.fromJson(e)).toList();

  List toJson() => yearterms;
}
