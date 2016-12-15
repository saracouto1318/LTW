$(document).ready( function() { loadDocument() } )

function loadDocument() {
	$('#SearchSubmit').click( function() {
		search_value();
	});
}

function search_value() {
	var search_val = $('#SearchData').val();
	if( search_val == "" )
		return ;
	
	window.location = "searchRestaurants.php?Search="+search_val;
}
