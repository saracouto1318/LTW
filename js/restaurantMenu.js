var selectedMenu = '#Overview';

$(document).ready( function() { menuButtons(); } )

function menuButtons () {
	$('#menuButtons input').click( function(event) {
			showID('#' + $(this).attr("id"));
			event.preventDefault();
		});
}

function getID ( id ) {
	switch(id) {
		case '#overview':
			return '#Overview';
		case '#menu':
			return '#Menu';
		case '#photos':
			return '#Photos';
		case '#reviews':
			return '#Reviews';
		default:
			return '';
	}
}

function showID(id) {
	switch(id) {
		case '#overview':
			return showOverview();
		case '#menu':
			return showMenu();
		case '#photos':
			return showPhotos();
		case '#reviews':
			return showReviews();
		default:
			return ;
	}
}

function showOverview() {
	if( selectedMenu == '#overview' )
		return;

	$(selectedMenu).children(".Selected_Item").attr("class","Unselected_Item");

	var div_id = getID(selectedMenu);
	$(div_id).fadeOut();
	$(div_id).hide();

	selectedMenu = '#overview';

	div_id = getID(selectedMenu);
	$(div_id).fadeIn();
	$(div_id).show();

	$(selectedMenu).children(".Unselected_Item").attr("class","Selected_Item");
}

function showMenu() {
	if( selectedMenu == '#menu' )
		return;

	$(selectedMenu).children(".Selected_Item").attr("class","Unselected_Item");

	var div_id = getID(selectedMenu);
	$(div_id).fadeOut();
	$(div_id).hide();

	selectedMenu = '#menu';

	div_id = getID(selectedMenu);
	$(div_id).fadeIn();
	$(div_id).show();

	$(selectedMenu).children(".Unselected_Item").attr("class","Selected_Item");
}

function showReviews() {
	if( selectedMenu == '#reviews' )
		return;

	$(selectedMenu).children(".Selected_Item").attr("class","Unselected_Item");

	var div_id = getID(selectedMenu);
	$(div_id).fadeOut();
	$(div_id).hide();

	selectedMenu = '#reviews';

	div_id = getID(selectedMenu);
	$(div_id).fadeIn();
	$(div_id).show();

	$(selectedMenu).children(".Unselected_Item").attr("class","Selected_Item");
}

function showPhotos() {
	if( selectedMenu == '#photos' )
		return;

	$(selectedMenu).children(".Selected_Item").attr("class","Unselected_Item");

	var div_id = getID(selectedMenu);
	$(div_id).fadeOut();
	$(div_id).hide();

	selectedMenu = '#photos';

	div_id = getID(selectedMenu);
	$(div_id).fadeIn();
	$(div_id).show();

	$(selectedMenu).children(".Unselected_Item").attr("class","Selected_Item");
}
