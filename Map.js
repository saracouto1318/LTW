

function Map(id){
    this.map = L.map(id);
    this.getImage();
}

Map.prototype.setView = function(coordinates, distance){
    this.map.setView(coordinates, distance);
};

Map.prototype.getImage = function(){
    L.tileLayer('http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png', {
        attribution: 'Map data &copy; <a href="http://openstreetmap.org">OpenStreetMap</a> contributors, <a href="http://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>',
        subdomains: 'abc',
        maxZoom: 19
    }).addTo(this.map);
};

function loadMap(){
    var mymap = new Map("mapid").setView([41.17, -8.59], 15);

    var marker = L.marker([41.17, -8.59]).addTo(mymap);
    marker.bindPopup("<b>Hello world!</b><br>I am a popup.").openPopup();

    function onMapClick(e) {
        alert("You clicked the map at " + e.latlng);
    }

    mymap.on('click', onMapClick);
}

$().ready(loadMap);
