<?php
class Grades
{
    // Database connection and table name
    private $conn;
    private $table_name = 'subject_list';

    // Object properties
    //public $student_id;
    public $academicterm_id;
    public $school_year;
    public $semester;
    //public $course_id;
    public $course_code;
    public $course_title;
    public $final_grade;
    //public $is_posted;

    // constructor with $db as db connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function read()
    {
        $query = "
        select s.academicterm_id, r.school_year, r.semester, c.course_code, c.course_title, s.final_grade, s.is_posted
        FROM public." . $this->table_name . " s
        LEFT JOIN course c
        ON s.course_id = c.id
        LEFT JOIN ref_academic_term r
        ON s.academicterm_id = r.id
        WHERE s.student_id = :student_id
        AND s.is_posted = true
        ";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':student_id', $this->student_id);

        $stmt->execute();

        return $stmt;
    }
}
