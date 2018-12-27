<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<%@ include file="/WEB-INF/include/head.jsp"%>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Blog Post - Start Bootstrap Template</title>
<!--공지사항 목록페이지 css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice.css">
<!--공지사항 목록페이지 모바일 css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice_mobile.css">

<!-- Bootstrap core CSS -->
<link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- Custom styles for this template -->
<link href="css/blog-post.css" rel="stylesheet">


</head>

<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>
	<!-- Navigation -->


	<!-- 1. 공지사항 상세페이지 전체영역 -->
	<div class="notice-detail-container">

		<!--2. 공지사항 머리말 -->
		<div class="notice-detail-type1">
			<h1>공지사항</h1>
		</div>
		<!--END 2. 공지사항 머리말 -->
		
		
		<!-- 3.공지사항 머리말 하단부분  -->
		<div class="notice-detail-type1-1">
			<span>
				<h3 id="notice-detail-title">공지제목</h3>
			</span>			
			<span>
				<a><h3>수정</h3></a>
			</span>
			<span>
				<a><h3>삭제</h3></a>
			</span>
			<span>
				<h5>2018-12-22</h5>
			</span>
		</div>
		<!--모바일 화면에만 나타나게-->
		<div class="notice-detail-type1-2">
			<span>
				<a>
				<img src="<%=request.getContextPath()%>/assets/img/notice-img/notice-detail-modify-button.PNG"></a>
			</span>
			<span>
				<a>
				<img src="<%=request.getContextPath()%>/assets/img/notice-img/notice-detail-delete-button.PNG"></a>
			</span>
		</div>
		<!-- END 3.공지사항 머리말 하단부분  -->



		<!--4. 공지사항 글 상세내용 -->
		<div class="notice-detail-type2-2">
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe
				quibusdam sit excepturi nam quia corporis eligendi eos magni
				recusandae laborum minus inventore?</p>

			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut,
				tenetur natus doloremque laborum quos iste ipsum rerum obcaecati
				impedit odit illo dolorum ab tempora nihil dicta earum fugiat.
				Temporibus, voluptatibus.</p>
		</div>
		<!--END 4. 공지사항 글 상세내용 -->
		
		<!--5. 이전, 다음, 목록 버튼-->
		<div class="notice-buttons">
			<input class="back-btn" type="button" value="이전"> 
			<input class="list-btn" type="button" value="목록">
			<input class="next-btn" type="button" value="다음">
		</div>
		<!--END 5. 이전, 다음, 목록 버튼-->

	</div>
	<!--END 1. 공지사항 상세페이지 전체영역 -->



	<!-- Bootstrap core JavaScript -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>
