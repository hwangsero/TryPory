<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<script>
$j(document).ready(function(){
	var list_wrap = $j("div.tab-pane.active");
	var diaryList = ${diaryListJ}; 
	var is_scroll = false; // 무한스크롤 로딩 중인지
	
	/* ///////////////////////////////////////다이어리 불러오기//////////////////////////////////// */
	function append_diary(diary){
		console.log(diary);
		
		 var str = '<div class="diary_post" data-no="' + diary.no + '">';
				str += '<div class="profile_area">';
					str += '<div class="profile_wrap">';
						str += '<a href="/my/4550316/profile" class="link_profile" title="계정 상세페이지">';
							str += '<span class="profile_thumb">';
								str += '<img class="thumb_default" src="https://img-pholar.pstatic.net/20171231_163/1514678074152X9488_JPEG/miya1220.jpg?type=fn80_80">';
								str += '<span class="profile_thumb_mask"></span>';
							str += '</span>';
							str += '<span class="profile_name">' + diary.writer + '</span>';
							str += '<em class="data_date">2일 전</em>';
						str += '</a>';
	        
						if( diary.addr != undefined ){
							str += '<span class="location">';
								str += '<a>';
									str += '<i class="fas fa-map-marker-alt location_name"></i>' + diary.addr;
								str += '</a>';
							str += '</span>';
						}
					str += '</div>';
				str += '</div>';
	
				str += '<div class="trending-now-posts mb-30 img_posts">';
					str += '<div style="margin-bottom: 10px; font-size: 20px;">';
						str += '<h5>' + diary.title + '</h5>';
						var tags = diary.tag;
						if(tags != undefined) {
							str += '<b>'; 
							tags = tags.split(', ');
							for (var i = 0; i < tags.length; i++) {
								var tag = tags[i];
								str += '<a href="#" class="diary_tag" data-tag="' + tag + '">#'+ tag + '</a>';
							}
						
							str += '</b>';
						}
					str += '</div>';
		
					str += '<div class="trending-posts img_wrap clr">';
						var img_contents = JSON.parse(diary.content);
						$j(img_contents).each(function(date_index){
							var date_contents = img_contents[date_index].content;
							for (var i = 0; i < date_contents.length; i++) {
								var images = date_contents[i].images;
								if( images != undefined ){
									for (var j = 0; j < images.length; j++) {
										str += '<div class="img_content">';
											str += '<img src="https://i.imgur.com/' + images[j].fileName + '.jpg" alt="">';
										str += '</div>';
									}
								}
							}
						});
						
					str += '</div>';
		
					str += '<div class="img_snsBtn">';
						str += '<div class="heart">';
							str += '<img src ="${pageContext.request.contextPath}/assets/img/heart-off.png" class="heart-img">'; 
							str += '<span class="like-count">' + + diary.likeCnt + '</span>';
						str += '</div>';
						str += '<div class="comment">';
							str += '<i class="far fa-comment-dots fa-2x"></i>'; 
							str += '<span>' + diary.comment_cnt + '</span>';
						str += '</div>';
					str += '</div>'
				str += '</div>';
			str += '</div>';
			
		list_wrap.append(str);
	}
	
	for (var i = 0; i < diaryList.length; i++) {
		append_diary( diaryList[i] );
	}
	/* ///////////////////////////////////////무한스크롤//////////////////////////////////// */
	var start = 6;
	var end = 10;
	$(window).scroll(function() {
	    if ($(window).scrollTop() == $(document).height() - $(window).height() && !is_scroll )  {
	    	is_scroll = true;
	    	var data;
	    	if( '${keyword}' != '' && '${type}' != '') {
	    		data = {
    				start : start,
	    			end : end,
	    			keyword : '${keyword}',
	    			type : '${type}'
	    		}
	    	} else {
	    		data = {
	    				start : start,
		    			end : end
	    		}
	    	}
	    	$j.ajax({
	    		url : '${pageContext.request.contextPath}/diary/list', //일단 임시로 diaryNo를 1로 해놈
	    		dataType: 'json',
	    		data : data,
	    		success : function(data) {
	    			if( data != undefined ){
		    			for (var i = 0; i < data.length; i++) {
		    				append_diary( data[i] );
		    			}
		    			start += 5;
		    			end += 5;
	    			}
	    		}
	      	});
	      	is_scroll = false;
	    }
	});
	
	/* ///////////////////////////////////////이벤트//////////////////////////////////// */
	$j("a.diary_tag").click(function(e){
		e.stopPropagation();
		location.href= window.ctx + '/diary?keyword=' + $j(this).data('tag') +'&type=tag';
	});
	
	$j(list_wrap).on('click', 'div.diary_post', function(e){
		var no = $j(this).data('no');
		location.href= window.ctx + '/diary/' + no;
	});
	$j(list_wrap).on('click', '.heart-img', function(e){
		e.stopPropagation();
		alert('heart');
	});
	
});
</script>
<section class="mag-posts-area d-flex flex-wrap tab-content tab-space">
	<c:if test="${keyword} not empty and ${type} not empty">
	<div class="search_box">
		<span class="search_keyword">'${ keyword }'</span>로 검색한 결과입니다
	</div>
	</c:if>
	<div class="diary_container tab-content tab-space">
		<div class="select_box">
			<select>
				<option value="최신순" selected="selected">최신순</option>
				<option value="인기순">인기순</option>
			</select>
		</div>
		<div class="tab-pane active" id="lately">
			
		</div>
	</div>
</section>