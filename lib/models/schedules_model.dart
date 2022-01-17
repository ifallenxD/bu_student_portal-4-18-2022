class Schedule {
  String course_code;
  String course_title;
  String employee;
  String room_code;
  String day;
  String start;
  String end;
  int academicterm_id;
  List<String>? time;

  Schedule(this.course_code, this.course_title, this.employee, this.room_code,
      this.day, this.start, this.end, this.academicterm_id);

  String get time2 => start + ' - ' + end;

  Schedule.fromJson(Map<String, dynamic> json)
      : course_code = json['course_code'],
        course_title = json['course_title'],
        employee = json['employee'],
        room_code = json['room_code'],
        day = json['day'],
        start = json['start'],
        end = json['end'],
        academicterm_id = json['academicterm_id'];

  Map toJson() => {
        'course_code': course_code,
        'course_title': course_title,
        'employee': employee,
        'room_code': room_code,
        'day': day,
        'start': start,
        'end': end,
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

class ScheduleCard {
  String? course_code;
  List<String>? day;
  int? academicterm_id;
  List<Schedule> schedules = [];
  
  ScheduleCard();
}

class ScheduleCardList {
  List<ScheduleCard> scheduleCards;

  ScheduleCardList(this.scheduleCards);

  int get length => scheduleCards.length;
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
