<?php
// required headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: access');
header('Access-Control-Allow-Methods: GET');
header('Content-Type: application/json');

// include database and object file
include_once '../database/config.php';
include_once '../objects/student.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// prepare student object
$student = new Student($db);

// set ID property of record to read
$student->id = isset($_GET['id']) ? $_GET['id'] : die();

// read the details of student
$student->read();

if ($student->stud_fname != null) {
    // create array
    $student_array = array(
        'id' => $student->id,
        'stud_yearlevel' => $student->stud_yearlevel,
        'stud_degree' => $student->stud_degree,
        'dateofbirth' => $student->dateofbirth,
        'college_id' => $student->college_id,
        'stud_lname' => $student->stud_lname,
        'stud_fname' => $student->stud_fname,
        'stud_mname' => $student->stud_mname,
        'stud_mi' => $student->stud_mi,
        'stud_num' => $student->stud_num,
        'stud_password' => $student->stud_password,
        'stud_email' => $student->stud_email,
        'gender' => $student->gender,
        'stud_lrn' => $student->stud_lrn,
    );

    // set response code
    http_response_code(200); // OK

    // encode to json format
    echo json_encode($student_array);
} else {
    // set response code to 404 for NOT FOUND
    http_response_code(404);

    // tell the user that record not found
    echo json_encode(array('message' => 'Student not found.'));
}
