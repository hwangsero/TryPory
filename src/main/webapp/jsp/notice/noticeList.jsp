<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/head.jsp"%>
<link rel="stylesheet"
	href="<%=request.getContextPath()%>/assets/css/notice/notice.css">
</head>
<body>
	<%@ include file="/WEB-INF/include/header.jsp"%>
	<div class="Notice-Box">
		<div class="type1-1">
			<h1>공지사항</h1>
		</div>

		<div class="type1-2">
			<span> 전체 3건 </span>
			<div class="search-box">
				<input type="text" placeholder="검색어 입력">
				<button>검색</button>
			</div>
		</div>

		<table class="type2">
			<thead>
				<tr>
					<th scope="cols">글번호</th>
					<th scope="cols">제목</th>
					<th scope="cols">날짜</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<th scope="row">1</th>
					<td><a href="<%=request.getContextPath()%>/jsp/notice/notice-detail.jsp">제목이 들어갑니다.</a></td>
					<td>2018/12/20</td>
				</tr>

				<tr>
					<th scope="row">2</th>
					<td><a href="<%=request.getContextPath()%>/jsp/notice/notice-detail.jsp">제목이 들어갑니다.</a></td>
					<td>2018/12/20</td>
				</tr>
				<tr>
					<th scope="row">3</th>
					<td><a href="<%=request.getContextPath()%>/jsp/notice/notice-detail.jsp">제목이 들어갑니다.</a></td>
					<td>2018/12/20</td>
				</tr>

				<tr>
					<th scope="row">4</th>
					<td><a href="<%=request.getContextPath()%>/jsp/notice/notice-detail.jsp">제목이 들어갑니다.</a></td>
					<td>2018/12/20</td>
				</tr>
			</tbody>
		</table>
	</div>

	<div class="paging">
		<ul>
		
			<c:forEach begin="${pageNo / 5}" end="" var="">
			<li><a href="#">1</a></li>
			</c:forEach>
		</ul>

		<a href="<%=request.getContextPath()%>/jsp/notice/notice-write.jsp"><button>글등록</button></a>
	</div>

	<%@ include file="/WEB-INF/include/footer.jsp"%>
</body>
</html>