$(showCategories());
$(getRestaurants());

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

function getUsers() {
    $.getJSON("databaseRequests/restaurants.php", {
        "choice": "SELECT * FROM user WHERE idUser < 6",
        "function": "getUsers"
    }, lol);
}

function getTop5() {
    $.getJSON("databaseRequests/restaurants.php", {"function":"getTop5"}, loadTop5);
}

function loadTop5(data) {
    var evaluation = data.evaluation;
    var cat = data.categories;
    for (var i = 0; i < eval.length; i++) {
        var html = "<div class=\"rank\" >" + eval[i] + "/>";
        $("topCategories").append(html);
    }
}

function getTopRestaurants(number) {
    $.getJSON("databaseRequests/restaurants.php", {
        "choice": number,
        "function": "getTopRestaurants"
    }, print);
}

function showCategories() {
    $.getJSON("databaseRequests/restaurants.php", {
        "function": "getAllCategories"
    }, category);

}

function getRestaurants() {
    var query = " SELECT * FROM (SELECT DISTINCT name, evaluation, priceAVG FROM restaurant JOIN restaurantCategory USING(idRestaurant) JOIN category USING (idCategory)";
    var cat = getCategories();
    var price = getPriceRange();
    var name = getName();
    var started = false;
    if(cat){
        query += " EXCEPT SELECT name, evaluation, priceAVG FROM restaurant JOIN restaurantCategory USING(idRestaurant) JOIN category USING (idCategory) WHERE category IN (";
        query += cat + ")";
        started = true;
    }
    query += ")";
    if(price){
        query += " WHERE ";
        query += price;
        started = true;
    }
    if(name){
        if(started){
            query += " AND ";
        } else{
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

function getName(){
    var name = $("#restaurantName")[0].value;
    var string = "";
    if(name){
        string += " name LIKE(\"%" + name + "%\") ";
    }
    return string;
}

function getCategories(){
    var categories = $("#categories").children("input");
    var chosen = false;
    var string = "";
    for (var i = 0; i < categories.length; i++) {
        var cat = categories[i];
        if(!cat.checked){
            if(chosen){
                string += ",";
            }
            chosen = true;
            string += "\"" + cat.name + "\"";
        }
    }
    return string;
}

function getPriceRange(){
    var slider = $("#priceRange");
    var min = slider.slider("option","min");
    var max = slider.slider("option","max");
    var values = slider.slider("values");
    var used = false;
    var string = "";
    if(min !== values[0]){
        string += " priceAVG > " + values[0];
        used = true;
    }
    if(max !== values[1]){
        if(used){
            string += " AND priceAVG < " + values[1];
        } else{
            string += " priceAVG < " + values[1];
        }
    }
    return string;
}

function getSorting() {
    var sort = $("#order")[0].value;
    return " ORDER BY " + sort;
}

function displayRestaurants(data){
    var parent = $("#restaurantsIndividuals");
    parent.empty();
    for (var i = 0; i < data.length; i++) {
        r = data[i];
        var show = "<li><div class=\"restaurantKey\"> <h2>" + r.name + "</h2> Price Average: " +r.priceAVG +  " Evaluation: " + r.evaluation + "</div></li>";
        parent.append(show);
        if(i !== data.length-1){
            var border = "<div class=\"border\"></div>";
            parent.append(border);
        }
    }


}

function category(data) {
    var categories = $("#categories");

    for (var category in data) {
        var option = "<input type=\"checkbox\" name=\"" + data[category].category + "\" onclick=\"getRestaurants()\" checked=\"true\">" + data[category].category + "<br>";
        //var option = "<option value=\"" + data[category].category + "\">" + data[category].category + "</option>";
        categories.append(option);
    }

}

function print(data) {
    for (var user in data) {
        console.log(data[user]);
        var line = $("<div class=\"restaurant\">");
        line.append(data[user].name);
        line.append("</div>");
        $("#tab").append(line);
    }
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

function switchTab(page){
    $.getJSON("index.php", {"page":page});

}

function submitLogin(e) {
    e.preventDefault();
    var form = $("#submitLogin").serialize();
    console.log(form);
    return $.post("action_login.php", form)
            .done(function(ble, bla, resp){
                try{
                    var reply = $.parseJSON(resp.responseText);
                    if(reply.type === "fail"){
                        var response = $("#loginWarning")[0];
                        response.innerHTML = reply.message;
                    }
                } catch (e){
                    location.reload();
                }
            });
}

function toggleSignInMenu() {
    document.getElementById("signInMenu").classList.toggle("show");
}

function toggleSignUpMenu() {
    document.getElementById("signUpMenu").classList.toggle("show");
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
