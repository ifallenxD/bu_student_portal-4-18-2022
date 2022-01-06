<?php
class Student
{
    // Database connection and table name
    private $conn;
    private $table_name = 'public.student_userinfo';

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
    
    public function login()
    {
        $query = 'SELECT *
                  FROM public.student_userinfo
                  WHERE username = :username';

        $stmt = $this->conn->prepare($query);

        // $this->stud_num = htmlspecialchars(strip_tags($this->stud_num));
        // $this->stud_password = htmlspecialchars(strip_tags($this->stud_password));

        $stmt->bindParam(':username', $this->stud_num);
        // validate password
        if ($this->hashPassword()) {
            $stmt->execute();
            return $stmt;
        } else {
            $stmt = false;
            return 0;
        }
        
    }

    private function hashPassword()
    {
        $storedPassword = $this->getStoredPassword();

        if ($storedPassword) {
            $split = explode('$', $storedPassword);
            $digest_algo = explode(',', trim(str_replace('pbkdf2', '', $split[0]), '()'));
            $iterations = $digest_algo[0];
            $keylen = $digest_algo[1];
            $algo = $digest_algo[2];
            $salt = $split[1];
            $hash = $split[2];

            $hashedPassword = openssl_pbkdf2($this->stud_password, $salt, $keylen, $iterations, $algo);
            $hashedPassword = bin2hex($hashedPassword);

            return hash_equals($hash, $hashedPassword);
        }
        return false;
    }

    private function getStoredPassword()
    {
        $query = "
        SELECT password FROM " . $this->table_name . " 
        WHERE username = :username
        LIMIT 1
        ";

        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':username', $this->stud_num);
        $stmt->execute();

        if ($stmt->rowCount() != 0) {
            $result = $stmt->fetch(PDO::FETCH_ASSOC);
            return $result['password'];
        }
        return false;
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

}
