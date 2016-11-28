$(getAllUsers);

function getAllRestaurants(){
    $.getJSON("transferData.php",{
        "function": "getAllRestaurants",
        "choice": 5}, print);
}

function login(){

}

function print(data){
    for (var user in data) {
        console.log(data[user]);
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
