<link rel="stylesheet" href="css/Style.css" />
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<div id="restaurantsResult">	
	<ul id="restaurantsIndividuals">
		<li>Restaurant1</li>
		<div id="border"></div>
		<li>Restaurant2</li>
	</ul>
	
	<div class="parameters">
		<div id="categories"></div>
		<input type="text" readonly="true" id="amount">
		<div id="priceRange" class="doubleSlider">
			  <div id="priceHandle" class="ui-slider-handle"></div>
		</div>
		<div id="evalRange" class="doubleSlider">
			  <div id="evalHandle" class="ui-slider-handle"></div>
		</div>
	</div>
	<script>
		createSliders();
	</script>
</div>