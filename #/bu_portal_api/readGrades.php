<?php
// required headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: access');
header('Access-Control-Allow-Methods: GET');
header('Content-Type: application/json');

// include database and object file
include_once 'database/config.php';
include_once 'objects/grades.php';

// get db connection
$database = new Database();
$db = $database->getConnection();

// prepare grades object
$grades = new Grades($db);

// set student_id with GET
$grades->student_id = isset($_GET['id']) ? $_GET['id'] : die();

// query grades
$stmt = $grades->read();

if ($stmt->rowCount() > 0) {
    // create array
    $grades_array = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $grade_item = array(
            // 'student_id' => $student_id,
            'academicterm_id' => $academicterm_id,
            'school_year' => $school_year,
            'semester' => $semester,
            // 'course_id' => $course_id,
            'course_code' => $course_code,
            'course_title' => $course_title,
            'final_grade' => $final_grade,
            // 'is_posted' => $is_posted,
        );
        array_push($grades_array, $grade_item);
    }

    http_response_code(200);
    echo json_encode($grades_array);
} else {
    http_response_code(404);
    echo json_encode(array('message' => 'Grades not found'));
}
