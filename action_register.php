<?php
    include_once('config/init.php');

    include_once('config/init.php');
    if(isset($_POST["submit"])){
        $_POST["email"] = addslashes($_POST["email"]);
        $_POST["name"] = addslashes($_POST["name"]);
        $userName = $_POST["name"];
        $email = strtolower($_POST["email"]);
        $type = $_POST["userType"];
    }
    // Database connection
    $dbh = new PDO("sqlite:Data_Base/data.db");
    $dbh->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE, PDO::FETCH_ASSOC);
    $dbh->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $users = $dbh->prepare("SELECT * FROM user WHERE email = ?");
    $users->execute(array($email));
    $result = $users->fetch();

    if($result){
        $error = "Fail: This email is already in use";
        die ($error);
    }

    $create = $dbh->prepare("INSERT INTO user(userName, email, password) VALUES (?, ?, ?)");
    $create->execute(array($userName, $email, password_hash($_POST["password"], PASSWORD_DEFAULT)));

    if($type === "Owner"){
        $create = $dbh->prepare("INSERT INTO owner(email) VALUES (?)");
        $create->execute(array($email));
    } else{
        $create = $dbh->prepare("INSERT INTO reviewer(email) VALUES (?)");
        $create->execute(array($email));
    }

    $_SESSION["username"] = $userName;
    $_SESSION["email"] = $email;
    $_SESSION["type"] = $type;
    header("Location: " . $_SERVER["HTTP_REFERER"]);
?>
