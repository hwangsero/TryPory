<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/head.jsp"%>
<!--공지사항 상세페이지 css-->
<link rel="stylesheet" href="<%=request.getContextPath()%>/assets/css/notice/notice-detail.css">

<!-- Bootstrap core CSS -->
<!-- <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet"> -->

<!-- Custom styles for this template -->
<!-- <link href="css/blog-post.css" rel="stylesheet"> -->
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>
	<!-- Navigation -->

	<!-- Page Content -->
	<div class="notice-detail-container">

		<div class="notice-detail-type1">
			<!-- 공지사항 머리말 -->
			<h1>공지사항</h1>
			<!-- Author -->
			<p>공지제목</p>
		</div>

		<!-- Date/Time -->
		<div class="notice-detail-type1-1">2018-12-20</div>

		<!-- 공지사항 내용  -->
		<div class="nogice-detail-type2-1"></div>

		<!--공지사항 상세내용 -->
		<div class="nogice-detail-type2-2">
			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit.
				Ducimus, vero, obcaecati, aut, error quam sapiente nemo saepe
				quibusdam sit excepturi nam quia corporis eligendi eos magni
				recusandae laborum minus inventore?</p>

			<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ut,
				tenetur natus doloremque laborum quos iste ipsum rerum obcaecati
				impedit odit illo dolorum ab tempora nihil dicta earum fugiat.
				Temporibus, voluptatibus.</p>
		</div>

		<div class="notice-buttons">
			<input class="update-btn" type="button" value="수정">
			<input class="delete-btn" type="button" value="삭제">
		</div>

	</div>
	<!-- /.notice-detail-container -->

	<!-- Bootstrap core JavaScript -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>

</html>
