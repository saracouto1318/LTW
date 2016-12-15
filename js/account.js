/**
 *  Inputs or changes to user profile and queries related to any    *       belonging
 */

function loadProfile(user) {
    $.getJSON("databaseRequests/restaurants.php", {
        "function": "getAllFromUser",
        "choice":user
    }, displayProfile);
}

function displayProfile(data) {
    console.log(data);
    var div = $("#myRestaurants");

    for (var i = 0; i < data.length; i++) {
        var r = data[i];
        var html = "<form class=\"restaurantGrid\"><h2>" + r.name + "</h2>" + r.city + "<br>" + r.evaluation + "</form>";
        div.append(html);
    }
    console.log(location);
}

function changeProfile(e) {
    e.preventDefault();
    var form = $("#editProfile").serialize();
    return $.post("updateProfile.php", form)
        .done(function(p1, p2, resp) {
            var response = $("#profileWarning")[0];
            response.innerHTML = resp.responseText;

        });
}

function submitLogin(e) {
    e.preventDefault();
    var form = $("#submitLogin").serialize();
    return $.post("action_login.php", form)
        .done(function(p1, p2, resp) {
            try {
                var reply = $.parseJSON(resp.responseText);
                if (reply.type === "fail") {
                    var response = $("#loginWarning")[0];
                    response.innerHTML = "&#9746 " + reply.message;
                }
            } catch (e) {
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

function disableProfileTabs() {
    var profileTab = ["newRestaurant", "myRestaurants", "myOpinions", "myProfile"];

    for (var i = 0; i < profileTab.length; i++) {
        document.getElementById(profileTab[i]).classList.remove("show");
    }
}

function createRestaurant(e) {
    e.preventDefault();
    var road = $("#road")[0].value;
    var city = $("#city")[0].value;
    var country = $("#country")[0].value;
    var address = road + ", " + city + ", " + country;
    var coords = getCoords(address);
    console.log(coords);
    $("#lat")[0].value = coords[0];
    $("#lon")[0].value = coords[1];
    var form = $("#submitRestaurant").serialize();
    $.getJSON("createRestaurant.php", form, function(data){
        $("#profileWarning")[0].innerHTML = "Restaurant created. Please proceed to My Restaurants tab and point some categories or it won't show in the general search.";
    });
}

function toggleProfileTabs(tab){
    disableProfileTabs();
    document.getElementById(tab).classList.toggle("show");
}
