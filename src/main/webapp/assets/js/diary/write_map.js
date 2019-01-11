/**
 * 
 */

var maps = [];
function initialize() {
    // create the maps
	var location = {
			lat : 37.601204,
			lng : 127.132373
	};
    var myOptions = {
        zoom: 14,
        center: location
    };
    var first_map = document.getElementById("map1");
    var map = new google.maps.Map(first_map, myOptions);
//    map = new google.maps.Map(, myOptions);
//	    map2 = new google.maps.Map(document.getElementById("map_canvas2"), myOptions);
    
    maps.push(map);
	console.log(maps);
}
$j(document).ready(function(){
	
});