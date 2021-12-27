<?php
class YearTerm 
{
    // Database connection and table name
    private $conn;
    private $table_name = "ref_year_term";

    // Object properties
    public $id;
	public $year_level;
	public $year_level_description;
	public $year_term_description;
	public $academicterm_id;

    // constructor with $db as db connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function read()
    {
        $query = "
        select distinct r.id, r.year_level, r.year_level_description, r.year_term_description, s.student_no, csr.academicterm_id 
		from public." . $this->table_name . " r
		inner join student_registration s
		on s.year_term_id = r.id
		inner join cor_student_registration csr
		on csr.stud_registration_number = s.registration_code
		where s.student_no = :student_id
		order by csr.academicterm_id desc
        ";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':student_id', $this->student_id);

        $stmt->execute();

        return $stmt;
    }
}
