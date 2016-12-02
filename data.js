// $(getAllRestaurants);

function getTop5Restaurants(){
    $.getJSON("templates/restaurants.php",{
        "function":"getTop5Restaurants"
    },print);
}

function login(){

}

function print(data){
    for (var user in data) {
            var line = $("<div class=\"restaurant\">");
            line.append(data[user].name);
            line.append("</div>");
            $("#tab").append(line);
    }
}


function toggleSignInMenu(){
    document.getElementById("signInMenu").classList.toggle("show");
}

function toggleSignUpMenu(){
    document.getElementById("signUpMenu").classList.toggle("show");
}

function myFunction() {
    document.getElementById("myDropdown").classList.toggle("show");
}
