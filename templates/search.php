<form id="form_search">
	<h1> Restaurants Guide </h1>
	<h2> Find here the restaurant that you pretend </h2>
	<div id="search_bar">
		<select name="category">
			<option value="italian">Italian food</option>
			<option value="japanese">Japonese food</option>
			<option value="pizza">Pizza</option>
			<option value="hamburguers">Hamburguer</option>

		<select/>
		<input type="text" name="Search" value="" placeholder="Search..."/>
	</div>
	<div id="search">
		<input class="button" onclick="getCategories()" type="button"/>
	</div>
</form>
