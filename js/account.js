/**
 *  Inputs or changes to user profile and queries related to any belonging
 */

function loadProfile(user) {
    $.getJSON("databaseRequests/restaurants.php", {
        "function": "getAllFromUser",
        "choice":user
    }, displayProfile);
}

function displayProfile(data) {
    var div = $("#myRestaurants");

    for (var i = 0; i < data.length; i++) {
        var r = data[i];
        var html = "<form class=\"restaurantGrid\"><h2>" + r.name + "</h2>" + r.city + "<br>" + r.evaluation + "</form>";
        div.append(html);
    }
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
    var success = false;
    $.ajaxSetup({
        async: false
    });
    $.post("action_login.php", form, s)
        .done(function(p1,p2,resp){
            alert("yay");
            console.log(p1);
            console.log(p2);
            console.log(resp);
            try {
                var reply = $.parseJSON(resp.responseText);

                if (reply.type === "fail") {
                    var response = $("#loginWarning")[0];
                    response.innerHTML = "&#9746 " + reply.message;
                }
            } catch (e) {
                location.reload();
                success = true;
            }
        }).fail(function(p1,p2,p3){
            console.log(p1.responseText);
            if(p1.responseText.indexOf("Fail") != -1){
                var response = $("#loginWarning")[0];
                response.innerHTML = "&#9746" + p1.responseText;
            } else{
                location.reload();
                success = true;
            }
        });
    $.ajaxSetup({
        async: true
    });
    return success;
}

function s(data){
    console.log(data);
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

function loadImage(event){
	var img = document.getElementById('profilePic');
	img.src = URL.createObjectURL(event.target.files[0]);

	var $error = $('#IMGerror');
	var extension = document.getElementById('file').files[0].name.split('.').pop().toLowerCase();
	var size = document.getElementById('file').files[0].size;

	if(extension != 'jpg' && extension != 'jpeg' || extension != 'png'){
		$error.text("The image must be .jpg, .jpeg ou .png");
		$error.fadeIn(1000);
	}
	else if(size > 20971520){
		$error.text("The image must have 20MB");
		$error.fadeIn(1000);
	}
	else{
		$error.innerHTML = "";
		$error.fadeOut(1000);
	}
}
