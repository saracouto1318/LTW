$(getCategories());

function createSliders(){
    console.log($(".doubleSlider"));
    var sliders = $(".doubleSlider");

    $("#priceRange").slider({
        range:true,
        min:0,
        max:500,
        values:[0, 500],
        slide: function( event, ui ) {
            $( "#amount" ).val( "$" + ui.values[ 0 ] + " - $" + ui.values[ 1 ] );
        }
    });
    $( "#amount" ).val( "$" + $( "#priceRange" ).slider( "values", 0 ) +
        " - $" + $( "#priceRange" ).slider( "values", 1 ) );

    $("span").attr("id","alo");
}

function getTopRestaurants(number) {
    $.getJSON("databaseRequests/restaurants.php", {
        "choice": number,
        "function": "getTopRestaurants"
    }, print);
}

function getCategories() {
    $.getJSON("databaseRequests/categories.php", {
        "function": "getAllCategories"
    }, category);

}

function handleChecks(cb){
    if (cb.readOnly)
        cb.checked=cb.readOnly=false;
    else if (!cb.checked)
        cb.readOnly=cb.indeterminate=true;
}


function category(data) {
    var categories = $("#categories");
    // var children = search.children("select");

    for (var category in data) {
        var option = "<input type=\"checkbox\" name=\"" + data[category].category + "\" onclick=\"handleChecks(this)\">" + data[category].category + "<br>";
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



function toggleSignInMenu() {
    document.getElementById("signInMenu").classList.toggle("show");
}

function toggleSignUpMenu() {
    document.getElementById("signUpMenu").classList.toggle("show");
}

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}
