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

function getRestaurantInfo($dbh, $choice){
    $info = $dbh->prepare("SELECT * FROM restaurant
        JOIN restaurantCategory USING(idRestaurant)
        JOIN category USING(idCategory)
        JOIN location USING(idLocation)
        WHERE name = ?");
    $info->execute(array($choice));
    return $info->fetchAll();
}

function getOwnedRestaurants($dbh, $choice){
    $restaurantsOwned = $dbh->prepare("SELECT name, city, evaluation  FROM restaurant
        JOIN user USING(idUser)
        JOIN location USING(idLocation)
        WHERE user.email = ?");
    $restaurantsOwned->execute(array($choice));
    return $restaurantsOwned->fetchAll();
}

/**
 *  =================== Categories ============================
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

function getTop5($dbh){
    $choice = 5;
    $result = array();
    $eval = getTopRestaurants($dbh, $choice);
    $cat = getTopCategories($dbh, $choice);
    $result["evaluation"] = $eval;
    $result["categories"] = $cat;
    return $result;
}

function getAllFromUser($dbh, $choice){
    $restaurantsOwned = getOwnedRestaurants($dbh, $choice);
    return $restaurantsOwned;
}

/**
*                  Restaurant Info
*/
function getPhoneNumber($dbh){
    $allFrom = $dbh->prepare("SELECT contact FROM restaurant");
    $allFrom->execute();
    return $allFrom->fetchAll();
}
	
function getAVG($dbh){
    $allFrom = $dbh->prepare("SELECT priceAVG FROM restaurant");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getCategoriesRestaurant($dbh){
    $allFrom = $dbh->prepare("SELECT category FROM restaurant JOIN restaurantCategory USING(idCategory)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getHours($dbh){
    $allFrom = $dbh->prepare("SELECT day, initialHour, finalHour FROM restaurant JOIN restaurantHours USING(idHours)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getMenu($dbh){
    $allFrom = $dbh->prepare("SELECT detail FROM restaurant JOIN menu USING(idRestaurant)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getPhotos($dbh){
    $allFrom = $dbh->prepare("SELECT path FROM restaurant JOIN photo USING(idRestaurant)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getReviews($dbh){
    $allFrom = $dbh->prepare("SELECT comment, score FROM restaurant JOIN review USING(idRestaurant)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

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
    case "getRestaurantInfo":
        $result = getRestaurantInfo($dbh, $choice);
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
    case "getAllFromUser":
        $result = getAllFromUser($dbh, $choice);
        break;
    default:
        die("Invalid function");
        break;
}

echo json_encode($result);

 ?>
