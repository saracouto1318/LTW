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
			<div id="overviewBox" class="ovYScroll">
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
			<div id="menuDiv" class="ovYScroll" >
				<p id="menuTitle">Menu</p>
				<?php
					foreach($restaurantMenu as $food) {
				?>
						<li class="food">
						<?php
							echo $food['detail'];
						?>
						</li>
				<?php 	}
				?>
			</div>
		</div>
		<div id="Photos" class="box photos">
			<div id="photosDIV" class="ovYScroll" >
				<p id="photosTitle">Photos</p>
				<?php
					foreach($restaurantPhotos as $photo) {
				?>
						<img src=<?=$photo['path']?> alt="Restaurant Photo">
				<?php
					}
				?>
			</div>
		</div>
		<div id="Reviews" class="box reviews">
			<div id="reviewsDiv" class="ovYScroll" >
				<p id="reviewsTitle">Reviews</p>
				<ul id="restaurantReviews">
				<?php
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

					<div class="border"></div>
				<?php
					}
				?>
				</ul>

				<p id="addReviewTitle">Submit new review</p>
				<form id="Review_Form">
					<input type="hidden" id="emailRestaurant" name="emailRestaurant" value="<?php echo ($restaurantEmail); ?>">
					<div id="Add_Score">
						<ul>
							<li id="Score1" class="Curved_Edges Unselected_Score"></li>
							<li id="Score2" class="Curved_Edges Unselected_Score"></li>
							<li id="Score3" class="Curved_Edges Unselected_Score"></li>
							<li id="Score4" class="Curved_Edges Unselected_Score"></li>
							<li id="Score5" class="Curved_Edges Unselected_Score"></li>
							<li id="Total_Score"></li>
						</ul>
					</div>
					<textarea id="Review_Comment" rows="1" placeholder="Write a review..." class="Unselected_TextArea"></textarea>
					<input type="button" value="Submit" id="Submit_Review" class="style_button Unselected_Button" onclick="updateReviews()">
				</form>
			</div>
		</div>
		<div id="menuButtons">
			<input type="button" id="overview" class="Selected_Item" value="Overview">
			<input type="button" id="menu" class="Unselected_Item" value="Menu">
			<input type="button" id="photos" class="Unselected_Item" value="Photos">
			<input type="button" id="reviews" class="Unselected_Item" value="Reviews">
		</div>
	</div>

</div>
