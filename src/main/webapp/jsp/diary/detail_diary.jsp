<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>

$(document).ready(function() {
	
	replyList()
	
	$('#addBtn').click(function() {
		var data = {
				diaryNo : ${diary.no},  //일단 임시로 diaryNo를 1로 해놈
				content : $('#replyContent').val()
		}

		$.ajax({
			url : '${pageContext.request.contextPath}/reply',
			type : "post",
			data : data,
			success : function() {
				 $('#replyContent').val('')
				replyList();
			}, error : function(e) {
				alert('내용을 입력해주세요');
				$('#replyContent').focus();
			}
		})
	})
	
	$(document).on('click','.delBtn', function() {
		if(!confirm('댓글을 삭제하시겠습니까?')) return;
		var replyNo =$(this).attr('id');
		
		$.ajax({
			url : '${pageContext.request.contextPath}/reply/' + replyNo,
			type : 'delete',
			success : function() {
				$('#replyContent').val('')
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
				var img = $j("<img src='${pageContext.request.contextPath}/upload/" + image_list[image_index].fileName + "' />");
				$j(image_content).append(img);
				$j(image_wrap).append(image_content);
			});
		}
		$j(content_editbox).append(image_wrap);
		
		$j(content_editbox).append("<p id='content_text'>" + content_data.text + "</p>");
		content_box.append(content_editbox);
		
		content_list.push(content_box);
	});
	
});
console.log(content_list);

$j(document).ready(function(){
	for (var i = 0; i < content_list.length; i++) {
		var div = content_list[i];
		var last_element = $j("div#write_wrap div.container > div").last();
		$j(last_element).after(div);
	}
});
</script>

<div id="write_page_header" class="C">
	<div id="header_content">
		<div class="content_top_in">
			<div class="content_wrap">
				<div class="textarea_box">
					<h4 id="input_diary_title">오사카 여행일지</h4>
				</div>
				<div class="date_box">
					<i class="far fa-calendar-check fa-2x"></i> 
					<span>2018.12.15 ~ 2018.12.18</span>
				</div>
				
				<div class="tag_box">
					<ul>
						<li>#여행</li>
						<li>#태그</li>
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