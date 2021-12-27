<?php
// required headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: access');
header('Access-Control-Allow-Methods: GET');
header('Content-Type: application/json');

// include database and object file
include_once '../database/config.php';
include_once '../objects/course.php';

// get db connection
$database = new Database();
$db = $database->getConnection();

// prepare course object
$course = new Course($db);

// set ID property of record to read
$course->id = isset($_GET['id']) ? $_GET['id'] : die();

// read course details
if ($course->read()) {
    // create array
    $course_array = array(
        'id' => $course->id,
        'course_title' => $course->course_title,
        'course_code' => $course->course_code,
    );

    // set response code
    http_response_code(200); // OK

    echo json_encode($course_array);
} else {
    // set response code to 404 NOT FOUND
    http_response_code(404);

    echo json_encode(array('message' => 'Course not found.'));
}
