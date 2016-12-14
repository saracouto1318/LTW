<?php
    include_once('config/init.php');

    if(isset($_GET["submit"])){
        $email = addslashes($_GET["email"]);
        $contact = $_GET["contact"];
        $name = addslashes($_GET["name"]);
        $price = $_GET["priceAVG"];
        $road = addslashes($_GET["road"]);
        $city = addslashes($_GET["city"]);
        $country = addslashes($_GET["country"]);
        $city = addslashes($_GET["city"]);
    }
    // Database connection
    $dbh = new PDO('sqlite:data.db');
    $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $location = $dbh->prepare("INSERT INTO location(road, city, country, latitude, longitude) VALUES (?,?,?,?,?)");
    $location->execute(array($road, $city, $country, $_GET["lat"], $_GET["lon"]));

    $location = $dbh->prepare("SELECT idLocation FROM location ORDER BY idLocation DESC LIMIT 1");
    $location->execute(array($email));
    $idLocation = $location->fetch();

    $create = $dbh->prepare("INSERT INTO restaurant(name, contact, email, priceAVG, idOwner, idLocation) VALUES (?, ?, ?, ?, ?, ?)");
    $create->execute(array($name, $contact, $email, $price, (owner), $idLocation));

    header("Location: " . [HTTP_REFERER]);
?>
