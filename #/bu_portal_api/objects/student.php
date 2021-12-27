<?php
class Student
{
    // Database connection and table name
    private $conn;
    private $table_name = 'student';

    // Object properties
    public $id;
    public $stud_yearlevel;
    public $stud_degree;
    public $dateofbirth;
    public $college_id;
    public $stud_lname;
    public $stud_fname;
    public $stud_mname;
    public $stud_mi;
    public $stud_num;
    public $stud_password;
    public $stud_email;
    public $gender;
    public $stud_lrn;

    // constructor with $db as database connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function read()
    {
        // select query
        $query = '
        SELECT *
        FROM ' . $this->table_name . '
        WHERE id = :id
        ';

        // prepare query statement
        $stmt = $this->conn->prepare($query);

        // bind parameters
        $stmt->bindParam(':id', $this->id);

        // execute query
        if ($stmt->execute()) {
            // fetch retrieved row
            while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
                // set values to object properties
                $this->id = $row['id'];
                $this->stud_yearlevel = $row['stud_yearlevel'];
                $this->stud_degree = $row['stud_degree'];
                $this->dateofbirth = $row['dateofbirth'];
                $this->college_id = $row['college_id'];
                $this->stud_lname = $row['stud_lname'];
                $this->stud_fname = $row['stud_fname'];
                $this->stud_mname = $row['stud_mname'];
                $this->stud_mi = $row['stud_mi'];
                $this->stud_num = $row['stud_num'];
                $this->stud_password = $row['stud_password'];
                $this->stud_email = $row['stud_email'];
                $this->gender = $row['gender'];
                $this->stud_lrn = $row['stud_lrn'];
            }
        } else {
            return false;
        }
    }

    public function login()
    {
        $query = 'SELECT *
                  FROM public.student
                  WHERE stud_num = :username
                  AND stud_password = :password';

        $stmt = $this->conn->prepare($query);

        // $this->stud_num = htmlspecialchars(strip_tags($this->stud_num));
        // $this->stud_password = htmlspecialchars(strip_tags($this->stud_password));

        $stmt->bindParam(':username', $this->stud_num);
        $stmt->bindParam(':password', $this->stud_password);

        $stmt->execute();

        return $stmt;
    }

}
