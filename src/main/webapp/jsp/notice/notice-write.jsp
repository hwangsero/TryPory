<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/head.jsp"%>
<!--공지사항 목록페이지 css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice.css">
<!--공지사항 목록페이지 모바일 css-->
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice_mobile.css">

</head>

<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>

	<!--1. 공지사항 글 등록 전체영역 -->
	<div class="notice-write-container">

		<!--2. 공지사항 글 등록 페이지 머리말-->
		<div class="notice-write-type1">
			<h1>공지사항 등록</h1>
		</div>
		<!--END 2. 공지사항 글 등록 페이지 머리말-->

		<!--3. 공지사항 글 등록 폼 -->
		<div class="notice-write-type2">
			<form method="post"
				action="<%= request.getContextPath() %>/board/write.do?proNo=${ param.proNo }&type=${ param.type }"
				onsubmit="return checkForm()" name="wForm" class="write_form">
				<div class="notice-write-type2-1">
					<div class="notice-write-type2-1_date">
						<h2>현재 날짜로 입력됩니다.</h2>
					</div>

					<div class="notice-write-type2-1_writer">
						<span><h2>작성자</h2></span>
					</div>

				</div>

				<div class="notice-write-type2-2">

					<div class="notice-write-type2-2_title">
						<h2>제목을 입력하세요</h2>
					</div>
					<input></input>

					<div class="notice-write-type2-2_context">
						<h2>내용을 입력하세요</h2>
					</div>
					<textarea></textarea>
				</div>

				<!--4. 공지사항 글등록 버튼 -->
				<div class="notice-write-type2-btn">
					<input type="button" value="초기화" onclick="history.go(-1)">
					<input type="submit" value="등록">
				</div>
				<!--END 4. 공지사항 글등록 버튼 -->
			</form>
		</div>
		<!--END 3. 공지사항 글 등록 폼 -->
	</div>
	<!--END 1. 공지사항 글 등록 전체영역 -->

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>