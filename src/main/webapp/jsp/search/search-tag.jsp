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
	$j("input[name=searchWord]").on('keyup', function(event){
    	if(event.keyCode == 13 && $j(event.target).val().trim() != '') { // 스페이스바 입력시
    		console.log('검색');
    		$j("div.search-result").find("h2").css("display", "none");
    		$j("div.search-result").find("ul").css("display", "block");

    	};
	});
});
</script>
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>

	<div class="search-box">
		<input type="text" name="searchWord" placeholder="검색어 입력">
		<button id="searchBtn">
			<img src="<%=request.getContextPath()%>/assets/img/searchIcon.png">
		</button>
	</div>

	<!-- 탭 영역 시작 -->
	    <div class="search-tab-box">
        <ul class="nav nav-pills nav-pills-icons justify-content-center"
            role="tablist">
            <li class="nav-item"><a class="nav-link active" href="#studio"
                role="tab" data-toggle="tab">태그</a></li>
            <li class="nav-item"><a class="nav-link" href="#works"
                role="tab" data-toggle="tab">작성자</a></li>
            <li class="nav-item"><a class="nav-link" href="#favorite"
                role="tab" data-toggle="tab">내용</a></li>
            <li class="nav-item"><a class="nav-link" href="#favorite"
                role="tab" data-toggle="tab">여행지</a></li>
        </ul>
    </div>

    <!--검색 결과-->
    <div class="search-frame">
        <div class="search-result">
	        <h2>검색해주세요</h2>
        	<ul class="list_search_wrap" style="display:none;">
        		<li class="item_search_wrap">
        			<div class="item_search">
						<a href="#" class="link_sch_tag" data-search-keyword="오사카" onclick="nclk(this,'sea*p.auto','','');">
							<span class="sch_tag"><span class="sch_match_up">오사카</span></span>
							<span class="sch_count">14719</span>
						</a>
					</div>
        		</li>
        		<li class="item_search_wrap">
        			<div class="item_search">
						<a href="#" class="link_sch_tag" data-search-keyword="오사카여행" onclick="nclk(this,'sea*p.auto','','');">
							<span class="sch_tag"><span class="sch_match_up">오사카</span>여행</span>
							<span class="sch_count">5211</span>
						</a>
					</div>
        		</li>
        	</ul>
        </div>
    </div>

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>