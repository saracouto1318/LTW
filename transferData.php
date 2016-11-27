<?php

function getAllRestaurants(){
    global $dbh, $result, $choice;

    $allFrom = $dbh->prepare("SELECT * FROM restaurants");
    $allFrom->execute();
    $result = $allFrom->fetchAll();
}

function getOwnedRestaurants(){
    global $dbh, $result;
    $restaurantsOwned = $dbh->prepare("SELECT * FROM restaurant WHERE idOwner = ?");
    $id = $_GET['id'];
    $restaurantsOwned->execute(array($id));
    $result = $restaurantsOwned->fetchAll();
}

// Database connection
$dbh = new PDO('sqlite:data.db');
$dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$function = $_GET["function"];
$choice = $_GET["choice"];
//exit();
switch ($function) {
    case "getAllRestaurants":
        getAllRestaurants();
        break;
    case 'getOwnedRestaurants':
        getOwnedRestaurants();
        break;
    default:
        die("Invalid function");
        break;
}

echo json_encode($result);
?>
