<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/WEB-INF/include/head.jsp"%>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/searchPage/searchPage.css">
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
						<li class="nav-item">
							<a class="nav-link active" href="#studio" role="tab" data-toggle="tab">태그</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#works"	role="tab" data-toggle="tab">작성자</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#favorite" role="tab" data-toggle="tab">내용</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="#favorite" role="tab" data-toggle="tab">여행지</a>
						</li>
					</ul> 
					
				</div>

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>




