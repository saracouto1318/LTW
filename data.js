// $(getTopRestaurants(5));

function getTopRestaurants(number){
    $.getJSON("templates/restaurants.php",{
        "choice":number,
        "function":"getTopRestaurants"
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
