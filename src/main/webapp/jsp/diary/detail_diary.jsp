<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

$j(document).ready(function() {
	replyList()
	
	$j('#addBtn').click(function() {
		var data = {
				diaryNo : ${diary.no},  //일단 임시로 diaryNo를 1로 해놈
				content : $j('#replyContent').val()
		}

		$j.ajax({
			url : '${pageContext.request.contextPath}/reply',
			type : "post",
			data : data,
			success : function() {
				 $j('#replyContent').val('')
				replyList();
			}, error : function(e) {
				alert('내용을 입력해주세요');
				$j('#replyContent').focus();
			}
		})
	})
	
	$j(document).on('click','.delBtn', function() {
		if(!confirm('댓글을 삭제하시겠습니까?')) return;
		var replyNo = $j(this).attr('id');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/reply/' + replyNo,
			type : 'delete',
			success : function() {
				$j('#replyContent').val('')
				replyList();
			}, error : function(e) {
				alert(e)
			}
		})
	})
})

function replyList() {	
	$j('#commentList').empty();
	
	$j.ajax({
		url : '${pageContext.request.contextPath}/reply/${diary.no}', //일단 임시로 diaryNo를 1로 해놈
		dataType : 'json',
		success : function(data) {
			console.log(data)
			var i = 0;
			$j(data).each(function() {
			var str = '<li>'
			str+=  '<div class="commenterImage">'
			str+= '<img src="http://placekitten.com/50/50"/>'
			str+= '</div>'
			str+= '<div class="commentText">'
			str+= '<div>' + data[i].content + '</div>'
			str+= '<span class="date sub-text">' + data[i].writer + '&nbsp' + data[i].registerDate + '</span>'
			str+= '&nbsp; <button class="delBtn" id="' + data[i].no + '">삭제</div>'
				str+= '<hr>'
			str+= '</li>'
				
			$j('#commentList').append(str);
			
			i += 1;
			})
			}, 
			error : function(e) {
				alert(e);
			}
	})
}
</script>
<script>
var detail_data = JSON.parse( JSON.stringify(${content}));
var map_datas = JSON.parse('${map_content}');
var maps = [];

console.log(detail_data);
var start_date = new Date('${diary.start_date}');
var write_wrap = $j("#write_wrap");

var content_list = new Array(); // 날짜, 내용 div저장할 배열;

$j(detail_data).each(function(date){ // 일차별
	console.log("date " + date);
	var content_datebox = $j("<div class='content_datebox'/>"); // 날짜
	var content_date_val = detail_data[date].date;
	var content_date = new Date('"' + content_date_val + '"'); // 날짜 값
	
	if( date == 0){
		/* start_date */
	}
	$j(content_datebox).append("<h4>" + ( content_date.getDate() - start_date.getDate() +1 )  + "일차</h4>");
	$j(content_datebox).append("<span>" + content_date_val + "</span>");
	
	content_list.push(content_datebox);

	$j(detail_data[date].content).each(function(index){ // 문단별
		console.log("index " + index);
	
		var content_data = detail_data[date].content[index];
		var image_list = content_data.images;

		var content_box = $j("<div class='content_box'/>");		// 내용
		var content_editbox = $j("<div class='content_editbox'/>");
		/* image_wrap */
		var image_wrap = $j("<div class='img_wrap clr' />");

		if( image_list != undefined ){
			$j(image_list).each(function(image_index){
				var image_content = $j("<div class='img_content'/>");
				var img = $j("<img src='${pageContext.request.contextPath}/image/" + image_list[image_index].fileName + "' />");
				$j(image_content).append(img);
				$j(image_wrap).append(image_content);
			});
		}
		$j(content_editbox).append(image_wrap);
		
		$j(content_editbox).append("<p id='content_text'>" + content_data.text + "</p>");
		content_box.append(content_editbox);
		
		content_list.push(content_box);
	});
	
	var map = $j("<div id='map"+(date+1) + "' style='height:400px;'></div>");
	content_list.push(map);
	
});

