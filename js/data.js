/**
 *  Other methods that enhance visual quality or provide info
 */

function getTop5() {
	console.debug("LOL");
    $.getJSON("databaseRequests/restaurants.php", {
        "function": "getTop5"
    }, loadTop5);
}

function loadTop5(data) {
    var evaluation = data.evaluation;
    var cat = data.categories;

    var html = "<table> <thead><tr><th>Categories</th><th>Count</th></tr></thead>",
        i;
    for (i = 0; i < cat.length; i++) {
        html += ("<tr><th>" + cat[i].category + "</th><th>" + cat[i]["COUNT(*)"] + "</th></tr>");
    }
    html += ("</table>");
    $("#topCategories").append(html);

    html = "<table> <tr><th>Restaurant</th><th>Rating</th></tr><tr></tr>";
    for (i = 0; i < evaluation.length; i++) {
        html += ("<tr><th>" + evaluation[i].name + "</th><th>" + evaluation[i].evaluation + "</th></tr>");
    }
    html += ("</table>");
    $("#topEvaluations").append(html);
}

function getRestaurantInfo(name) {
    $.getJSON("databaseRequests/restaurants.php", {
        "function": "getRestaurantInfo",
        "choice": name
    }, displayInfo);
}

function displayInfo(data) {
    var header = $("#restaurantNameScore");
    var rating = header.children(".avg")[0];
    rating.innerHTML = "<span class=\"stars\">" + data[0].evaluation + "</span>";
    //falta adicionar o resto as tabs
}

function getAllRestaurants() {
    $.getJSON("databaseRequests/restaurants.php", {
        "function": "getAllRestaurants"
    }, uploadToMap);
}

window.onclick = function(event) {
    var dropdowns = document.getElementsByClassName("dropdown");
    var dropdownAction = $(".dropdownAction");
    var eventAllClasses = event.target.getAttribute("class");

    if (eventAllClasses !== null) {
        var allSplit = eventAllClasses.split(" ");
        if (allSplit.length > 1) {
            var eventClass = eventAllClasses.split(" ")[1];
            for (var i = 0; i < dropdowns.length; i++) {
                var actionList = dropdownAction[i].className.split(" ")[1];
                var openDropdown = dropdowns[i];
                if (eventClass != actionList && openDropdown.classList.contains('show')) {
                    openDropdown.classList.remove('show');
                }
            }
            return;
        }
    }
    for (var j = 0; j < dropdowns.length; j++) {
        dropdowns[j].classList.remove('show');
    }
};

function disableTabs() {
    var restaurantTab = ["Overview", "Menu", "Photos", "Reviews"];

    for (i = 0; i < restaurantTab.length; i++) {
        document.getElementById(restaurantTab[i]).classList.remove("show");
    }
}

function toggleOverview() {
    document.getElementById("Overview").classList.toggle("show");
}

function toggleMenu() {
    document.getElementById("Menu").classList.toggle("show");
}

function togglePhotos() {
    document.getElementById("Photos").classList.toggle("show");
}

function toggleReviews() {
    document.getElementById("Reviews").classList.toggle("show");
}

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}

$.fn.stars = function() {
    return $(this).each(function() {
        // Get the value
        var val = parseFloat($(this).html());
        // Make sure that the value is in 0 - 5 range, multiply to get width
        var size = Math.max(0, (Math.min(5, val))) * 16;
        // Create stars holder
        var $span = $('<span />').width(size);
        // Replace the numerical value with stars
        $(this).html($span);
    });
};

function createSliders() {
    var sliders = $(".doubleSlider");

    $("#priceRange").slider({
        range: true,
        min: 0,
        max: 50,
        values: [0, 50],
        slide: function(event, ui) {
            $("#amount").val("$" + ui.values[0] + " - $" + ui.values[1]);
            getRestaurants();
        }
    });
    $("#amount").val("$" + $("#priceRange").slider("values", 0) +
        " - $" + $("#priceRange").slider("values", 1));

    $("span").attr("id", "secondSliderHandle");
}
