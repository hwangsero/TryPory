<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%@ include file="/WEB-INF/include/head.jsp" %>
<link rel="stylesheet"	href="<%=request.getContextPath()%>/assets/css/notice.css">
</head>
.  
<body>
<%@ include file="/WEB-INF/include/header.jsp" %>
	<div class="Notice-Box">
		<%@ include file="/WEB-INF/include/notice-aside.jsp"%>
		<div class="notice-board">
			<table class="type1">
			<tr>
				<th><h5>홈>공지사항>공지 게시판</h5></th>
			</tr>
			
			<tr>
				<th><h2>공지사항</h2></th>
			</tr>
			
			<tr>
				<th><h5>전체 3건</h5></th>
			</tr>
			</table>
			
			<table class="type2">
				<thead>
					<tr>
						<th scope="cols">타이틀</th>
						<th scope="cols">내용</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">항목명</th>
						<td>내용이 들어갑니다.</td>
					</tr>
					<tr>
						<th scope="row" class="even">항목명</th>
						<td class="even">내용이 들어갑니다.</td>
					</tr>
					<tr>
						<th scope="row">항목명</th>
						<td>내용이 들어갑니다.</td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="/WEB-INF/include/footer.jsp" %>
</body>
</html>