<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/head.jsp"%>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/searchPage/searchPage.css">
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/searchPage/searchPage_mobile.css">
	
<script>



$j(document).ready(function(){
	
	function search() {
		$j("div.search-result").find("h2").css("display", "none");
		$j("div.search-result").find("ul").css("display", "block");
		var word = $('#searchWord').val();
		var type = $('.nav-link.active').attr('id')
		alert(type)
	$.ajax({
		url : '${pageContext.request.contextPath}/search/' + type +'/' + word,
		dataType : 'json',
		success : function(data) {
			
			$('#searchList').empty();
			var i = 0;
			$(data).each(function() {
				console.log(data)
			var str = '<li class="item_search_wrap">'
			str += '<div class="item_search">'			
			str += '<a href="#" class="link_sch_tag" data-search-keyword="오사카">'
			str += '<span class="sch_tag"><span class="sch_match_up">'+ data[i] +'</span></span>'
			str += '</a>'
			str += '</div>'
			str += '<li>'
			
			i++;
			$('#searchList').append(str);
			})
			
			
		}, error : function(e) {
			alert(e)
		}
	})
		}
	
	$j("input[name=searchWord]").on('keyup', function(event){
    	if(event.keyCode == 13 && $j(event.target).val().trim() != '') { // 스페이스바 입력시
    		search();
    	};
	});
	
	$('#searchBtn').click(function() {
		search();
	})
	
	
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>

	<div class="search-box">
		<input type="text" name="searchWord" id="searchWord" placeholder="검색어 입력">
		<button id="searchBtn">
			<img src="<%=request.getContextPath()%>/assets/img/searchIcon.png">
		</button>
	</div>

	<!-- 탭 영역 시작 -->
	    <div class="search-tab-box">
        <ul class="nav nav-pills nav-pills-icons justify-content-center"
            role="tablist">
            <li class="nav-item"><a id="tag" class="nav-link active" href="#studio"
                role="tab" data-toggle="tab">태그</a></li>
            <li class="nav-item"><a id="writer" class="nav-link" href="#works"
                role="tab" data-toggle="tab">작성자</a></li>
            <li class="nav-item"><a id="content" class="nav-link" href="#favorite"
                role="tab" data-toggle="tab">내용</a></li>
            <li class="nav-item"><a id="spot" class="nav-link" href="#favorite"
                role="tab" data-toggle="tab">여행지</a></li>
        </ul>
 	   </div>

    <!--검색 결과-->
    <div class="search-frame">
        <div class="search-result">
	        <h2>검색해주세요</h2>
        	<ul id="searchList" class="list_search_wrap" style="display:none;">
        	
        	
        		<!-- <li class="item_search_wrap">
        			<div class="item_search">
						<a href="#" class="link_sch_tag" data-search-keyword="오사카" ">
							<span class="sch_tag"><span class="sch_match_up">오사카</span></span>
							<span class="sch_count">14719</span>
						</a>
					</div>
        		</li> -->
        		
        		
        	</ul>
        </div>
    </div>

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>