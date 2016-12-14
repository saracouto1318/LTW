<?php
  include_once('config/init.php');

  session_destroy();

  session_start();

  header("Location: initial.php");
?>
