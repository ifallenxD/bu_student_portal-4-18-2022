<?php
class AcademicTerm 
{
    // Database connection and table name
    private $conn;
    // private $table_name = '';

    // Object properties
    public $academicterm_id;
    public $school_year;
    public $semester;

    // constructor with $db as db connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function read()
    {
        $query = "
        SELECT DISTINCT s.academicterm_id, r.school_year, r.semester
        FROM public.subject_list s
        LEFT JOIN ref_academic_term r
        ON s.academicterm_id = r.id
        WHERE s.student_id = :student_id
        AND s.is_posted = true
        ORDER BY s.academicterm_id ASC
        ";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':student_id', $this->student_id);

        $stmt->execute();

        return $stmt;
    }
}