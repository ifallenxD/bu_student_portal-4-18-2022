<?php
class Course
{
    // Database connection and table name
    private $conn;
    private $table_name = 'course';

    // Object properties
    public $id;
    public $course_title;
    public $course_code;

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
                $this->course_title = $row['course_title'];
                $this->course_code = $row['course_code'];
            }
        } else {
            return false;
        }
    }

    public function readAll()
    {
        $query = '
        SELECT * 
        FROM ' . $this->table_name . ' 
        ORDER BY id ASC';

        $stmt = $this->conn->prepare($query);

        $stmt->execute();
        
        return $stmt;
    }
}