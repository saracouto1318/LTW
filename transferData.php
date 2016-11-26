<?php

function getAll($dbh){
    $allFrom = $dbh->prepare("SELECT * FROM ?");
    $choice = $_GET['choice'];
    $allFrom->execute(array($choice));
    return $allFrom->fetchAll();
}

function getOwnedRestaurants($dbh, $id){
    $restaurantsOwned = $dbh->prepare("SELECT * FROM restaurant WHERE idOwner = ?");
    $id = $_GET['id'];
    $restaurantsOwned->execute(array($id));
    return $restaurantsOwned->fetchAll();
}

// Database connection
$dbh = new PDO('sqlite:database.sql');
$dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$function = $_GET['function'];

switch ($function) {
    case 'getAll':
        $result = getAll($dbh);
        break;
    case 'getOwnedRestaurants':
        $result = getOwnedRestaurants($dbh);
        break;
    default:
        die("Invalid function");
        break;
}

echo json_encode($return);

?>
