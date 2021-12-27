<?php
// required headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: access');
header('Access-Control-Allow-Methods: GET');
header('Content-Type: application/json');

// include database and object file
include_once 'database/config.php';
include_once 'objects/academic_term.php';

// get db connection
$database = new Database();
$db = $database->getConnection();

// prepare academicterm object
$acadterms = new AcademicTerm($db);

$acadterms->student_id = isset($_GET['id']) ? $_GET['id'] : die();

$stmt = $acadterms->read();

if ($stmt->rowCount() > 0) {
    // create array
    $acad_array = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $acad_item = array(
            'academicterm_id' => $academicterm_id,
            'school_year' => $school_year,
            'semester' => $semester,
        );
        array_push($acad_array, $acad_item);
    }

    http_response_code(200);
    echo json_encode($acad_array);
} else {
    http_response_code(404);
    echo json_encode(array('message' => 'Academic Term not found'));
}
