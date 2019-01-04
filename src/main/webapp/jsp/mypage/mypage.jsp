<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/head.jsp" %>
	
	<script src="${pageContext.request.contextPath}/assets/js/mypage.js"></script>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage.css">	
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/mypage_mobile.css">
	<script src="${pageContext.request.contextPath}/assets/js/diary/image_resize.js"></script>
	<script>
		$(function() {
		  $('.fa-heart')
		    .bind('click', function(event) {
		      $(this).toggleClass("fas");
		    })
		});
	</script>
</head>

<body>
	 <%@ include file="/WEB-INF/include/header.jsp" %>
	 <%@ include file="/jsp/mypage/mypage_section.jsp" %>
	 <%@ include file="/WEB-INF/include/footer.jsp" %>         
</body>
</html>