<?php
// required headers
header('Access-Control-Allow-Origin: *');
header('Access-Control-Allow-Headers: access');
header('Access-Control-Allow-Methods: GET');
header('Content-Type: application/json');

// include database and object file
include_once 'database/config.php';
include_once 'objects/year_term.php';

// get db connection
$database = new Database();
$db = $database->getConnection();

// prepare academicterm object
$yearterm = new YearTerm($db);

$yearterm->student_id = isset($_GET['id']) ? $_GET['id'] : die();

$stmt = $yearterm->read();

if ($stmt->rowCount() > 0) {
    // create array
    $yearterm_array = array();

    while ($row = $stmt->fetch(PDO::FETCH_ASSOC)) {
        extract($row);
        $yearterm_item = array(
            'id' => $id,
			'year_level' => $year_level,
			'year_level_description' => $year_level_description,
			'year_term_description' => $year_term_description,
			'academicterm_id' => $academicterm_id,
        );
        array_push($yearterm_array, $yearterm_item);
    }

    http_response_code(200);
    echo json_encode($yearterm_array);
} else {
    http_response_code(404);
    echo json_encode(array('message' => 'Year and Terms not found'));
}
