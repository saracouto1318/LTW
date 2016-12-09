<?php
    include_once('config/init.php');
    if(isset($_POST["submit"])){
        $_POST["name"] = addslashes($_POST["name"]);
        $userName = strtolower($_POST["name"]);
    }
    // Database connection
    $dbh = new PDO('sqlite:data.db');
    $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $users = $dbh->prepare("SELECT * FROM user WHERE userName = ?");
    $users->execute(array($userName));
    $result = $users->fetch();

    if(!$result){
        echo $userName;
        $error = " not recognized userName";
        die ($error);
    }

    $password = $_POST["password"];
    if(!password_verify($password, $result["password"])){
        echo ($password);
        die(" invalid password");
    }

    $_SESSION["username"] = $userName;

    header('Location: ' . $_SERVER['HTTP_REFERER']);
?>
