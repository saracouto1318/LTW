var selectedMenu = '#overview';

$(document).ready( function() { menuButtons(); } )

function menuButtons(){

	divId = getID(selectedMenu);
	$(divId).fadeIn(500);
	$(divId).show();

	$('#menuButtons input').click(function(event){
		showID('#' + $(this).attr("id"));
		event.preventDefault();
	});
	review_handlers();
}

function getID(id){
	switch(id) {
		case '#overview':
			return '#Overview';
		case '#menu':
			return '#Menu';
		case '#photos':
			return '#Photos';
		case '#reviews':
			return '#Reviews';
		case '#settings':
			return '#Settings';
		default:
			return '';
	}
}

function showID(id){
	switch(id){
		case '#overview':
			return showOverview();
		case '#menu':
			return showMenu();
		case '#photos':
			return showPhotos();
		case '#reviews':
			return showReviews();
		case '#settings':
			return showSettings();
		default:
			return;
	}
}

function showOverview() {
	if(selectedMenu == '#overview')
		return;

	$(selectedMenu).attr("class","Unselected_Item");

	var divId = getID(selectedMenu);
	$(divId).fadeOut(500);
	$(divId).hide();

	selectedMenu = '#overview';

	divId = getID(selectedMenu);
	$(divId).fadeIn(500);
	$(divId).show();

	$(selectedMenu).attr("class","Selected_Item");
}

function showMenu() {
	if( selectedMenu == '#menu' )
		return;

	$(selectedMenu).attr("class","Unselected_Item");

	var divId = getID(selectedMenu);
	$(divId).fadeOut();
	$(divId).hide();

	selectedMenu = '#menu';

	divId = getID(selectedMenu);
	$(divId).fadeIn();
	$(divId).show();

	$(selectedMenu).attr("class","Selected_Item");
}

function showReviews() {
	if( selectedMenu == '#reviews' )
		return;

	$(selectedMenu).attr("class","Unselected_Item");

	var divId = getID(selectedMenu);
	$(divId).fadeOut();
	$(divId).hide();

	selectedMenu = '#reviews';

	divId = getID(selectedMenu);
	$(divId).fadeIn();
	$(divId).show();

	$(selectedMenu).attr("class","Selected_Item");
}

function showPhotos() {
	if( selectedMenu == '#photos' )
		return;

	$(selectedMenu).attr("class","Unselected_Item");

	var divId = getID(selectedMenu);
	$(divId).fadeOut();
	$(divId).hide();

	selectedMenu = '#photos';

	divId = getID(selectedMenu);
	$(divId).fadeIn();
	$(divId).show();

	$(selectedMenu).attr("class","Selected_Item");
}

function showSettings() {
	if( selectedMenu == '#settings' )
		return;

	$(selectedMenu).attr("class","Unselected_Item");

	var divId = getID(selectedMenu);
	$(divId).fadeOut();
	$(divId).hide();

	selectedMenu = '#settings';

	divId = getID(selectedMenu);
	$(divId).fadeIn();
	$(divId).show();
	console.log($(divId));

	$(selectedMenu).attr("class","Selected_Item");
}

/*
	REVIEW ITEMS
*/
var score_clicked = 'Score0';

function getScoreColor(id) {
	var color;
	switch(id) {
		case 'Score1':
			color = '#ffffcc';
			break;
		case 'Score2':
			color = "#ffcc99";
			break;
		case 'Score3':
			color = "#ff9966";
			break;
		case 'Score4':
			color = "#ff9933";
			break;
		case 'Score5':
			color = "#ff3300";
			break;
		default:
			color = "#aaa";
	}
	return color;
}

function get_score(id) {
	var score;
	switch(id) {
		case 'Score1':
			score = 1;
			break;
		case 'Score2':
			score = 2;
			break;
		case 'Score3':
			score = 3;
			break;
		case 'Score4':
			score = 4;
			break;
		case 'Score5':
			score = 5;
			break;
		default:
			score = 0;
	}
	return score;
}

function select_score(item, color) {
    	item.css("background-color", color);
}

function hover_score(hovered_li) {
	var id = hovered_li.attr("id");
	if( id == 'Total_Score' )
		return ;

	var isPastId = false;

	var listItems = $("#Add_Score li");
	listItems.each(function(idx, li) {
		if($(li).attr("id") != 'Total_Score') {
			if(isPastId)
				select_score( $(li), '#aaa' );
			else {
				select_score( $(li), getScoreColor($(li).attr("id")) );
				if($(li).attr("id") == id)
					isPastId = true;
			}
		}
	});

	$('#Total_Score').html(get_score(id) + "");
}


function click_score(hovered_li) {
	score_clicked = hovered_li.attr("id");
}

function revert_hover_score() {
	var isPastId;
	if( score_clicked == 'Score0' ) {
		isPastId = true;
		$('#Total_Score').html("0");
	} else {
		isPastId = false;
		$('#Total_Score').html(get_score(score_clicked));
	}

	var listItems = $("#Add_Score li");
	listItems.each(function(idx, li) {
		if($(li).attr("id") != 'Total_Score') {
			if(isPastId)
				select_score( $(li), '#aaa' );
			else {
				select_score( $(li), getScoreColor($(li).attr("id")) );
				if($(li).attr("id") == score_clicked)
					isPastId = true;
			}
		}
	});
}

function score_buttons() {
	$('#Add_Score li').hover( function() {
			hover_score($(this));
		}, function() {
			revert_hover_score();
		});

	$('#Add_Score li').click( function() {
			click_score($(this));
		});
}

function comment_area() {
	$('#Add_Score').show();
	$('#Submit_Review').show();
}

function review_handlers() {
	$('#Review_Comment').click( function() {
		comment_area();

	});
	$("textarea").click( function() {
		$(this).attr('rows', 5);
	})
	score_buttons();
}

function updateReviews() {
	$score = $("#Total_Score").text();
	$review = $("#Review_Comment").val();
	$emailRestaurant = $("#emailRestaurant").val();
	console.log($emailRestaurant);
	var $result;

	$.ajaxSetup({
		async: false
	});
	$.getJSON("databaseRequests/restaurants.php",{
			"function": 'insertReviews',
			"score": $score,
			"comment": $review,
			"emailRestaurant": $emailRestaurant
		}, function(result) {
			$result = result;
		});
	$.ajaxSetup({
		async: true
	});
	$insertHtml = "<li class='review'> \
				<p class='reviewUser'>\
					" + $result['userName'] +
				"</p>\
				<p class='reviewScore'>\
					" + $score +
				"</p>\
				<p class='reviewComment'>"
					 + $review +
				"</p>\
			</li><div class='border'></div>";

	$("#addReviewTitle").before($insertHtml);

	$('#Add_Score .Unselected_Score').each(function() {
		$(this).css("background-color", "#aaa");
	});

	$('#Total_Score').text(0);
	$('#Review_Comment').val("").blur();
}
