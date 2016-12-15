<?php
function getAllCategories(){
    global $dbh, $result;

    $allFrom = $dbh->prepare("SELECT category FROM category");
    $allFrom->execute();
    $result = $allFrom->fetchAll();
}

function getTopCategories(){
    global $dbh, $result, $choice;
    $choice = $_GET["choice"];
    $restaurantsOwned = $dbh->prepare("SELECT COUNT(*) FROM categories JOIN restaurantCategory USING(idCategory) GROUP BY category DESC LIMIT ?");
    $restaurantsOwned->execute(array($choice));
    $result = $restaurantsOwned->fetchAll();
}

// Database connection
if( basename(getcwd()) == "databaseRequests" ) {
	session_start();
	$dbh = new PDO("sqlite:../Data_Base/data.db");
} else
	$dbh = new PDO("sqlite:Data_Base/data.db");
$dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

$function = $_GET["function"];
switch ($function) {
    case "getAllCategories":
        getAllCategories();
	echo json_encode($result);
        break;
    case 'getTopCategories':
        getTopCategories();
	echo json_encode($result);
        break;
    default:
        break;
}


 ?>
