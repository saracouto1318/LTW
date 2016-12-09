<?php
    include_once('config/init.php');

    include_once('config/init.php');
    if(isset($_POST["submit"])){
        $_POST["name"] = addslashes($_POST["name"]);
        $userName = strtolower($_POST["name"]);
    }
    // Database connection
    $dbh = new PDO('sqlite:data.db');
    $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    /*$users = $dbh->prepare("SELECT * FROM user WHERE userName = ?");
    $users->execute(array($userName));
    $result = $users->fetch();

    if($result){
        $error = "This userName is already in use";
        die ($error);
    }*/

    $create = $dbh->prepare("INSERT INTO user(userName, email, password) VALUES (?, \"asdas\", ?)");
    $create->execute(array($userName, password_hash($_POST["password"], PASSWORD_DEFAULT)));


    header('Location: initial.php');
?>
