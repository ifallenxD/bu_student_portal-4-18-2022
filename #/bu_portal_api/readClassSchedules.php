<?php
// required headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: access');
header('Access-Control-Allow-Methods: GET');
header('Content-Type: application/json');

// include database and object file
include_once 'database/config.php';
include_once 'objects/class_schedule.php';

// get db connection
$database = new Database();
$db = $database->getConnection();

// prepare object
$sched = new ClassSchedule($db);

$sched->student_id = isset($_GET['id']) ? $_GET['id'] : die();

$stmt = $sched->read();

if ($stmt->rowCount() > 0) {
    // create array
    $sched_array = array();
	
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $sched_item = array(
            'course_code' => $course_code,
            'course_title' => $course_title,
            'employee' => $employee,
            'room_code' => $room_code,
            'day' => $sched->convertDay($day),
            'start' => $start,
            'end' => $end,
            'academicterm_id' => $academicterm_id
        );
        array_push($sched_array, $sched_item);
    }

    http_response_code(200);
    echo json_encode($sched_array);
} else {
    http_response_code(404);
    echo json_encode(array('message' => 'Class schedules not found.'));
}
