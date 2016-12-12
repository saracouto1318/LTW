<?php
    include_once('config/init.php');
    $email = $_POST["email"];
    // Database connection
    $dbh = new PDO('sqlite:data.db');
    $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $users = $dbh->prepare("SELECT * FROM user WHERE email = ?");
    $users->execute(array($email));
    $result = $users->fetch();

    if(!$result){
        $message = "Unrecognized email";
        $data = array('type' => 'fail', 'message' => $message, "email" => $email);
        header($_SERVER["SERVER_PROTOCOL"]."400 Bad Request");
        echo json_encode($data);
        die();
    }

    $password = $_POST["password"];
    if(!password_verify($password, $result["password"])){
        $message = "Incorrect password";
        $data = array('type' => 'fail', 'message' => $message);
        header($_SERVER["SERVER_PROTOCOL"]."400 Bad Request");
        echo json_encode($data);
        die();
    }
    $_SESSION["username"] = $email;
    header('Location: ' . "initial.php");
?>
