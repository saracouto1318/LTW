<!DOCTYPE html>

<?php
	include_once('config/init.php');
?>
	<html>
		<head>
			<title>Restaurants Reviewer</title>
			<meta charset="utf-8"/>
			<link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
			<link rel="stylesheet" href="css/Style.css" />
			<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
			<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
			<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
			<script src="https://unpkg.com/leaflet@1.0.2/dist/leaflet.js"></script>
			<script src="data.js"></script>
		</head>
		<body>
			<div id="wrapperInitial">
<?php
	include ('templates/header.php');
?>
	<div id="content">
<?php
	include ('templates/tabs.php');
	include ('templates/search.php');

	$page = $_GET["page"];
	switch ($page) {
		case "Map":
			include("templates/map.php");
			break;
		case "Top 5":
			include("templates/top5.php");
			break;
		case "Profile":
			include("templates/profile.php");
			break;
		default:
			include("templates/restaurants.php");
			break;
	}
?>
	</div>
<?php
	include ('templates/footer.php');
?>
