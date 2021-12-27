<?php
class ClassSchedule 
{
    // Database connection and table name
    private $conn;
    private $table_name = 'class_schedule';

    // Object properties
    public $course_title;
    public $course_code;
    public $employee_name;
    public $time;
    public $day;
    public $academic_term_id;

    // constructor with $db as db connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function read()
    {
        $query = "
        select array_agg(cs.time order by cs.id asc) as time, array_agg(cs.day order by cs.id asc) as day, lower(concat(e.employee_lname, ', ', e.employee_fname)) as employee_name, c.course_title, c.course_code, sl.academicterm_id 
		from public." . $this->table_name . " cs
		inner join employee e on e.id = cs.faculty_in_charge_id
		inner join course_schedule cs2 on cs2.id = cs.course_schedule_id
		inner join course c on c.id = cs2.course_id 
		inner join subject_list sl on sl.course_schedule_id = cs2.id
		where sl.student_id = :student_id
		group by e.employee_lname, e.employee_fname, c.course_code, c.course_title, sl.academicterm_id
		order by sl.academicterm_id, day
        ";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':student_id', $this->student_id);

        $stmt->execute();

        return $stmt;
    }

    public function convertDay($array)
    {
        $str_array = array();
        foreach ($array as $day)
        {
            switch($day)
            {
                case 1:
                    array_push($str_array, "Monday");
                    break;
                case 2:
                    array_push($str_array, "Tuesday");
                    break;
                case 3:
                    array_push($str_array, "Wednesday");
                    break;
                case 4:
                    array_push($str_array, "Thursday");
                    break;
                case 5:
                    array_push($str_array, "Friday");
                    break;
                case 6:
                    array_push($str_array, "Saturday");
                    break;
                case 7:
                    array_push($str_array, "Sunday");
                    break;
            }
        }
        return $str_array;     
    }
}