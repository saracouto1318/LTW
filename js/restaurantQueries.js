/**
 *  Methods and queries related to restaurant searching
 */
function getRestaurants() {
    var query = " SELECT * FROM (SELECT DISTINCT name, evaluation, priceAVG FROM restaurant JOIN restaurantCategory USING(idRestaurant) JOIN category USING (idCategory)";
    var cat = getCategories();
    var price = getPriceRange();
    var name = getName();
    var started = false;
    if (cat) {
        query += " EXCEPT SELECT name, evaluation, priceAVG FROM restaurant JOIN restaurantCategory USING(idRestaurant) JOIN category USING (idCategory) WHERE category IN (";
        query += cat + ")";
        started = true;
    }
    query += ")";
    if (price) {
        query += " WHERE ";
        query += price;
        started = true;
    }
    if (name) {
        if (started) {
            query += " AND ";
        } else {
            query += " WHERE ";
        }
        query += name;
    }

    query += getSorting();
    console.log(query);

    var parameters = {};
    parameters.function = "getRestaurants";
    parameters.choice = query;
    $.getJSON("databaseRequests/restaurants.php", parameters, displayRestaurants);
}

function getName() {
    var name = $("#restaurantName")[0].value;
    var string = "";
    if (name) {
        string += " name LIKE(\"%" + name + "%\") ";
    }
    return string;
}

function getCategories() {
    var categories = $("#categories").children("input");
    var chosen = false;
    var string = "";
    for (var i = 0; i < categories.length; i++) {
        var cat = categories[i];
        if (!cat.checked) {
            if (chosen) {
                string += ",";
            }
            chosen = true;
            string += "\"" + cat.name + "\"";
        }
    }
    return string;
}

function getPriceRange() {
    var slider = $("#priceRange");
    var min = slider.slider("option", "min");
    var max = slider.slider("option", "max");
    var values = slider.slider("values");
    var used = false;
    var string = "";
    if (min !== values[0]) {
        string += " priceAVG > " + values[0];
        used = true;
    }
    if (max !== values[1]) {
        if (used) {
            string += " AND priceAVG < " + values[1];
        } else {
            string += " priceAVG < " + values[1];
        }
    }
    return string;
}

function getSorting() {
    var sort = $("#order")[0].value;
    return " ORDER BY " + sort;
}

function displayRestaurants(data) {
    var parent = $("#restaurantsIndividuals");
    parent.empty();
    for (var i = 0; i < data.length; i++) {
        r = data[i];
        var show = "<li><div class=\"restaurantKey\"> <h2>" + r.name + "</h2> Price Average: " + r.priceAVG + " Evaluation: " + r.evaluation + "<form action=\"\" method=\"get\">       <input type=\"hidden\" name=\"page\" value=\"Info\">    <input type=\"hidden\" name=\"name\" value=\"" + r.name + "\">  <input type=\"submit\" value=\"more Info\">" +
            "</div></li>";
        parent.append(show);
        if (i !== data.length - 1) {
            var border = "<div class=\"border\"></div>";
            parent.append(border);
        }
    }


}

function showCategories() {
    $.getJSON("databaseRequests/restaurants.php", {
        "function": "getAllCategories"
    }, showCategory);
}

function showCategory(data) {
    var categories = $("#categories");

    for (var category in data) {
        var option = "<input type=\"checkbox\" name=\"" + data[category].category + "\" onclick=\"getRestaurants()\" checked=\"true\">" + data[category].category + "<br>";
        //var option = "<option value=\"" + data[category].category + "\">" + data[category].category + "</option>";
        categories.append(option);
    }

}

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

    $("span").attr("id", "alo");
}
