<?php
	include_once ('databaseRequests/restaurants.php');

	global $dbh;

	$restaurantName = $_GET['name'];
	if( !isset($_GET['name']) ) {
  		header ('Location: initial.php');
		return ;
	}

	$restaurantInfo = getRestaurantInfo($dbh, $restaurantName);
	$restaurantEmail = $restaurantInfo["email"];
	$restaurantCategories = getRestaurantCategories($dbh, $restaurantEmail);
	$restaurantMenu = getRestaurantMenu($dbh, $restaurantEmail);
	$restaurantHours = getRestaurantHours($dbh, $restaurantEmail);
	$restaurantPhotos = getRestaurantPhotos($dbh, $restaurantEmail);
	$restaurantReviews = getRestaurantReviews($dbh, $restaurantEmail);	
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
			<div id="overviewBox">
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
							foreach($restaurantCategories as $category) {
						?>
							<li class="category">
							<?php
								echo $category['category'];
							?>
							</li>
						<?php 	}
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
					<ul id="hours">
					<?php
						foreach($restaurantHours as $hours) {
					?>
							<li class="dayOpenHours">
								<p class="dayWeek">
								<?php
									echo $hours['day'];
								?>
								</p>
								<p class="openHours">						
								<?php
									echo $hours['initialHour'];
								?>
								</p>
								<p class="closeHours">						
								<?php
									echo $hours['finalHour'];
								?>
								</p>

							</li>
					<?php 	}
					?>
					</ul>
				</div>
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
					// Iterate throught all user reviews
					foreach($restaurantPhotos as $photo) {
				?>
						<img src=<?=$photo['path']?> alt="Restaurant Photo">
				<?php
					}
				?>
			</div>
		</div>
		<div id="Reviews" class="box reviews">
			<div id="reviewsDiv">
				<p id="reviewsTitle">Reviews</p>
				<ul id="restaurantReviews">
				<?php
					// Iterate throught all user reviews
					foreach($restaurantReviews as $review) {
				?>
					<li class="review">
						<p class="reviewUser">
						<?php
							echo getReviewUser($dbh, $review['emailReviewer'])['userName'];
						?>
						</p>
						<p class="reviewScore">
						<?php
							echo $review['score'];
						?>
						</p>
						<p class="reviewComment">
						<?php
							echo $review['comment'];
						?>
						</p>
						<?php
							$replys = getReviewReplys($dbh, $review['idReview']);

							// Iterate throught all replys
							foreach($replys as $reply) {
						?>
								<div class="reply">
									<p class="replyUser">
									<?php
										echo getReviewUser($dbh, $reply['emailOwner'])['userName'];
									?>
									</p>
									<p class="replyComment">
									<?php
										echo $reply['comment'];
									?>
									</p>
								</div>
						<?php
							}
						?>
					</li>	
				<?php
					}
				?>
				</ul>
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
