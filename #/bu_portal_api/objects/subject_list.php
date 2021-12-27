<?php
class SubjectList
{
    // Database connection and table name
    private $conn;
    private $table_name = 'subject_list';

    // Object properties
    public $id;
    public $student_id;
    public $academicterm_id;
    public $final_grade;
    public $student_registration_id;
    public $course_id;
    public $is_posted;

    // constructor with $db as db connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function read()
    {
        // query
        $query = '
        SELECT *
        FROM ' . $this->table_name . '
        WHERE id = :id
        ';

        // prepare
        $stmt = $this->conn->prepare($query);

        // bind params
        $stmt->bindParam(':id', $this->id);

        // execute query
        if ($stmt->execute()) {
            // fetch retrieved row
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                // set values to object properties
                $this->id = $row['id'];
                $this->student_id = $row['student_id'];
                $this->academicterm_id = $row['academicterm_id'];
                $this->final_grade = $row['final_grade'];
                $this->student_registration_id = $row['student_registration_id'];
                $this->course_id = $row['course_id'];
                $this->is_posted = $row['is_posted'];
            }
            return $stmt;
        } else {
            return false;
        }
    }

}
