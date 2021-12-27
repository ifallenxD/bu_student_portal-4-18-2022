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

// query courses
$stmt = $course->readAll();
$num = $stmt->rowCount();

// check if more than 0 record found
if ($num > 0) {
    // courses array
    $courses_array = array();
    $courses_array['courses'] = array();

    // retrieve table contents
    // fetch() is faster than fetchAll()
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        // make $row['name'] to $name with extract()
        extract($row);

        $course_item = array(
            'id' => $id,
            'course_title' => $course_title,
            'course_code' => $course_code
        );

        array_push($courses_array['courses'], $course_item);
    }

    http_response_code(200); // OK
    echo json_encode($courses_array);
} else {
    http_response_code(404); // NOT FOUND
    echo json_encode(array('message' => 'No courses found.'));
}