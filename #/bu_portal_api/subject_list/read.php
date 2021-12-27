<?php
// required headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: access');
header('Access-Control-Allow-Methods: GET');
header('Content-Type: application/json');

// include database and object file
include_once '../database/config.php';
include_once '../objects/subject_list.php';

// get db connection
$database = new Database();
$db = $database->getConnection();

// prepare subject_list object
$subject_list = new SubjectList($db);

// set ID property of record to read
$subject_list->id = isset($_GET['id']) ? $_GET['id'] : die();

// read subject_list details
if ($subject_list->read()) {
    // create array
    $subject_list_array = array(
        'id' => $subject_list->id,
        'student_id' => $subject_list->student_id,
        'academicterm_id' => $subject_list->academicterm_id,
        'final_grade' => $subject_list->final_grade,
        'student_registration_id' => $subject_list->student_registration_id,
        'course_id' => $subject_list->course_id,
        'is_posted' => $subject_list->is_posted
    );

    // set response code
    http_response_code(200); // OK

    echo json_encode($subject_list_array);
} else {
    // set response code to 404 NOT FOUND
    http_response_code(404);

    echo json_encode(array('message' => 'Subject List not found.'));
}