function initialize_map(map_element){
	var location = {
			lat : 37.601204,
			lng : 127.132373
	};
    var myOptions = {
        zoom: 14,
        center: location
    };
    var map = new google.maps.Map(map_element, myOptions);
    maps.push(map);
    
}

$j(document).ready(function(){
	$j("div#write_page_header").css("background-image", "url(" +  window.ctx + "/image/" + '${ diary.cover_image }' + ")");
	
	var map_cnt = 1;
	for (var i = 0; i < content_list.length; i++) {
		var div = content_list[i];
		var last_element = $j("div#write_wrap div.container > div").last();
		$j(last_element).after(div);
		
		if( (i - 2) % 3 == 0 ){
			var map_element = document.getElementById("map" + map_cnt );
			initialize_map(map_element); // init

			map_event( map_datas[map_cnt-1], map_cnt );
			map_cnt++;
			
		}
	}
	
	function map_event(map_datas, map_cnt){ // 1일차, 2일차, 3일차 ...
		var marker_pos = [];
		var poly_pos = [];
		var map = maps[map_cnt-1];
		
		for (var i = 0; i < map_datas.length; i++) { // 일차의 좌표1, 좌표2, 좌표3 ...
			var map_data = map_datas[i];
			
			var myLatlng = new google.maps.LatLng(map_data.lat, map_data.lng);
			var mapOptions = {
			  zoom: 4,
			  center: myLatlng
			}

			var marker = new google.maps.Marker({
			    position: myLatlng,
			    map : map
			});
			
			marker_pos.push(myLatlng);
			if(marker_pos.length == 2 ){ //  중심좌표 이동
				var newPosLat = ((marker_pos[0].lat() + marker_pos[1].lat() ) / 2).toFixed(4);
		        var newPosLng = ((marker_pos[0].lng() + marker_pos[1].lng() ) / 2).toFixed(4);
		        var newPosition = new google.maps.LatLng(newPosLat, newPosLng);
		        marker_pos[0] = marker_pos[1];
		        marker_pos.pop();
		        map.setCenter(newPosition);
			} else {
		        map.setCenter(myLatlng);
			}
			
			poly_pos.push(myLatlng);
			
		}
		var flightPath = new google.maps.Polyline({
		    path: poly_pos,
		    strokeColor: "#FF0000",
		    strokeOpacity: 1.0,
		    strokeWeight: 2
		  });

	  	flightPath.setMap(map);
	}
	
	/* 댓글 */
	var tag = '${ diary.tag }'; 
	if( tag != ''){
		tag = tag.split(', ');
		$j(tag).each(function(index){
			$j(".tag_box ul").append("<li>#" + tag[index] + "</li>");
		});
	}
	/* 댓글 */
	
});
</script>
<div id="write_page_header" class="C">
	<div id="header_content">
		<div class="content_top_in">
			<div class="content_wrap">
				<div class="textarea_box">
					<h4 id="input_diary_title">${diary.title }</h4>
				</div>
				<div class="date_box">
					<i class="far fa-calendar-check fa-2x"></i> 
					<span>${diary.start_date} ~ ${diary.end_date}</span>
				</div>
				
				<div class="tag_box">
					<ul>
						<!-- <li>#여행</li>
						<li>#태그</li> -->
					</ul>
				</div>
			</div>
		</div>
	</div>
</div>
<div id="write_wrap">
	<div class="container C">
		<div class="div_pdt"></div>
		
	</div>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyC6xArRw-nczVJ9vZLjCa-H1uSAE1PN3Ks"></script>	
	<div class="comment_container">
	    <div class="actionBox">
	        <ul id="commentList">
	            <li>
	            </li>
	        </ul>
	            <div class="form-group">
	                <input id="replyContent" name="content" class="form-control" type="text" placeholder="댓글을 입력하세요" />
	            </div>
	            <div class="form-group">
	                <button class="btn btn-default" id ="addBtn">등록</button>
	            </div>
	    </div>
	</div>
	
</div>