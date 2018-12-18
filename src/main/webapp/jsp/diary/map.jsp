<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 700px;
}
/* Optional: Makes the sample page fill the window. */
</style>
<div id="map"></div>
<script>
	function initMap() {
		
		var location = {
				lat : 26.21722166666667,
				lng : 127.685
			};
		  // The map, centered at Uluru

		var map = new google.maps.Map(document.getElementById('map'), {
			zoom : 12,
			center : location
		});
		// The marker, positioned at Uluru
		var marker = new google.maps.Marker({
			position : location,
			map : map
		});
	}
</script>
<script	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6xArRw-nczVJ9vZLjCa-H1uSAE1PN3Ks&callback=initMap"></script>