<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<%@ include file="/WEB-INF/include/head.jsp" %>
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/diary/diaryList.css">
	<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/diary/diaryList_mobile.css">
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
  <!-- Preloader -->
    <%@ include file="/WEB-INF/include/preload.jsp" %>

    <!-- 헤더 -->
    <%@ include file="/WEB-INF/include/header.jsp" %>
    
    <!-- 내용 -->
<%-- 	<script src="${pageContext.request.contextPath}/assets/js/diary/image_resize.js"></script> --%>
    <%@ include file="/jsp/diary/diary.jsp" %>
    
	<!-- 푸터 -->
	 <%@ include file="/WEB-INF/include/footer.jsp" %>
 </body>
</html>