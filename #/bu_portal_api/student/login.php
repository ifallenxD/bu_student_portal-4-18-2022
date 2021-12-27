<?php
// required headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Methods: POST');
header('Access-Control-Allow-Headers: Content-Type, Access-Control-Allow-Origin, Authorization, X-Requested-With');
header('Content-Type: application/json');

// include database and object file
include_once '../database/config.php';
include_once '../objects/student.php';

// get database connection
$database = new Database();
$db = $database->getConnection();

// retrieve posted data
$data = json_decode(file_get_contents('php://input'));

// prepare student object
$student = new Student($db);

// set username,password property of record to find
$student->stud_num = $data->stud_num;
$student->stud_password = $data->stud_password;

// login the student
$stmt = $student->login();

// check if there is a match
if ($stmt->rowCount() != 0) {
    // retrieve contents from result to an array
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $student_arr = array(
            'id' => $id,
            'stud_yearlevel' => $stud_yearlevel,
            'stud_degree' => $stud_degree,
            'dateofbirth' => $dateofbirth,
            'college_id' => $college_id,
            'stud_lname' => $stud_lname,
            'stud_fname' => $stud_fname,
            'stud_mname' => $stud_mname,
            'stud_mi' => $stud_mi,
            'stud_num' => $stud_num,
            'stud_password' => $stud_password,
            'stud_email' => $stud_email,
            'gender' => $gender,
            'stud_lrn' => $stud_lrn,
        );
    }

    // if success - response code 200 OK
    http_response_code(200);

    // return the student object
    echo json_encode($student_arr);
} else {
    // if failed - response code 401 Unauthorized
    http_response_code(401);

    // send a message to the app
    echo json_encode(array('message' => 'Invalid student number and/or password.'));
}
