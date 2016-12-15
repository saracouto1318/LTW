<div id="restaurantsResult">
	<div class="overlay">
		<select id="order" name="order" onchange="getRestaurants()">
			<option value="name ASC">Alphabetical A->Z</option>
			<option value="name DESC">Alphabetical Z->A</option>
			<option value="priceAVG ASC">Cheapest first</option>
			<option value="priceAVG DESC">Most expensive first</option>
			<option value="evaluation ASC">Worst rating</option>
			<option value="evaluation DESC">Best rating</option>
		</select>
	</div>
	<ul id="restaurantsIndividuals">
	</ul>

	<div class="parameters">
		<p>Name contains</p>
		<p><input id="restaurantName" type="text" name="name" placeholder="Restaurant name" oninput="getRestaurants()">
		</p>
		<div id="categories" class="categoryParameter"></div>
		<input type="text" readonly="true" id="amount">
		<div id="priceRange" class="doubleSlider">
			  <div id="priceHandle" class="ui-slider-handle"></div>
		</div>
		<div id="evalRange" class="doubleSlider">
			  <div id="evalHandle" class="ui-slider-handle"></div>
		</div>
		<p></p>
	</div>
	<script>
		createSliders();
		showCategories();
		getRestaurants();
	</script>
</div>
