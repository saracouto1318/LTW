<?php
    include_once('config/init.php');
    $email = addslashes($_POST["email"]);
    // Database connection
    $dbh = new PDO("sqlite:Data_Base/data.db");
    $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $users = $dbh->prepare("SELECT * FROM user WHERE email = ?");
    $users->execute(array($email));
    $result = $users->fetch();

    if(!$result){
        header($_SERVER["SERVER_PROTOCOL"]."400 Bad Request");
        die("Fail: Unrecognized email");
    }

    $password = $_POST["password"];
    if(!password_verify($password, $result["password"])){
        $data = array('type' => 'fail');
        header($_SERVER["SERVER_PROTOCOL"]."400 Bad Request");
        die("Fail: Incorrect password");
    }
    $_SESSION["email"] = $email;
    $_SESSION["username"] = $result["userName"];

    header("Location: " . [HTTP.REFERER]);
    die("success");
?>
