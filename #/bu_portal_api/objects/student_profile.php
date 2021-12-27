<?php
class StudentProfile
{
    // Database connection and table name
    private $conn;
    private $table_name = array('student', 'student_profile');
    

    // Object properties
    private $id, $stud_num, $stud_lname, $stud_fname, $stud_mname, $dateofbirth, $gender;
    private $studp_nationality, $studp_alternate_email_address, $studp_mobile_no, $studp_place_of_birth;
    private $studp_current_houseno_street, $studp_current_barangay, $studp_current_town_city, $studp_current_zipcode, $studp_current_province;
    private $studp_father_name, $studp_father_occupation, $studp_father_mobile_no;
    private $studp_mother_name, $studp_mother_occupation, $studp_mother_mobile_no;

    // constructor with $db as db connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function read()
    {
        $query = "
        select s.id, s.stud_num, s.stud_lname, s.stud_fname, s.stud_mname, s.dateofbirth, s.gender, sp.studp_nationality, sp.studp_alternate_email_address, sp.studp_mobile_no, sp.studp_place_of_birth, 
        sp.studp_current_houseno_street, sp.studp_current_barangay, sp.studp_current_town_city, sp.studp_current_zipcode, sp.studp_current_province,
        sp.studp_father_name, sp.studp_father_occupation, sp.studp_father_mobile_no,
        sp.studp_mother_name, sp.studp_mother_occupation, sp.studp_mother_mobile_no
        from public." . $this->table_name[0] . " s
        inner join public." . $this->table_name[1] . " sp
        on sp.student_id = s.id
        where s.id = :student_id
        ";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':student_id', $this->student_id);

        $stmt->execute();

        return $stmt;
    }
}