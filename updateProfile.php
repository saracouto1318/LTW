<?php
    include_once('config/init.php');
    $email = $_SESSION["username"];

    $dbh = new PDO('sqlite:data.db');
    $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $newName = $_POST["username"];
    $newPass = $_POST["password"];

    if(!empty($newName)){
        if($_SESSION["username"] === $newName){
            die("New username cannot be the same as the old one");
        }
        $update = $dbh->prepare("UPDATE user SET userName = ? WHERE email = ?");
        $update->execute(array($newName));
        $counter = true;
    } else{
        $counter = false;
    }
    // Database connection

    if(!empty($newPass)){
        $update = $dbh->prepare("UPDATE user SET password = ? WHERE email = ?");
        $update->execute(array(password_hash($newPass, PASSWORD_DEFAULT)));

    } else if(!$counter){
        die("You must change an element");
    }
    $_SESSION["username"] = $newName;
    exit("Profile updated");
?>
