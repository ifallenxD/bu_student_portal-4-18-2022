<?php
class ClassSchedule 
{
    // Database connection and table name
    private $conn;
    private $table_name = 'public.class_schedule';

    // Object properties
    public $course_code;
    public $course_title;
    public $employee;
    public $room_code;
    public $day;
    public $start;
    public $end;
    public $academic_term_id;

    // constructor with $db as db connection
    public function __construct($db)
    {
        $this->conn = $db;
    }

    public function read()
    {
        $query = "
        select c.course_code, c.course_title, lower(concat(e.employee_lname,', ',e.employee_fname)) as employee, r.room_code, cs.\"day\", 
        case 
        when cs.start_time > 1200 
        then concat(overlay(LPAD((cs.start_time-1200)::text, 4, '0') placing ':' from 3 for 0)::text,' PM')
        else concat(overlay(LPAD((cs.start_time)::text, 4, '0') placing ':' from 3 for 0)::text, ' AM') 
        end 
        as start,
        case 
        when cs.end_time > 1200 
        then concat(overlay(LPAD((cs.end_time-1200)::text, 4, '0') placing ':' from 3 for 0)::text,' PM')
        else concat(overlay(LPAD((cs.end_time)::text, 4, '0') placing ':' from 3 for 0)::text, ' AM') 
        end 
        as end,
        sl.academicterm_id 
        from " . $this->table_name .  " cs
        inner join course_schedule csdl 
        on csdl.id = cs.course_schedule_id
        inner join subject_list sl
        on sl.course_schedule_id = csdl.id
        inner join course c 
        on c.id = csdl.course_id
        inner join employee e 
        on e.id = cs.faculty_in_charge_id
        inner join room r
        on r.id = cs.room_id
        where sl.student_id = :student_id
        and cs.active = 'T'
        order by sl.academicterm_id, cs.day, cs.start_time
        ";

        $stmt = $this->conn->prepare($query);

        $stmt->bindParam(':student_id', $this->student_id);

        $stmt->execute();

        return $stmt;
    }

    public function convertDay($day)
    {
        switch($day)
        {
            case 1:
                return "Sunday";
            case 2:
                return "Monday";
            case 3:
                return "Tuesday";
            case 4:
                return "Wednesday";
            case 5:
                return "Thursday";
            case 6:
                return "Friday";
            case 7:
                return "Saturday";
        }  
    }
    
    private function leftPadZeros($string)
    {
        $str = str_pad($string, 4, 0, STR_PAD_LEFT);
        return substr_replace($str, ':', 2, 0);
    }

    public function convertTime($times)
    {
        $time_array = array();
        foreach ($times as $time) {
            $time = explode("-", $time);

            $n1 = intval($time[0]);
            $n2 = intval($time[1]);

            if ($n1 < 1200) {
                $time[0] = $this->leftPadZeros($time[0]) . ' A.M.';
            } else if ($n1 == 1200) {
                $time[0] = $this->leftPadZeros($time[0]) . ' P.M.';
            } else {
                $n1 = $this->leftPadZeros(strval($n1 - 1200));
                $time[0] = $n1 . ' P.M.';
            }

            if ($n2 < 1200) {
                $time[1] = $this->leftPadZeros($time[1]) . ' A.M.';
            } else if ($n2 == 1200) {
                $time[1] = $this->leftPadZeros($time[1]) . ' P.M.';
            } else {
                $n2 = $this->leftPadZeros(strval($n2 - 1200));
                $time[1] = $n2. ' P.M.';
            }

            array_push($time_array, $time[0] . " - " . $time[1]);
        }

        return $time_array;
    }
}