<?php
function getAllRestaurants(){
    global $dbh, $result, $choice;

    $allFrom = $dbh->prepare("SELECT * FROM restaurants JOIN location USING(idLocation)");
    $allFrom->execute();
    $result = $allFrom->fetchAll();
}

function getTopRestaurants(){
    global $dbh, $result, $choice;
    $choice = $_GET["choice"];
    $restaurantsOwned = $dbh->prepare("SELECT * FROM restaurant ORDER BY evaluation DESC LIMIT ?");
    $restaurantsOwned->execute(array($choice));
    $result = $restaurantsOwned->fetchAll();
}

function getRestaurants(){
    global $dbh, $result, $choice;
    $choice = $_GET["choice"];
    $restaurantsOwned = $dbh->query($choice);
    $result = $restaurantsOwned->fetchAll();
}

// function getOwnedRestaurants(){
//     global $dbh, $result, $choice;
//     $choice = $_GET["choice"];
//     $restaurantsOwned = $dbh->prepare("SELECT * FROM restaurant JOIN user on idUser WHERE idUser = ?");
//     $restaurantsOwned->execute(array($choice));
//     $result = $restaurantsOwned->fetchAll();
// }



// Database connection
$dbh = new PDO('sqlite:../data.db');
$dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$function = $_GET["function"];
switch ($function) {
    case "getAllRestaurants":
        getAllRestaurants();
        break;
    case 'getTopRestaurants':
        getTopRestaurants();
        break;
    case 'getRestaurants':
        getRestaurants();
        break;
    default:
        die("Invalid function");
        break;
}

echo json_encode($result);

 ?>
