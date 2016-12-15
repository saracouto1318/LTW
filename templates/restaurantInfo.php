<?php
	include_once ('databaseRequests/restaurants.php');

	global $dbh;

	$restaurantName = $_GET['name'];
	if( !isset($_GET['name']) ) {
  		header ('Location: initial.php');
		return ;
	}

	$restaurantInfo = getRestaurantInfo($dbh, $restaurantName);
	$restaurantCategories = getRestaurantCategories($dbh, $restaurantInfo["email"]);
	$restaurantMenu = getRestaurantMenu($dbh, $restaurantInfo["email"]);
	
?>
<div id="restaurantDiv">
	<div id="restaurantBackground">
		<div id="restaurantNameScore">
			<h3 class="restaurantName">
				<?php echo $restaurantInfo["name"]; ?>
			</h3>
			<h3 class="avg"></h3>
		</div>
	</div>

	<div id="restaurantInfo">
		<div id="Overview" class="box overview">
			<div id="column1">
				<div id="contact">
					<p id="phone">Phone Number</p>
					<?php
						echo $restaurantInfo["contact"];
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
						echo $restaurantInfo["priceAVG"];
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
		<div id="Photos" class="box photos">
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
		<div id="menuButtons">
			<input type="button" id="overview" onClick="toggleOverview()" class="Selected_Item" value="Overview">
			<input type="button" id="menu" onClick="toggleMenu()" class="Unselected_Item" value="Menu">
			<input type="button" id="photos" onClick="togglePhotos()" class="Unselected_Item" value="Photos">
			<input type="button" id="reviews" onClick="toggleReviews()" class="Unselected_Item" value="Reviews">
		</div>
	</div>

</div>
