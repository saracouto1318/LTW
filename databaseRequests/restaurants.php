<?php

/**
 *  ================= Restaurants ========================
 */
function getAllRestaurants($dbh){

    $allFrom = $dbh->prepare("SELECT * FROM restaurant JOIN location USING(idLocation)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getTopRestaurants($dbh, $choice){
    $restaurantsOwned = $dbh->prepare("SELECT * FROM restaurant ORDER BY evaluation DESC LIMIT ?");
    $restaurantsOwned->execute(array($choice));
    return $restaurantsOwned->fetchAll();
}

function getRestaurants($dbh, $choice){
    $restaurantsOwned = $dbh->query($choice);
    return $restaurantsOwned->fetchAll();
}

/**
 *  =================== Catgories ============================
 */
function getAllCategories($dbh){

    $allFrom = $dbh->prepare("SELECT category FROM category");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getTopCategories($dbh, $choice){
    $restaurantsOwned = $dbh->prepare("SELECT category,COUNT(*) FROM category JOIN restaurantCategory USING(idCategory) GROUP BY category ORDER BY COUNT(*) DESC LIMIT ?");
    $restaurantsOwned->execute(array($choice));
    return $restaurantsOwned->fetchAll();
}




/**
 *  ==================== Overall ===============================
 */

function getTop5($dbh)
{
    $choice = 5;
    $result = array();
    $eval = getTopRestaurants($dbh, $choice);
    $cat = getTopCategories($dbh, $choice);
    $result["evaluation"] = $eval;
    $result["categories"] = $cat;
    return $result;
}

// function getOwnedRestaurants(){
//     global $dbh, $result, $choice;
//     $choice = $_GET["choice"];
//     $restaurantsOwned = $dbh->prepare("SELECT * FROM restaurant JOIN user on idUser WHERE idUser = ?");
//     $restaurantsOwned->execute(array($choice));
//     $result = $restaurantsOwned->fetchAll();
// }



// Database connection
$dbh = new PDO("sqlite:../data.db");
$dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if(!isset($_GET["function"]))
    die("Invalid operation");
if(isset($_GET["choice"]))
    $choice = $_GET["choice"];
$function = $_GET["function"];
switch ($function) {
    case "getAllRestaurants":
        $result = getAllRestaurants($dbh);
        break;
    case "getTopRestaurants":
        $result = getTopRestaurants($dbh, $choice);
        break;
    case "getRestaurants":
        $result = getRestaurants($dbh, $choice);
        break;
    case "getAllCategories":
        $result = getAllCategories($dbh);
        break;
    case "getTopCategories":
        $result = getTopCategories($dbh, $choice);
        break;
    case "getTop5":
        $result = getTop5($dbh);
        break;
    default:
        die("Invalid function");
        break;
}

echo json_encode($result);

 ?>
