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
		<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
		<script src="https://unpkg.com/leaflet@1.0.2/dist/leaflet.js"></script>
		<script src="Map.js"></script>
		<script src="data.js"></script>
	</head>
	<body>
		<div id="wrapperSearchRestaurants">
		<?php
			include ('templates/header.php');
		?>
			<div id="content">
			<?php
				include ('templates/tabs.php');
				include ('templates/search.php');
				include ('templates/restaurants.php');
			?>
			</div>
		<?php
			include ('templates/footer.php');
		?>
