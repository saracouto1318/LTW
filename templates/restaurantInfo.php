<div id="restaurantDiv">
	<div id="restaurantBackground">
		<div id="restaurantNameScore">
			<h3 class="restaurantName">
				<?php echo $_GET["name"]; ?>
			</h3>
			<h3 class="avg"></h3>
		</div>
	</div>

	<div id="restaurantInfo">
		<div class="infoOptions">
			<input type="button" id="overview" onClick="toggleInfo(this.value)" class="boxAction overview" value="Overview">
			<input type="button" id="menu" onClick="toggleInfo(this.value)" class="boxAction menu" value="Menu">
			<input type="button" id="photos" onClick="toggleInfo(this.value)" class="boxAction photos" value="Photos">
			<input type="button" id="reviews" onClick="toggleInfo(this.value)" class="boxAction reviews" value="Reviews">
		</div>


		<div id="Overview" class="box overview"></div>
		<div id="Menu" class="box overview"></div>
		<div id="Photos" class="box overview"></div>
		<div id="Reviews" class="box overview"></div>
	</div>

</div>

<script type="text/javascript">
	var name = "<?php echo $_GET["name"]; ?>";
	console.log(name);
	getRestaurantInfo(name);
	toggleInfo("Overview");
	$(function() {
		$('span.stars').stars();
	});
</script>
