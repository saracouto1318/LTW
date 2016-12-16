<?php
    include_once('config/init.php');
    $email = $_SESSION["username"];

    // Database connection
    $dbh = new PDO('sqlite:Data_Base/data.db');
    $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);

    $newName = $_POST["username"];
    $newPass = $_POST["password"];

    if(!empty($newName)){
        if($_SESSION["username"] === $newName){
            die("&#9746 New username cannot be the same as the old one");
        }
        $update = $dbh->prepare("UPDATE user SET userName = ? WHERE email = ?");
        $update->execute(array($newName));
        $counter = true;
    } else{
        $counter = false;
    }

    if(!empty($newPass)){
        $update = $dbh->prepare("UPDATE user SET password = ? WHERE email = ?");
        $update->execute(array(password_hash($newPass, PASSWORD_DEFAULT)));

    } else if(!$counter){
        die("&#9746 You must change an element");
    }
    $_SESSION["username"] = $newName;
    exit("&#9745 Profile updated");
?>
