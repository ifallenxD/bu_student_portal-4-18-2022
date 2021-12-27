<?php
// required headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: access');
header('Access-Control-Allow-Methods: GET');
header('Content-Type: application/json');

// include database and object file
include_once 'database/config.php';
include_once 'objects/student_profile.php';

// get db connection
$database = new Database();
$db = $database->getConnection();

// prepare object
$studp = new StudentProfile($db);

$studp->student_id = isset($_GET['id']) ? $_GET['id'] : die();

$stmt = $studp->read();

if ($stmt->rowCount() > 0) {
    
    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $studp_array = array(
            'id' => $id,
            'stud_num' => $stud_num,
            'stud_lname' => $stud_lname,
            'stud_fname' => $stud_fname,
            'stud_mname' => $stud_mname,
            'dateofbirth' => $dateofbirth,
            'gender' => $gender,
            'studp_nationality' => $studp_nationality,
            'studp_alternate_email_address' => $studp_alternate_email_address,
            'studp_mobile_no' => $studp_mobile_no,
            'studp_place_of_birth' => $studp_place_of_birth,
            'studp_current_houseno_street' => $studp_current_houseno_street,
            'studp_current_barangay' => $studp_current_barangay,
            'studp_current_town_city' => $studp_current_town_city,
            'studp_current_zipcode' => $studp_current_zipcode,
            'studp_current_province' => $studp_current_province,
            'studp_father_name' => $studp_father_name,
            'studp_father_occupation' => $studp_father_occupation,
            'studp_father_mobile_no' => $studp_father_mobile_no,
            'studp_mother_name' => $studp_mother_name,
            'studp_mother_occupation' => $studp_mother_occupation,
            'studp_mother_mobile_no' => $studp_mother_mobile_no,
        );
    }

    // if success - response code 200 OK
    http_response_code(200);

    // return the student object
    echo json_encode($studp_array);
} else {
    // if failed - response code 401 not found
    http_response_code(404);

    // send a message to the app
    echo json_encode(array('message' => 'Student profile not found.'));
}
