<?php
function getAllRestaurants(){
    global $dbh, $result, $choice;

    $allFrom = $dbh->prepare("SELECT * FROM restaurant");
    $allFrom->execute();
    $result = $allFrom->fetchAll();
}

function getTop5Restaurants(){
    global $dbh, $result;
    $restaurantsOwned = $dbh->prepare("SELECT * FROM restaurant ORDER BY evaluation DESC LIMIT 5");
    $restaurantsOwned->execute();
    $result = $restaurantsOwned->fetchAll();
}

// Database connection
$dbh = new PDO('sqlite:../data.db');
$dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$function = $_GET["function"];
switch ($function) {
    case "getAllRestaurants":
        getAllRestaurants();
        break;
    case 'getTop5Restaurants':
        getTop5Restaurants();
        break;
    default:
        die("Invalid function");
        break;
}

echo json_encode($result);

 ?>
