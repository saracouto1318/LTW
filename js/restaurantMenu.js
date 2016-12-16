var selectedMenu = '#overview';

$(document).ready( function() { menuButtons(); } )

function menuButtons () {

	div_id = getID(selectedMenu);
	$(div_id).fadeIn(500);
	$(div_id).show();

	$('#menuButtons input').click( function(event) {
			showID('#' + $(this).attr("id"));
			event.preventDefault();
		});

	review_handlers();
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
	console.debug('Hey');
	if( selectedMenu == '#overview' )
		return;

	$(selectedMenu).attr("class","Unselected_Item");

	var div_id = getID(selectedMenu);
	$(div_id).fadeOut(500);
	$(div_id).hide();

	selectedMenu = '#overview';

	div_id = getID(selectedMenu);
	$(div_id).fadeIn(500);
	$(div_id).show();

	$(selectedMenu).attr("class","Selected_Item");
}

function showMenu() {
	if( selectedMenu == '#menu' )
		return;

	$(selectedMenu).attr("class","Unselected_Item");

	var div_id = getID(selectedMenu);
	$(div_id).fadeOut();
	$(div_id).hide();

	selectedMenu = '#menu';

	div_id = getID(selectedMenu);
	$(div_id).fadeIn();
	$(div_id).show();

	$(selectedMenu).attr("class","Selected_Item");
}

function showReviews() {
	if( selectedMenu == '#reviews' )
		return;

	$(selectedMenu).attr("class","Unselected_Item");

	var div_id = getID(selectedMenu);
	$(div_id).fadeOut();
	$(div_id).hide();

	selectedMenu = '#reviews';

	div_id = getID(selectedMenu);
	$(div_id).fadeIn();
	$(div_id).show();

	$(selectedMenu).attr("class","Selected_Item");
}

function showPhotos() {
	if( selectedMenu == '#photos' )
		return;

	$(selectedMenu).attr("class","Unselected_Item");

	var div_id = getID(selectedMenu);
	$(div_id).fadeOut();
	$(div_id).hide();

	selectedMenu = '#photos';

	div_id = getID(selectedMenu);
	$(div_id).fadeIn();
	$(div_id).show();

	$(selectedMenu).attr("class","Selected_Item");
}

/*
	REVIEW ITEMS
*/
var score_clicked = 'Score0';

function get_score_color(id) {
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
				select_score( $(li), get_score_color($(li).attr("id")) );
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
				select_score( $(li), get_score_color($(li).attr("id")) );
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

function updateReplys(elem) {
/*	$reviewID = $(elem).data("id");
	$showmoreButton = $("input[data-id="+$reviewID+"]");
	$content = $textarea.val();
	$restaurantID = getRestaurantID();

	if( $content == "" )
		return ;

	var $result;

	$.ajax({
		type:"POST",
		url: "Database/restaurant.php",
		async: false,
		data: {
			action: 'insertReply',
			reviewID: $reviewID,
			content: $content
		},
		success: function(result) {
			$result = JSON.parse(result);
		}
	});

	$.ajax({
		type:"POST",
		url: "Database/restaurant.php",
		async: false,
		data: {
			action: 'insertReply',
			reviewID: $reviewID,
			content: $content
		},
		success: function(result) {
			$result = JSON.parse(result);
		}
	});

	$insertHtml = "<div class='ReviewReply'>\
						<div class='CommentInfo'>\
							<p class='CommentUsername'>\
								" + $result['username'] + " \
							</p>\
							<p class='GeneralDate'>\
								" + $result['Date'] + "\
							</p>\
						</div>\
						<div class='GeneralContent'>\
							" + $content + "\
						</div>\
					</div>";

	$showmoreButton.before($insertHtml).val("").blur();*/
}

function showReplyForm(elem) {
	$reviewID = $(elem).data("id");

	$("div[data-id="+$reviewID+"]").toggle(200);
}
