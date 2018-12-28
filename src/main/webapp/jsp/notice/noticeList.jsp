<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

	<!-- 1. 공지사항 전체영역 -->
	<div class="Notice-Box">
		<!--2. 공지사항 머리말-->
		<div class="type1-1">
			<h1>공지사항</h1>
			<h2>
				전체<span>3</span>건
			</h2>
		</div>
		<!--END 2. 공지사항 머리말  -->

		<!--3. 공지사항 머리말 하단-->
		<div class="type1-2">

			<div class="notice-write-btn">
				<a href="<%=request.getContextPath()%>/jsp/notice/notice-write.jsp">
					<img
					src="<%=request.getContextPath()%>/assets/img/notice-img/notice_write_button-01.png">
					<h2>글쓰기</h2>
				</a>
			</div>


			<div class="search-box">
				<input type="text" placeholder="검색어 입력">
				<button>
					<h2>검색</h2>
				</button>
			</div>
		</div>
		<!--END 3.공지사항 머리말 하단-->

		<!--4. 공지사항 테이블 -->
		<table class="type2">
			<thead>
				<tr>
					<th scope="cols">번호</th>
					<th scope="cols">제목</th>
					<th scope="cols">날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td><a
						href="<%=request.getContextPath()%>/jsp/notice/notice-detail.jsp">내용이
							들어갑니다.</a></td>
					<td>2018/12/20</td>
				</tr>

				<tr>
					<th scope="row">2</th>
					<td><a
						href="<%=request.getContextPath()%>/jsp/notice/notice-detail.jsp">내용이
							들어갑니다.</a></td>
					<td>2018/12/20</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td><a
						href="<%=request.getContextPath()%>/jsp/notice/notice-detail.jsp">내용이
							들어갑니다.</a></td>
					<td>2018/12/20</td>
				</tr>

				<tr>
					<th scope="row">4</th>
					<td><a
						href="<%=request.getContextPath()%>/jsp/notice/notice-detail.jsp">내용이
							들어갑니다.</a></td>
					<td>2018/12/20</td>
				</tr>
			</tbody>
		</table>
	</div>


		<!--5. 페이징 번호 관련-->
		<div class="paging">
			<ul>
			
				<c:forEach begin="${pageNo / 5}" end="" var="">
				<li><a href="#">1</a></li>
				</c:forEach>
			</ul>
		</div>
		<!--END 5. 페이징 번호 관련 -->
	<!--END 1. 공지사항 전체영역 -->
	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>