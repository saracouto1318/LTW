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


		<div id="Overview" class="box overview">
			<div id="column1">
				<div id="contact">
					<p id="phone">Phone Number</p>
						<?php
							//Contact
						?>
				</div>
				<div id="categoriesCol">
					<p id="categoriesName">Categories</p>
						<ul id="catRest">   
						<?php
							//Categories
						?>
						</ul>
				</div>
			</div>
			<div id="column2">
				<div id="avgCost">
					<p id="AvgTitle">Average Cost</p>
					<p id="Avg_Cost">
						<?php
							//AVG COST
						?>
					</p>
				</div>
				<div id="hours">
				<p id="HoursTitle">Opening Hours</p>
					<?php
						//hours
					?>
				</div>
			</div>
	</div>
	
		<div id="Menu" class="box menu">
			<div id="menuDiv">
				<p id="menuTitle">Menu</p>
					<?php
						//Menu
					?>
			</div>
		</div>
		<div id="Photos" class="box phoyos">
			<div id="photosDIV">
				<p id="photosTitle">Photos</p>
					<?php
						//Menu
					?>
			</div>
		</div>
		<div id="Reviews" class="box reviews">
			<div id="reviewsDiv">
				<p id="reviewsTitle">Reviews</p>
					<?php
						//Menu
					?>
			</div>
		</div>
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
