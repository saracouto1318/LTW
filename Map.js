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
