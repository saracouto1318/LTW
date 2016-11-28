<!DOCTYPE html>
<html>
  <head>
    <title>Restaurants Reviewer</title>
	<meta charset="utf-8"/>
    <link rel="stylesheet" href="https://unpkg.com/leaflet@1.0.2/dist/leaflet.css" />
    <link rel="stylesheet" href="css/style.css" />
    <script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
    <script src="https://unpkg.com/leaflet@1.0.2/dist/leaflet.js"></script>
    <script src="Map.js"></script>
    <script src="data.js"></script>
  </head>
  <body>
    <header>
		<img src="images/logoLTW.png" alt="Restaurants Reviewer"/>

		<ul id="init">
			<?php
				if (isset($_SESSION['username'])) {
					echo '<li>';
						include ('templates/logout.php');
					echo '</li>';
				}

				else {
					echo '<li>';
						include ('templates/login.php');
					echo '</li>';
					echo '<li>';
						include ('templates/register.php');
					echo '</li>';
				}

			?>
	  </ul>

    </header>

	<div id="mapid"></div>
	  <script>
        var mymap = new Map("mapid").setView([41.17, -8.59], 15);

        var marker = L.marker([41.17, -8.59]).addTo(mymap);
        marker.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();

        function onMapClick(e) {
            alert("You clicked the map at " + e.latlng);
        }

        mymap.on('click', onMapClick);
	</script>
