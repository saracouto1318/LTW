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