<?php
    include_once('config/init.php');
    $email = $_SESSION["username"];

    // Database connection
    $dbh = new PDO('sqlite:Data_Base/data.db');
    $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $newCategory = addslashes($_GET["category"]);
    $restEmail = addslashes($_GET["email"]);

    if($newCategory){
        $add = $dbh->prepare("SELECT * FROM category WHERE category = ?");
        $add->execute(array($newCategory));
        $cat = $add->fetch();

        if($cat){
            $link = $dbh->prepare("INSERT INTO restaurantCategory(email, idCategory) VALUES (?,?)");
            $link->execute(array($restEmail, $cat["idCategory"]));
        } else{
            $add = $dbh->prepare("INSERT INTO category(category) VALUES (?)");
            $add->execute(array($newCategory));

            $add = $dbh->prepare("SELECT * FROM category WHERE category = ?");
            $add->execute(array($newCategory));
            $cat = $add->fetch();

            $link = $dbh->prepare("INSERT INTO restaurantCategory(email, idCategory) VALUES (?,?)");
            $link->execute(array($restEmail, $cat["idCategory"]));
        }
    }
    header("Location: initial.php?page=Profile");
?>
