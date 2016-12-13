
var mymap;

var LeafIcon = L.Icon.extend({
    options: {
        shadowUrl: 'images/leaf-shadow.png',
        iconSize:     [28, 75],
        shadowSize:   [50, 64],
        iconAnchor:   [22, 94],
        shadowAnchor: [4, 62],
        popupAnchor:  [-3, -76]
    }
});

var greenIcon = new LeafIcon({iconUrl: 'images/leaf-green.png'}),
    redIcon = new LeafIcon({iconUrl: 'images/leaf-red.png'}),
    orangeIcon = new LeafIcon({iconUrl: 'images/leaf-orange.png'});

function getImage(mymap){
    L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>',
        subdomains: 'abc',
        maxZoom: 19,
        minZoom: 2,
        noWrap: true
    }).addTo(mymap);
}

function loadMap(){
    mymap = new L.map("mapid").setView([41.16, -8.59], 12);
    getImage(mymap);


    function onMapClick(e) {
        alert("You clicked the map at " + e.latlng);
    }

    mymap.on('click', onMapClick);
}

function getAllRestaurants(){
    $.getJSON("databaseRequests/restaurants.php", {"function":"getAllRestaurants"}, uploadToMap);
}

function uploadToMap(data){
    for (var restaurant in data) {
        var rest = data[restaurant];
        var leafType;
        if(rest.evaluation < 2.5){
            leafType = redIcon;
        } else if(rest.evaluation < 4.0){
            leafType = orangeIcon;
        } else{
            leafType = greenIcon;
        }
        var marker = L.marker([rest.latitude, rest.longitude], {icon: leafType}).addTo(mymap);
        marker.bindPopup("<b>" + rest.name + "</b><br>Price average: " + rest.priceAVG);
    }
}
