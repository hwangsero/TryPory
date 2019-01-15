<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
/* Always set the map height explicitly to define the size of the div
       * element that contains the map. */
#map {
	height: 930px;
}
/* Optional: Makes the sample page fill the window. */
</style>
<div id="map"></div>
<script>
	var map;
	
	function initMap() {

		var location = {
			lat : 37.601204,
			lng : 127.132373
		};
		// The map, centered at Uluru

		map = new google.maps.Map(document.getElementById('map'), {
			zoom : 15,
			center : location
		});
		// The marker, positioned at Uluru
		
		/* <c:forEach items="${mapList}" var="map" >
		var myLatLng = {lat: ${map.lat}, lng: ${map.lng}}
		marker = new google.maps.Marker({
			position : myLatLng,
			map : map
		});
		console.log('${map.lng}')
		console.log('${map}')
		
		</c:forEach>
 */
		
		/* //정보창띄우기
		var contentString = '<div id="content">'+
	      '<div id="siteNotice">'+
	      '</div>'+
	      '<h1 id="firstHeading" class="firstHeading">Uluru</h1>'+
	      '<div id="bodyContent">'+
	      '<p><b>Uluru</b>, also referred to as <b>Ayers Rock</b>, is a large ' +
	      'sandstone rock formation in the southern part of the '+
	      'Northern Territory, central Australia. It lies 335&#160;km (208&#160;mi) '+
	      'south west of the nearest large town, Alice Springs; 450&#160;km '+
	      '(280&#160;mi) by road. Kata Tjuta and Uluru are the two major '+
	      'features of the Uluru - Kata Tjuta National Park. Uluru is '+
	      'sacred to the Pitjantjatjara and Yankunytjatjara, the '+
	      'Aboriginal people of the area. It has many springs, waterholes, '+
	      'rock caves and ancient paintings. Uluru is listed as a World '+
	      'Heritage Site.</p>'+
	      '<p>Attribution: Uluru, <a href="https://en.wikipedia.org/w/index.php?title=Uluru&oldid=297882194">'+
	      'https://en.wikipedia.org/w/index.php?title=Uluru</a> '+
	      '(last visited June 22, 2009).</p>'+
	      '</div>'+
	      '</div>';
	      
	      var infowindow = new google.maps.InfoWindow({
	    	    content: contentString
	    	  });
	      
	      marker.addListener('mouseover', function() {
	    	    infowindow.open(map, marker);
	    	  });
	      
	       marker.addListener('mouseout', function() {
	    	    infowindow.close(map, marker);
	    	  });  */
		
	}
	$j(document).ready(function() {
		/* google.maps.event.addListener(marker, 'click', function() {
			var map_wrap = $j("#map_info_container");
			if (map_wrap.css("display") == "none") {
				map_wrap.show();
			}
		}); */
		var spotList = JSON.parse('${spotList}');
		var marker_pos = [];
		var first_pos, second_pos;
		$j(spotList).each(function(i){
			var spot = spotList[i];
			console.log(spot);
			
			var myLatLng = {lat: spot.lat, lng: spot.lng}
			marker = new google.maps.Marker({
				position : myLatLng,
				map : map
			});
			
			if( first_pos == undefined ){
				first_pos = myLatLng;
			} else {
				second_pos = first_pos;
				first_pos = myLatLng;
			}
			marker_pos.push(myLatLng);
			
			if(marker_pos.length >= 2 ){ //  중심좌표 이동
				var newPosLat = ((first_pos.lat + second_pos.lat ) / 2).toFixed(4);
		        var newPosLng = ((first_pos.lng + second_pos.lng ) / 2).toFixed(4);
		        var newPosition = new google.maps.LatLng(newPosLat, newPosLng);
		        
		        map.setCenter(newPosition);
		        map.setZoom(10);
			}
			
		});
		
	});
</script>
<script
	src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6xArRw-nczVJ9vZLjCa-H1uSAE1PN3Ks&callback=initMap"></script>