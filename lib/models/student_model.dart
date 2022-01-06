class Student {
  int id;
  // int stud_yearlevel;
  // int stud_degree;
  // String dateofbirth;
  // int college_id;
  String stud_lname;
  String stud_fname;
  // String stud_mname;
  // String stud_mi;
  // String stud_num;
  // String stud_password;
  // String stud_email;
  // String gender;
  // String stud_lrn;

  Student(
    this.id,
    // this.stud_yearlevel,
    // this.stud_degree,
    // this.dateofbirth,
    // this.college_id,
    this.stud_lname,
    this.stud_fname,
    // this.stud_mname,
    // this.stud_mi,
    // this.stud_num,
    // this.stud_password,
    // this.stud_email,
    // this.gender,
    // this.stud_lrn,
  );

  Student.fromJson(Map<String, dynamic> json)
      : id = json['student_id'],
        // stud_yearlevel = json['stud_yearlevel'],
        // stud_degree = json['stud_degree'] ?? 0,
        // dateofbirth = json['dateofbirth'],
        // college_id = json['college_id'] ?? 0,
        stud_lname = json['stud_lname'],
        stud_fname = json['stud_fname'];
  // stud_mname = json['stud_mname'],
  // stud_mi = json['stud_mi'],
  // stud_num = json['stud_num'],
  // stud_password = json['stud_password'],
  // stud_email = json['stud_email'],
  // gender = json['gender'],
  // stud_lrn = json['stud_lrn'];

  Map<String, dynamic> toJson() => {
        'student_id': id,
        // 'stud_yearlevel': stud_yearlevel,
        // 'stud_degree': stud_degree,
        // 'dateofbirth': dateofbirth,
        // 'college_id': college_id,
        'stud_lname': stud_lname,
        'stud_fname': stud_fname,
        // 'stud_mname': stud_mname,
        // 'stud_mi': stud_mi,
        // 'stud_num': stud_num,
        // 'stud_password': stud_password,
        // 'stud_email': stud_email,
        // 'gender': gender,
        // 'stud_lrn': stud_lrn,
      };
}
