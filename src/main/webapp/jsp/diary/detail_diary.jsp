<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	

<script>

$(document).ready(function() {
	
	replyList()
	
	$('#addBtn').click(function() {
		var data = {
				diaryNo : 1,  //일단 임시로 diaryNo를 1로 해놈
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
		url : '${pageContext.request.contextPath}/reply/1', //일단 임시로 diaryNo를 1로 해놈
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
		
		<div class="content_datebox">
			<div><h4>1일차</h4></div>
			<div>2018.12.19</div>
		</div>
		<div class="content_box">
			<div class="content_editbox">
				<div class="img_wrap clr">
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/sinsekai.jpeg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/sinsekai2.jpeg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/himegi.jpeg" alt="">
					</div>
				</div>
				<p>여행일지 내용</p>	
			</div>
		</div>
		<div class="content_box">
			<div class="content_editbox">
				<div class="img_wrap clr">
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/sinsekai.jpeg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/sinsekai2.jpeg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/himegi.jpeg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/himegi.jpeg" alt="">
					</div>
				</div>
				<p>여행일지 내용</p>	
			</div>
		</div>
		<div class="content_box">
			<div class="content_editbox">
				<div class="img_wrap clr">
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/sinsekai.jpeg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/sinsekai2.jpeg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/himegi.jpeg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/sinsekai2.jpeg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/himegi.jpeg" alt="">
					</div>
				</div>
				<p>여행일지 내용</p>	
				<p>여행일지 내용</p>	
			</div>
		</div>
		<!--  -->
		<div class="content_datebox">
			<div><h4>2일차</h4></div>
			<div>2018.12.20</div>
		</div>
		<div class="content_box">
			<div class="content_editbox">
				<div class="img_wrap clr">
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/sinsekai.jpeg" alt="">
					</div>
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/sinsekai2.jpeg" alt="">
					</div>
				</div>
				<p>여행일지 내용</p>	
			</div>
		</div>
		<div class="content_box">
			<div class="content_editbox">
				<div class="img_wrap clr">
					<div class="img_content">
						<img class="picture" src="/Travel-Diary/assets/img/trip-img/sinsekai.jpeg" alt="">
					</div>
				</div>
				<p>여행일지 내용</p>	
			</div>
		</div>
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