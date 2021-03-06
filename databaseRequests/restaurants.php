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
        WHERE name = ? LIMIT 1");
    $info->execute(array($choice));
    return $info->fetch();
}

function getRestaurantCategories($dbh, $email){
    $info = $dbh->prepare("SELECT category FROM category
				JOIN restaurantCategory USING(idCategory)
				WHERE email = ?");
    $info->execute(array($email));
    return $info->fetchAll();
}

function getRestaurantMenu($dbh, $email){
    $info = $dbh->prepare("SELECT * FROM menu
				WHERE email = ?");
    $info->execute(array($email));
    return $info->fetchAll();
}

function getRestaurantHours($dbh, $email){
    $info = $dbh->prepare("SELECT * FROM hours
				JOIN restaurantHours USING(idHours)
				WHERE email = ?");
    $info->execute(array($email));
    return $info->fetchAll();
}

function getRestaurantPhotos($dbh, $email){
    $info = $dbh->prepare("SELECT path FROM photos
				WHERE email = ?");
    $info->execute(array($email));
    return $info->fetchAll();
}

function getRestaurantReviews($dbh, $email){
    $info = $dbh->prepare("SELECT * FROM review
				WHERE emailRestaurant = ?");
    $info->execute(array($email));
    return $info->fetchAll();
}

function getReviewReplys($dbh, $idReview){
    $info = $dbh->prepare("SELECT * FROM reply
				WHERE idReview = ?");
    $info->execute(array($idReview));
    return $info->fetchAll();
}

function getReviewUser($dbh, $email){
    $info = $dbh->prepare("SELECT * FROM user
				WHERE email = ? LIMIT 1");
    $info->execute(array($email));
    return $info->fetch();
}

function getOwnedRestaurants($dbh, $choice){
    $restaurantsOwned = $dbh->prepare("SELECT name, city, evaluation  FROM restaurant
        JOIN user ON (user.email=restaurant.emailOwner)
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

function getTopCategories($dbh, $choice) {
    $topCategories = $dbh->prepare("SELECT category,COUNT(*) FROM category JOIN restaurantCategory USING(idCategory) GROUP BY category ORDER BY COUNT(*) DESC LIMIT ?");
    $topCategories->execute(array($choice));
    return $topCategories->fetchAll();
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
    $allFrom = $dbh->prepare("SELECT category FROM restaurant JOIN restaurantCategory USING(email)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getHours($dbh){
    $allFrom = $dbh->prepare("SELECT day, initialHour, finalHour FROM restaurant JOIN restaurantHours USING(idHours)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getMenu($dbh){
    $allFrom = $dbh->prepare("SELECT detail FROM restaurant JOIN menu USING(email)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getPhotos($dbh){
    $allFrom = $dbh->prepare("SELECT path FROM restaurant JOIN photo USING(email)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

function getReviews($dbh){
    $allFrom = $dbh->prepare("SELECT comment, score FROM restaurant JOIN review USING(email)");
    $allFrom->execute();
    return $allFrom->fetchAll();
}

/**
 *  ================= Reviews ========================
 */
function insertReviews($dbh, $score, $comment, $emailRestaurant) {

	$emailReviewer = $_SESSION["email"];

	$stmt = $dbh->prepare('INSERT INTO review (score, comment, emailReviewer, emailRestaurant) VALUES (?, ?, ?, ?)');
	$stmt->execute(array($score, $comment, $emailReviewer, $emailRestaurant));

	return getReviewUser($dbh, $emailReviewer);
}

function insertReply($comment, $idReview) {
	require_once('connection.php');
	$answer = array();

	$emailOwner = $_SESSION(['email']);

	$stmt = $dbh->prepare('INSERT INTO Reply (comment, emailOwner, idReview) VALUES (?, ?, ?)');
	$stmt->execute(array($comment, $emailOwner, $idReview));

	$answer['emailOwner'] = $emailOwner;
	return $answer;
}

// Database connection
if( basename(getcwd()) == "databaseRequests" ) {
	session_start();
	$dbh = new PDO("sqlite:../Data_Base/data.db");
} else
	$dbh = new PDO("sqlite:Data_Base/data.db");
$dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
$dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

if(isset($_GET["choice"]))
    $choice = $_GET["choice"];
if(isset($_GET["function"])) {
	$function = $_GET["function"];
}
else
	$function = "";

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
    case 'insertReviews':
    	$score = $_GET['score'];
    	$comment = $_GET['comment'];
    	$emailRestaurant = $_GET['emailRestaurant'];
    	$result = insertReviews($dbh, $score, $comment, $emailRestaurant);
    	break ;
    case 'insertReply':
    	$comment = $_GET['comment'];
    	$emailOwner = $_GET['emailOwner'];
    	$idReview = $_GET['idReview'];

    	$result = $function($comment, $emailOwner, $idReview);
        break;
    default:
        break;
}

if(isset($result)){
    echo json_encode($result);
}

?>
