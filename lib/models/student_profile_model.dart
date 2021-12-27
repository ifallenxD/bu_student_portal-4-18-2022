class StudentProfile {
  int id;
  String stud_num;
  String stud_lname;
  String stud_fname;
  String stud_mname;
  String dateofbirth;
  String gender;
  String studp_nationality;
  String studp_alternate_email_address;
  String studp_mobile_no;
  String studp_place_of_birth;
  String studp_current_houseno_street;
  String studp_current_barangay;
  String studp_current_town_city;
  String studp_current_zipcode;
  String studp_current_province;
  String studp_father_name;
  String studp_father_occupation;
  String studp_father_mobile_no;
  String studp_mother_name;
  String studp_mother_occupation;
  String studp_mother_mobile_no;

  StudentProfile(
    this.id,
    this.stud_num,
    this.stud_lname,
    this.stud_fname,
    this.stud_mname,
    this.dateofbirth,
    this.gender,
    this.studp_nationality,
    this.studp_alternate_email_address,
    this.studp_mobile_no,
    this.studp_place_of_birth,
    this.studp_current_houseno_street,
    this.studp_current_barangay,
    this.studp_current_town_city,
    this.studp_current_zipcode,
    this.studp_current_province,
    this.studp_father_name,
    this.studp_father_occupation,
    this.studp_father_mobile_no,
    this.studp_mother_name,
    this.studp_mother_occupation,
    this.studp_mother_mobile_no,
  );

  StudentProfile.empty()
      : id = -1,
        stud_num = '',
        stud_lname = '',
        stud_fname = '',
        stud_mname = '',
        dateofbirth = '',
        gender = '',
        studp_nationality = '',
        studp_alternate_email_address = '',
        studp_mobile_no = '',
        studp_place_of_birth = '',
        studp_current_houseno_street = '',
        studp_current_barangay = '',
        studp_current_town_city = '',
        studp_current_zipcode = '',
        studp_current_province = '',
        studp_father_name = '',
        studp_father_occupation = '',
        studp_father_mobile_no = '',
        studp_mother_name = '',
        studp_mother_occupation = '',
        studp_mother_mobile_no = '';

  StudentProfile.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        stud_num = json['stud_num'],
        stud_lname = json['stud_lname'],
        stud_fname = json['stud_fname'],
        stud_mname = json['stud_mname'],
        dateofbirth = json['dateofbirth'],
        gender = json['gender'],
        studp_nationality = json['studp_nationality'],
        studp_alternate_email_address = json['studp_alternate_email_address'],
        studp_mobile_no = json['studp_mobile_no'],
        studp_place_of_birth = json['studp_place_of_birth'],
        studp_current_houseno_street = json['studp_current_houseno_street'],
        studp_current_barangay = json['studp_current_barangay'],
        studp_current_town_city = json['studp_current_town_city'],
        studp_current_zipcode = json['studp_current_zipcode'],
        studp_current_province = json['studp_current_province'],
        studp_father_name = json['studp_father_name'] ?? 'n/a',
        studp_father_occupation = json['studp_father_occupation'] ?? 'n/a',
        studp_father_mobile_no = json['studp_father_mobile_no'] ?? 'n/a',
        studp_mother_name = json['studp_mother_name'] ?? 'n/a',
        studp_mother_occupation = json['studp_mother_occupation'] ?? 'n/a',
        studp_mother_mobile_no = json['studp_mother_mobile_no'] ?? 'n/a';

  Map<String, dynamic> toJson() => {
        'id': id,
        'stud_num': stud_num,
        'stud_lname': stud_lname,
        'stud_fname': stud_fname,
        'stud_mname': stud_mname,
        'dateofbirth': dateofbirth,
        'gender': gender,
        'studp_nationality': studp_nationality,
        'studp_alternate_email_address': studp_alternate_email_address,
        'studp_mobile_no': studp_mobile_no,
        'studp_place_of_birth': studp_place_of_birth,
        'studp_current_houseno_street': studp_current_houseno_street,
        'studp_current_barangay': studp_current_barangay,
        'studp_current_town_city': studp_current_town_city,
        'studp_current_zipcode': studp_current_zipcode,
        'studp_current_province': studp_current_province,
        'studp_father_name': studp_father_name,
        'studp_father_occupation': studp_father_occupation,
        'studp_father_mobile_no': studp_father_mobile_no,
        'studp_mother_name': studp_mother_name,
        'studp_mother_occupation': studp_mother_occupation,
        'studp_mother_mobile_no': studp_mother_mobile_no,
      };
}
